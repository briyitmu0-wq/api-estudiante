# Contenido para informe_entrega1.pdf (Entrega 1 · QR Café)

Pega cada bloque en su sección de `COM32_proyecto_documento_plantilla.docx`. Lo marcado con **[CONFIRMAR]** depende del negocio real o del grupo: reemplázalo con lo que sea cierto antes de exportar.

## Registro del grupo
| Dato | Valor |
|---|---|
| Número de grupo | **[CONFIRMAR]** |
| Negocio, en una frase | Cafetería de barrio en Barranquilla que recibe pedidos digitales por código QR en cada mesa **[CONFIRMAR ciudad y tipo de local]** |
| Nombre del espacio de trabajo en APEX | **[CONFIRMAR]** |
| Dirección del espacio de trabajo | **[CONFIRMAR]** |
| Esquema donde se ejecutan los scripts | **[CONFIRMAR]** |

Título del proyecto: **Capa PL/SQL de Prototipo QR Café: sistema web de pedidos digitales**

## 1.1 · Qué hace el negocio
Cafetería de barrio **[CONFIRMAR]** que vende cafés, jugos, panadería y fritos típicos a clientes que consumen en el local, en salón, terraza y barra. Hoy el mesero toma el pedido de forma verbal o en papel y lo lleva a cocina; el inventario de productos e ingredientes se revisa a mano **[CONFIRMAR cómo lo registran hoy]**. El prototipo QR Café coloca un código QR en cada mesa: el cliente lo escanea, ve el menú y envía su pedido, que queda asociado a esa mesa.

## 1.2 · Qué resuelve el sistema
Apoya decisiones como qué productos reponer, qué mesas están ocupadas y cuánto lleva consumido cada mesa. Evita errores como ofrecer un producto agotado, mezclar pedidos de dos mesas, cobrar un total mal sumado o pedir cantidades absurdas por una línea.

| Proceso del negocio | Datos que genera | Tablas donde se guardan |
|---|---|---|
| Armar y mantener el menú | Categorías, productos, precios, existencias | categoria, producto |
| Controlar la materia prima | Ingredientes, stock, mínimos, recetas | ingrediente, receta |
| Identificar la mesa por QR | Zona, capacidad, código QR único, estado | mesa |
| Tomar y seguir el pedido | Pedido por mesa, estado, líneas con cantidad y precio | pedido, detalle_pedido |

## 1.3 · Problema y justificación
Cuando el pedido se toma de forma verbal o en papel, la información se registra tarde y con errores: se ofrecen productos que ya no hay, se pierde la mesa de origen y el total se calcula a mano **[CONFIRMAR con el responsable del negocio]**. Resolverlo en la base de datos permite que las reglas (existencias, código QR único, tope de unidades, un solo pedido activo por mesa) las haga cumplir el motor mediante llaves y restricciones, sin depender de que cada mesero las recuerde. Fuente: entrevista al responsable del negocio **[CONFIRMAR fecha y nombre del cargo]** y documentación de Oracle sobre restricciones de integridad (ver sección 13).

## 1.4 · Objetivos
| Objetivo | Enunciado medible | Entrega |
|---|---|---|
| General | Implementar en Oracle la base de datos de QR Café que registre menú, mesas, pedidos e inventario con las reglas del negocio garantizadas por el motor | E1 · E2 · Final |
| Específico 1 | Crear 7 tablas con PK, FK, UNIQUE, CHECK y DEFAULT y poblarlas con al menos 15 filas cada una, incluidos casos límite | E1 |
| Específico 2 | Verificar con 6 bloques PL/SQL que cada regla R01 a R06 muestra el resultado esperado declarado | E1 |
| Específico 3 | Programar procedimientos, funciones y cursores que registren pedidos y produzcan un reporte de ventas por mesa | E2 |

## 2.1 · Diagrama relacional
Captura sugerida: en APEX, SQL Workshop > Utilities > Schema Viewer, con las 7 tablas, después de ejecutar 01_esquema.sql. Debe verse que `detalle_pedido` tiene PK compuesta.

## 2.1 · Tabla de relaciones
| Relación | Tablas | Tipo | Cómo se implementa |
|---|---|---|---|
| 1:N | categoria → producto; mesa → pedido; pedido → detalle_pedido | Una a muchos | FK en la tabla hija: fk_producto_categoria, fk_pedido_mesa, fk_detalle_pedido_pedido |
| N:M | producto ↔ ingrediente | Muchos a muchos | Tabla intermedia receta, PK compuesta (id_producto, id_ingrediente), con la cantidad de cada ingrediente |
| Entidad débil | detalle_pedido | Depende de pedido | PK compuesta (id_pedido, linea); FK a pedido con ON DELETE CASCADE |

