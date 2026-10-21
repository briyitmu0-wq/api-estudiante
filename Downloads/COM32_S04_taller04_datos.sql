/* =============================================================================
   COM32 · Taller 04 · Script de datos
   Se ejecuta UNA vez en FreeSQL (freesql.com), completo, antes del punto 1.
   Si necesita empezar de nuevo, ejecute primero:  DROP TABLE libros PURGE;
   y vuelva a ejecutar este script.
   ========================================================================== */

CREATE TABLE libros (
  codigo        NUMBER(4)    PRIMARY KEY,
  titulo        VARCHAR2(40) NOT NULL,
  categoria     VARCHAR2(20) NOT NULL,
  ejemplares    NUMBER(3)    NOT NULL,
  disponibles   NUMBER(3)    NOT NULL,
  precio        NUMBER(8,2)  NOT NULL,
  fecha_ingreso DATE         NOT NULL,
  CONSTRAINT ck_libros_disponibles CHECK (disponibles BETWEEN 0 AND ejemplares)
);

INSERT INTO libros VALUES (101, 'Fundamentos de bases de datos', 'Bases de datos',      4, 2,  85000, DATE '2024-02-12');
INSERT INTO libros VALUES (102, 'Programación en PL/SQL',        'Bases de datos',      3, 0, 120000, DATE '2025-03-03');
INSERT INTO libros VALUES (103, 'Oracle: programación avanzada', 'Bases de datos',      2, 1, 145500, DATE '2025-08-20');
INSERT INTO libros VALUES (104, 'Redes de computadores',         'Redes',               5, 5,  98000, DATE '2023-07-14');
INSERT INTO libros VALUES (105, 'Seguridad en redes',            'Redes',               2, 1,  76000, DATE '2024-09-02');
INSERT INTO libros VALUES (106, 'Administración de servidores',  'Redes',               3, 0, 110000, DATE '2025-01-27');
INSERT INTO libros VALUES (107, 'Sistemas operativos modernos',  'Sistemas operativos', 4, 3, 132000, DATE '2023-11-06');
INSERT INTO libros VALUES (108, 'Introducción a Linux',          'Sistemas operativos', 3, 3,  54000, DATE '2026-02-16');
COMMIT;

SELECT * FROM libros ORDER BY codigo;
-- Debe mostrar 8 filas.