## 2.2 · Diccionario de datos
| Tabla | Columna | Tipo | Restricción | Para qué sirve |
|---|---|---|---|---|
| categoria | id_categoria | NUMBER(6) | PK | Identifica la categoría |
| categoria | nombre | VARCHAR2(40) | NOT NULL, UNIQUE | Nombre visible en el menú |
| categoria | estado | VARCHAR2(10) | NOT NULL, DEFAULT 'ACTIVO', CHECK ACTIVO/INACTIVO | Muestra u oculta la categoría |
| producto | id_producto | NUMBER(6) | PK | Identifica el producto |
| producto | id_categoria | NUMBER(6) | NOT NULL, FK a categoria | Categoría a la que pertenece |
| producto | nombre | VARCHAR2(60) | NOT NULL, UNIQUE | Nombre en el menú |
| producto | precio | NUMBER(8) | NOT NULL, CHECK > 0 | Precio vigente en pesos |
| producto | existencias | NUMBER(5) | NOT NULL, DEFAULT 0, CHECK >= 0 | Unidades disponibles |
| producto | estado | VARCHAR2(12) | NOT NULL, DEFAULT 'DISPONIBLE', CHECK DISPONIBLE/AGOTADO/INACTIVO | Si se ofrece en el menú QR |
| ingrediente | id_ingrediente | NUMBER(6) | PK | Identifica la materia prima |
| ingrediente | nombre | VARCHAR2(40) | NOT NULL, UNIQUE | Nombre del ingrediente |
| ingrediente | unidad | VARCHAR2(5) | NOT NULL, CHECK KG/LT/UND | Unidad de medida |
| ingrediente | stock_actual | NUMBER(8,2) | NOT NULL, DEFAULT 0, CHECK >= 0 | Cantidad en bodega |
| ingrediente | stock_minimo | NUMBER(8,2) | NOT NULL, DEFAULT 0, CHECK >= 0 | Nivel que dispara la reposición |
| receta | id_producto | NUMBER(6) | PK compuesta, NOT NULL, FK a producto | Producto que lleva el ingrediente |
| receta | id_ingrediente | NUMBER(6) | PK compuesta, NOT NULL, FK a ingrediente | Ingrediente usado |
| receta | cantidad | NUMBER(8,3) | NOT NULL, CHECK > 0 | Cantidad por unidad de producto |
| mesa | id_mesa | NUMBER(6) | PK | Identifica la mesa |
| mesa | zona | VARCHAR2(10) | NOT NULL, CHECK SALON/TERRAZA/BARRA | Zona del local |
| mesa | capacidad | NUMBER(2) | NOT NULL, CHECK entre 1 y 12 | Personas que caben |
| mesa | codigo_qr | VARCHAR2(20) | NOT NULL, UNIQUE | Código impreso en el QR de la mesa |
| mesa | estado | VARCHAR2(10) | NOT NULL, DEFAULT 'LIBRE', CHECK LIBRE/OCUPADA/INACTIVA | Disponibilidad de la mesa |
| pedido | id_pedido | NUMBER(6) | PK | Identifica el pedido |
| pedido | id_mesa | NUMBER(6) | NOT NULL, FK a mesa | Mesa desde donde se pidió |
| pedido | fecha_hora | DATE | NOT NULL | Momento del pedido |
| pedido | estado | VARCHAR2(15) | NOT NULL, DEFAULT 'ABIERTO', CHECK ABIERTO/EN_PREPARACION/ENTREGADO/PAGADO/CANCELADO | Avance del pedido |
| pedido | observaciones | VARCHAR2(100) | Admite nulo | Nota del cliente |
| detalle_pedido | id_pedido | NUMBER(6) | PK compuesta, NOT NULL, FK a pedido (ON DELETE CASCADE) | Pedido al que pertenece la línea |
| detalle_pedido | linea | NUMBER(3) | PK compuesta, NOT NULL, CHECK > 0 | Número de línea dentro del pedido |
| detalle_pedido | id_producto | NUMBER(6) | NOT NULL, FK a producto | Producto pedido |
| detalle_pedido | cantidad | NUMBER(2) | NOT NULL, DEFAULT 1, CHECK entre 1 y 10 | Unidades de la línea |
| detalle_pedido | precio_unitario | NUMBER(8) | NOT NULL, CHECK > 0 | Precio cobrado al momento de pedir |

## 2.3 · Normalización
El esquema está en tercera forma normal: cada tabla guarda hechos de una sola entidad y los atributos dependen de la llave completa (en `detalle_pedido` y `receta`, de la llave compuesta). El total del pedido no se guarda: se calcula con SUM(cantidad × precio_unitario), así no puede quedar desactualizado. Hay una desnormalización deliberada: `precio_unitario` se copia en `detalle_pedido` para que un cambio posterior de precio en `producto` no altere pedidos ya hechos.

## 3 · Catálogo de reglas de negocio
| Regla | Enunciado | Tablas | Implementada en | Script | Entrega | Responsable |
|---|---|---|---|---|---|---|
| R01 | Producto con existencias en 0 está AGOTADO y no se ofrece en el menú | producto | CHECK de existencias y estado + bloque | 01 y 03 | E1 | **[CONFIRMAR]** |
| R02 | El valor del pedido es la suma de cantidad × precio_unitario | pedido, detalle_pedido | Bloque (en E2, función) | 03 | E1 | **[CONFIRMAR]** |
| R03 | Cada mesa tiene un código QR único | mesa | UNIQUE uq_mesa_codigo_qr + bloque | 01 y 03 | E1 | **[CONFIRMAR]** |
| R04 | Máximo 10 unidades por línea | detalle_pedido | CHECK ck_detalle_pedido_cantidad + bloque | 01 y 03 | E1 | **[CONFIRMAR]** |
| R05 | Ingrediente con stock igual o menor al mínimo debe reponerse | ingrediente | Bloque (en E2, cursor de reporte) | 03 | E1 | **[CONFIRMAR]** |
| R06 | Una mesa no tiene más de un pedido activo a la vez | pedido | Bloque (en el final, disparador de validación) | 03 | E1 | **[CONFIRMAR]** |

## 4 · Bloques de validación
| Regla | Técnicas PL/SQL que usa | Resultado esperado | Resultado obtenido |
|---|---|---|---|
| R01 | %TYPE, constante c_umbral, SELECT INTO | R01 · agotados=2 · inconsistentes=0 · menor existencia=Flan de caramelo | **[pegar de APEX]** |
| R02 | %TYPE, constante c_pedido, SELECT INTO | R02 · pedido 1003 · estado=PAGADO · líneas=3 · total=37500 | **[pegar de APEX]** |
| R03 | %TYPE, constante c_mesa, SELECT INTO | R03 · mesas=16 · códigos distintos=16 · mesa 7=QRC-M07-E94D | **[pegar de APEX]** |
| R04 | %TYPE, constante c_max_cantidad, SELECT INTO | R04 · cantidad máxima=10 · líneas sobre el tope=0 | **[pegar de APEX]** |
| R05 | %TYPE, SELECT INTO | R05 · por reponer=3 · sin stock=1 · agotado=Pulpa de maracuyá | **[pegar de APEX]** |
| R06 | %TYPE, constantes c_max_activos y c_pedido, SELECT INTO | R06 · pedidos activos=2 · mesas con más de 1 activo=0 · pedido 1019 en mesa 9 | **[pegar de APEX]** |

4.1 · Salida obtenida: pega como texto lo que muestre APEX al correr 03_validaciones.sql (no imagen).

## 11 · Instalación
| Orden | Script | Dónde se ejecuta | Qué crea o carga |
|---|---|---|---|
| 1 | 00_limpiar.sql | APEX · SQL Scripts | Elimina las 7 tablas si existen (la primera vez da ORA-00942, se ignora) |
| 2 | 01_esquema.sql | APEX · SQL Scripts | Crea las 7 tablas con sus restricciones |
| 3 | 02_datos.sql | APEX · SQL Scripts | Carga 165 filas y hace COMMIT |
| 4 | 03_validaciones.sql | APEX · SQL Commands | Ejecuta los 6 bloques R01 a R06 |

## 12 · Participación
Reparte R01 a R06 entre los integrantes y anótalo aquí. **[CONFIRMAR]**

## 13 · Fuentes y uso de herramientas de IA
| Fuente | Enlace o referencia | Qué respalda |
|---|---|---|
| Oracle Database SQL Language Reference 23, «Constraint» | https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/constraint.html | PK compuesta, FK y ON DELETE CASCADE, tipos de restricción |
| Entrevista al responsable del negocio | **[CONFIRMAR fecha y cargo]** | Cómo se registran hoy los pedidos y el inventario |

Uso de IA: se usó Claude (Anthropic) para proponer el modelo de datos, redactar los scripts 00 a 03 y la propuesta de textos. **[Ajusta a lo que el grupo hizo]** El grupo verificó ejecutando los cuatro scripts en APEX y comparando la salida con el resultado esperado de cada regla.
