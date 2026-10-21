-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-08-2026 a las 18:13:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_vacunacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_usuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_usuario`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id_auditoria` int(11) NOT NULL,
  `tipo_accion` enum('CREAR','EDITAR','ELIMINAR','CONSULTAR') NOT NULL,
  `tabla_afectada` varchar(100) NOT NULL,
  `fecha_accion` datetime NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `datos_anteriores` text DEFAULT NULL,
  `datos_nuevos` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`id_auditoria`, `tipo_accion`, `tabla_afectada`, `fecha_accion`, `id_usuario`, `datos_anteriores`, `datos_nuevos`) VALUES
(1, 'EDITAR', 'ciudadano', '2026-08-17 17:15:51', 2, '{\"apellido\":\"Martínez\",\"cargo\":null,\"contrasena\":null,\"direccion\":\"Crr6b#89-987\",\"email\":\"ana.perez@email.local\",\"estado\":null,\"fechaNacimiento\":\"1995-04-15\",\"genero\":\"FEMENINO\",\"id\":5,\"nombre\":\"Ana\",\"numeroDocumento\":\"1045678901\",\"telefono\":\"3135162743\",\"tipoDocumento\":\"CC\",\"tipoUsuario\":null}', '{\"apellido\":\"Martínez\",\"cargo\":null,\"contrasena\":null,\"direccion\":\"Crr6b#89-987\",\"email\":\"ana.perez@email.local\",\"estado\":null,\"fechaNacimiento\":\"1995-04-15\",\"genero\":\"FEMENINO\",\"id\":5,\"nombre\":\"Ana\",\"numeroDocumento\":\"1045678901\",\"telefono\":\"313516234\",\"tipoDocumento\":\"CC\",\"tipoUsuario\":null}'),
(2, 'CREAR', 'ciudadano', '2026-08-17 17:17:59', 2, NULL, '{\"apellido\":\"cossio\",\"cargo\":null,\"contrasena\":null,\"direccion\":\"calle72b#76-293\",\"email\":\"jefersoncossio@gmail.com\",\"estado\":\"ACTIVO\",\"fechaNacimiento\":\"2026-07-17\",\"genero\":\"MASCULINO\",\"id\":21,\"nombre\":\"jefferson\",\"numeroDocumento\":\"10442235454\",\"telefono\":\"3135678374\",\"tipoDocumento\":\"CC\",\"tipoUsuario\":null}'),
(3, 'EDITAR', 'personal_salud', '2026-08-17 18:46:45', 1, '\"Estado anterior: ACTIVO\"', '\"Estado nuevo: INACTIVO\"'),
(4, 'EDITAR', 'personal_salud', '2026-08-17 18:46:46', 1, '\"Estado anterior: INACTIVO\"', '\"Estado nuevo: ACTIVO\"'),
(5, 'EDITAR', 'personal_salud', '2026-08-17 18:46:46', 1, '\"Estado anterior: ACTIVO\"', '\"Estado nuevo: INACTIVO\"'),
(6, 'EDITAR', 'personal_salud', '2026-08-17 18:46:47', 1, '\"Estado anterior: INACTIVO\"', '\"Estado nuevo: ACTIVO\"'),
(7, 'EDITAR', 'personal_salud', '2026-08-17 18:47:17', 1, '{\"apellido\":\"Padilla\",\"cargo\":\"Doctora\",\"contrasena\":null,\"direccion\":\"calle76c#05-03\",\"email\":\"marianapadilla@gmail.com\",\"estado\":\"ACTIVO\",\"fechaNacimiento\":null,\"genero\":null,\"id\":19,\"nombre\":\"Mariana\",\"numeroDocumento\":\"1293474394\",\"telefono\":\"3135123064\",\"tipoDocumento\":\"CC\",\"tipoUsuario\":null}', '{\"apellido\":\"Padilla\",\"cargo\":\"Doctora\",\"contrasena\":null,\"direccion\":\"calle76c#05-03\",\"email\":\"marianaaltahona@gmail.com\",\"estado\":\"ACTIVO\",\"fechaNacimiento\":null,\"genero\":null,\"id\":19,\"nombre\":\"Mariana\",\"numeroDocumento\":\"1293474394\",\"telefono\":\"3135123064\",\"tipoDocumento\":\"CC\",\"tipoUsuario\":null}'),
(8, 'EDITAR', 'vacuna', '2026-08-18 01:10:51', 1, '{\"codigo\":\"VAC-002\",\"dosisTotales\":1,\"estado\":\"ACTIVA\",\"fabricante\":\"Laboratorios XYZ\",\"id\":2,\"nombre\":\"BCG\",\"temperaturaAlmacenamiento\":4.5,\"viaAdministracion\":\"Intradermica\"}', '{\"codigo\":\"VAC-002\",\"dosisTotales\":1,\"estado\":\"ACTIVA\",\"fabricante\":\"Laboratorios XYZ\",\"id\":2,\"nombre\":\"BCG\",\"temperaturaAlmacenamiento\":3.0,\"viaAdministracion\":\"Intradermica\"}'),
(9, 'EDITAR', 'vacuna', '2026-08-18 01:11:22', 1, '{\"codigo\":\"VAC-002\",\"dosisTotales\":1,\"estado\":\"ACTIVA\",\"fabricante\":\"Laboratorios XYZ\",\"id\":2,\"nombre\":\"BCG\",\"temperaturaAlmacenamiento\":3.0,\"viaAdministracion\":\"Intradermica\"}', '{\"codigo\":\"VAC-002\",\"dosisTotales\":1,\"estado\":\"ACTIVA\",\"fabricante\":\"Laboratorios XYZ\",\"id\":2,\"nombre\":\"BCG\",\"temperaturaAlmacenamiento\":4.5,\"viaAdministracion\":\"Intradermica\"}'),
(10, 'EDITAR', 'vacuna', '2026-08-18 02:16:18', 1, '{\"codigo\":\"VAC-002\",\"dosisTotales\":1,\"estado\":\"ACTIVA\",\"fabricante\":\"Laboratorios XYZ\",\"id\":2,\"nombre\":\"BCG\",\"temperaturaAlmacenamiento\":4.5,\"viaAdministracion\":\"Intradermica\"}', '{\"codigo\":\"VAC-002\",\"dosisTotales\":1,\"estado\":\"ACTIVA\",\"fabricante\":\"Laboratorios XYZ\",\"id\":2,\"nombre\":\"BCG\",\"temperaturaAlmacenamiento\":3.0,\"viaAdministracion\":\"Intradermica\"}'),
(11, 'EDITAR', 'vacuna', '2026-08-18 02:16:40', 1, '{\"codigo\":\"VAC-002\",\"dosisTotales\":1,\"estado\":\"ACTIVA\",\"fabricante\":\"Laboratorios XYZ\",\"id\":2,\"nombre\":\"BCG\",\"temperaturaAlmacenamiento\":3.0,\"viaAdministracion\":\"Intradermica\"}', '{\"codigo\":\"VAC-002\",\"dosisTotales\":1,\"estado\":\"ACTIVA\",\"fabricante\":\"Laboratorios XYZ\",\"id\":2,\"nombre\":\"BCG\",\"temperaturaAlmacenamiento\":4.5,\"viaAdministracion\":\"Intradermica\"}'),
(12, 'EDITAR', 'personal_salud', '2026-08-18 02:17:02', 1, '\"Estado anterior: ACTIVO\"', '\"Estado nuevo: INACTIVO\"'),
(13, 'EDITAR', 'ciudadano', '2026-08-18 02:19:13', 2, '{\"apellido\":\"Martínez\",\"cargo\":null,\"contrasena\":null,\"direccion\":\"Crr6b#89-987\",\"email\":\"ana.perez@email.local\",\"estado\":null,\"fechaNacimiento\":\"1995-04-15\",\"genero\":\"FEMENINO\",\"id\":5,\"nombre\":\"Ana\",\"numeroDocumento\":\"1045678901\",\"telefono\":\"313516234\",\"tipoDocumento\":\"CC\",\"tipoUsuario\":null,\"ultimaVacunaAplicada\":\"BCG Actualizada\"}', '{\"apellido\":\"Martínez\",\"cargo\":null,\"contrasena\":null,\"direccion\":\"Crr6b#89-987\",\"email\":\"ana.altamar@email.local\",\"estado\":null,\"fechaNacimiento\":\"1995-04-15\",\"genero\":\"FEMENINO\",\"id\":5,\"nombre\":\"Ana\",\"numeroDocumento\":\"1045678901\",\"telefono\":\"313516234\",\"tipoDocumento\":\"CC\",\"tipoUsuario\":null,\"ultimaVacunaAplicada\":\"BCG Actualizada\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE `ciudadano` (
  `id_usuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudadano`
--

INSERT INTO `ciudadano` (`id_usuario`) VALUES
(5),
(14),
(15),
(16),
(17),
(18),
(20),
(21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `esquema_vacunacion`
--

CREATE TABLE `esquema_vacunacion` (
  `id_esquema` int(11) NOT NULL,
  `criterio_calculo` enum('POR_EDAD','POR_INTERVALO') NOT NULL,
  `dosis_numero` enum('Primera','Refuerzo','Segunda','Tercera','Unica') NOT NULL,
  `edad_maxima_aplicacion` int(11) NOT NULL,
  `edad_minima_aplicacion` int(11) NOT NULL,
  `intervalo_dias` int(11) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `unidad_tiempo_edad` enum('AÑOS','DIAS','MESES','SEMANAS') DEFAULT NULL,
  `id_vacuna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `esquema_vacunacion`
--

INSERT INTO `esquema_vacunacion` (`id_esquema`, `criterio_calculo`, `dosis_numero`, `edad_maxima_aplicacion`, `edad_minima_aplicacion`, `intervalo_dias`, `observaciones`, `unidad_tiempo_edad`, `id_vacuna`) VALUES
(1, 'POR_EDAD', 'Primera', 4, 2, NULL, 'Primera dosis del esquema', 'MESES', 3),
(2, 'POR_INTERVALO', 'Segunda', 0, 0, 30, '30 días después de la primera dosis', NULL, 3),
(5, 'POR_EDAD', 'Primera', 99, 0, NULL, 'Primera dosis - fiebre amarilla', 'AÑOS', 5),
(10, 'POR_EDAD', 'Unica', 0, 0, NULL, 'Garantizar en recién nacidos. Previene Meningitis Tuberculosa.', 'DIAS', 101),
(11, 'POR_EDAD', 'Primera', 0, 0, NULL, 'Garantizar en las primeras 12 horas del recién nacido. Previene Hepatitis B.', 'DIAS', 102),
(12, 'POR_EDAD', 'Primera', 2, 2, NULL, 'Primera dosis de Antipolio VIP. Previene Poliomielitis.', 'MESES', 103),
(13, 'POR_EDAD', 'Primera', 2, 2, NULL, 'Primera dosis de Pentavalente (DPT - Hib - Hep B).', 'MESES', 106),
(14, 'POR_EDAD', 'Primera', 2, 2, NULL, 'Primera dosis de Rotavirus. Previene diarrea por Rotavirus.', 'MESES', 104),
(15, 'POR_EDAD', 'Primera', 2, 2, NULL, 'Primera dosis de Neumococo. Previene neumonías, otitis y meningitis.', 'MESES', 105),
(16, 'POR_EDAD', 'Segunda', 4, 4, NULL, 'Segunda dosis de Antipolio VIP.', 'MESES', 103),
(17, 'POR_EDAD', 'Segunda', 4, 4, NULL, 'Segunda dosis de Pentavalente (DPT - Hib - Hep B).', 'MESES', 106),
(18, 'POR_EDAD', 'Segunda', 4, 4, NULL, 'Segunda dosis de Rotavirus. Aplicar máximo hasta los 11 meses y 29 días.', 'MESES', 104),
(19, 'POR_EDAD', 'Segunda', 4, 4, NULL, 'Segunda dosis de Neumococo.', 'MESES', 105),
(20, 'POR_EDAD', 'Tercera', 6, 6, NULL, 'Tercera dosis de Antipolio VIP.', 'MESES', 103),
(21, 'POR_EDAD', 'Tercera', 6, 6, NULL, 'Tercera dosis de Pentavalente (DPT - Hib - Hep B).', 'MESES', 106),
(22, 'POR_EDAD', 'Primera', 6, 6, NULL, 'Primera dosis de Influenza estacional.', 'MESES', 107),
(23, 'POR_INTERVALO', 'Segunda', 7, 7, 30, 'Segunda dosis de Influenza estacional (intervalo de 4 semanas/1 mes).', 'MESES', 107),
(24, 'POR_EDAD', 'Primera', 12, 12, NULL, 'Dosis de Triple Viral (SRP: Sarampión, Rubéola, Paperas).', 'MESES', 108),
(25, 'POR_EDAD', 'Unica', 12, 12, NULL, 'Dosis única de Fiebre Amarilla.', 'MESES', 109),
(26, 'POR_EDAD', 'Unica', 12, 12, NULL, 'Dosis única de Hepatitis A.', 'MESES', 110),
(27, 'POR_EDAD', 'Refuerzo', 12, 12, NULL, 'Refuerzo de Neumococo.', 'MESES', 105),
(28, 'POR_EDAD', 'Primera', 12, 12, NULL, 'Primera dosis de Varicela.', 'MESES', 111),
(29, 'POR_EDAD', 'Refuerzo', 18, 18, NULL, 'Primer refuerzo de Antipolio VIP.', 'MESES', 103),
(30, 'POR_EDAD', 'Refuerzo', 18, 18, NULL, 'Primer refuerzo de DPT (Difteria, Tos ferina, Tétanos).', 'MESES', 112),
(31, 'POR_EDAD', 'Refuerzo', 5, 5, NULL, 'Segundo refuerzo de Antipolio VIP.', 'AÑOS', 103),
(32, 'POR_EDAD', 'Refuerzo', 5, 5, NULL, 'Segundo refuerzo de DPT.', 'AÑOS', 112),
(33, 'POR_EDAD', 'Refuerzo', 5, 5, NULL, 'Refuerzo/Segunda dosis de Triple Viral.', 'AÑOS', 108),
(34, 'POR_EDAD', 'Refuerzo', 5, 5, NULL, 'Refuerzo de Varicela.', 'AÑOS', 111),
(35, 'POR_EDAD', 'Unica', 17, 9, NULL, 'Prevención de Cáncer causado por el Virus del Papiloma Humano (VPH).', 'AÑOS', 113),
(36, 'POR_EDAD', 'Unica', 45, 14, NULL, 'Dosis anual a partir de la semana 14 de gestación (Influenza estacional).', 'SEMANAS', 107),
(37, 'POR_EDAD', 'Unica', 36, 26, NULL, 'TdaP Adultos: Entre semana 26 y preferiblemente antes de semana 36.', 'SEMANAS', 115),
(38, 'POR_EDAD', 'Primera', 49, 10, 0, 'Td1: Día 0. Prevención de Tétanos neonatal, accidental y difteria.', 'AÑOS', 114),
(39, 'POR_INTERVALO', 'Segunda', 49, 10, 30, 'Td2: Al mes de la primera dosis.', 'AÑOS', 114),
(40, 'POR_INTERVALO', 'Tercera', 49, 10, 180, 'Td3: A los 6 meses de la segunda dosis.', 'AÑOS', 114),
(41, 'POR_INTERVALO', 'Refuerzo', 49, 10, 365, 'Td4: Al año de la tercera dosis.', 'AÑOS', 114),
(42, 'POR_INTERVALO', 'Refuerzo', 49, 10, 730, 'Td5: Al año de la cuarta dosis. Refuerzo posterior cada 10 años.', 'AÑOS', 114),
(43, 'POR_EDAD', 'Unica', 120, 60, NULL, 'Dosis única anual contra Influenza Estacional para adultos de 60 años y más.', 'AÑOS', 107);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_lote`
--

CREATE TABLE `inventario_lote` (
  `id_inventario` int(11) NOT NULL,
  `activo` bit(1) NOT NULL,
  `cantidad_recibida` int(11) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `numero_lote` varchar(50) NOT NULL,
  `stock_actual` int(11) NOT NULL,
  `id_vacuna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario_lote`
--

INSERT INTO `inventario_lote` (`id_inventario`, `activo`, `cantidad_recibida`, `fecha_vencimiento`, `numero_lote`, `stock_actual`, `id_vacuna`) VALUES
(1, b'1', 500, '2027-06-30', 'LOTE-2026-001', 500, 3),
(2, b'1', 500, '2027-06-30', 'LOTE-2026-001', 499, 4),
(3, b'1', 30, '2027-06-30', 'LOTE-2026-002', 30, 2),
(4, b'1', 100, '2027-06-30', 'LOTE-2026-003', 98, 5),
(10, b'1', 200, '2027-12-31', 'LOTE-BCG-2026A', 197, 101),
(11, b'1', 300, '2027-10-15', 'LOTE-HEPB-2026B', 294, 102),
(12, b'1', 500, '2028-01-20', 'LOTE-VIP-2026C', 477, 103),
(13, b'1', 150, '2027-08-30', 'LOTE-ROTA-2026D', 144, 104),
(14, b'1', 400, '2027-11-10', 'LOTE-NEUMO-2026E', 390, 105),
(15, b'1', 500, '2028-03-15', 'LOTE-PENTA-2026F', 492, 106),
(16, b'1', 600, '2027-06-30', 'LOTE-INFL-2026G', 550, 107),
(17, b'1', 300, '2027-09-25', 'LOTE-SRP-2026H', 288, 108),
(18, b'1', 250, '2028-05-12', 'LOTE-FA-2026I', 240, 109),
(19, b'1', 200, '2027-12-01', 'LOTE-HEPA-2026J', 195, 110),
(20, b'1', 180, '2027-07-18', 'LOTE-VARI-2026K', 170, 111),
(21, b'1', 350, '2028-02-28', 'LOTE-DPT-2026L', 340, 112),
(22, b'1', 250, '2027-10-05', 'LOTE-VPH-2026M', 245, 113),
(23, b'1', 400, '2028-04-14', 'LOTE-TD-2026N', 385, 114),
(24, b'1', 300, '2027-11-20', 'LOTE-TDAP-2026O', 290, 115);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_salud`
--

CREATE TABLE `personal_salud` (
  `cargo` varchar(255) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal_salud`
--

INSERT INTO `personal_salud` (`cargo`, `id_usuario`, `fecha_modificacion`) VALUES
('Camillero', 2, NULL),
('Enfermero', 4, NULL),
('Enfermera', 6, NULL),
('Vacunador', 7, NULL),
('Enfermera', 8, NULL),
('Vacunador', 9, NULL),
('Vacunador', 10, NULL),
('Vacunador', 11, NULL),
('Camillero', 12, NULL),
('Camillero', 13, NULL),
('Doctora', 19, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorio`
--

CREATE TABLE `recordatorio` (
  `id_recordatorio` int(11) NOT NULL,
  `estado` enum('Enviado','Fallido','Pendiente') NOT NULL,
  `fecha_envio` datetime(6) DEFAULT NULL,
  `fecha_programada` datetime(6) NOT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `id_esquema` int(11) NOT NULL,
  `id_ciudadano` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recordatorio`
--

INSERT INTO `recordatorio` (`id_recordatorio`, `estado`, `fecha_envio`, `fecha_programada`, `mensaje`, `id_esquema`, `id_ciudadano`) VALUES
(1, 'Pendiente', NULL, '2026-08-20 09:00:00.000000', 'Recordatorio: Próxima dosis de esquema de vacunación pendiente.', 1, 21),
(2, 'Pendiente', NULL, '2026-11-17 05:00:00.000000', 'Recordatorio de vacunación: próxima dosis Segunda de Antipolio VIP', 16, 21),
(3, 'Pendiente', NULL, '2026-11-17 05:00:00.000000', 'Recordatorio de vacunación: próxima dosis Segunda de Rotavirus', 18, 21),
(4, 'Pendiente', NULL, '2021-06-10 05:00:00.000000', 'Recordatorio de vacunación: próxima dosis Segunda de Antipolio VIP', 16, 18),
(5, 'Pendiente', NULL, '2027-01-17 05:00:00.000000', 'Recordatorio de vacunación: próxima dosis Tercera de Antipolio VIP', 20, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `tipo_usuario` varchar(31) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` enum('FEMENINO','MASCULINO','OTRO') DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `numero_documento` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `tipo_documento` enum('CC','CE','PA','RC','TI') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`tipo_usuario`, `id_usuario`, `apellido`, `contrasena`, `direccion`, `correo`, `estado`, `fecha_nacimiento`, `genero`, `nombre`, `numero_documento`, `telefono`, `tipo_documento`) VALUES
('ADMINISTRADOR', 1, 'Sistema', '$argon2id$v=19$m=4096,t=3,p=1$0FQe48K8nY0NhWIAJkSdBQ$YzCKEEJ0PEV9m3LzABM8ndGYnsCeuZRBakupncrQJbg', '', 'admin@sistema.local', 'ACTIVO', '1990-01-01', 'MASCULINO', 'Administrador', '0000000000', '', 'CC'),
('PERSONAL_SALUD', 2, 'Gómez', '$argon2id$v=19$m=16384,t=2,p=1$BN8nvnwCwOfT93+U0hqFmQ$HdidRRTWivSDsURYuRpw84ffqoWxLGgRqC4YfMRXl3c', 'Calle 45 #53 - 27', 'carlos.gomez@salud.local', 'ACTIVO', NULL, 'MASCULINO', 'Carlos', '1098765432', '3009919570', 'CC'),
('PERSONAL_SALUD', 4, 'Altamar', '$argon2id$v=19$m=16384,t=2,p=1$Rjr6jlQE1DZaIRP0PmTCmw$AoIwJh+jEHSYrHnfyArlD/+hTc4cLXSrPzj7mlAyU+U', 'Cra 22B #27B - 28', 'yoissy.altamar@salud.local', 'ACTIVO', '2006-09-06', 'FEMENINO', 'Yoissy', '1044214938', '3007485344', 'CC'),
('CIUDADANO', 5, 'Martínez', NULL, 'Crr6b#89-987', 'ana.altamar@email.local', NULL, '1995-04-15', 'FEMENINO', 'Ana', '1045678901', '313516234', 'CC'),
('PERSONAL_SALUD', 6, 'Díaz Granados', '$argon2id$v=19$m=16384,t=2,p=1$5tvWYQs2lNHT3NuaFI+eHg$mMkwNC1iDWM8I8Xs9MOMWGjbudklphyRT3IIrnJyaNU', 'Calle 25 #75B -37', 'camila.dias@salud.local', 'ACTIVO', '1999-03-25', 'FEMENINO', 'Camila', '1048207919', '3008901545', 'CC'),
('PERSONAL_SALUD', 7, 'Castro', '$argon2id$v=19$m=16384,t=2,p=1$w2in3B4Jvxnq9lP5GW/rOQ$Da+NYM9iiRXoRLcEGnP+pNdrUC9TUHx7Lj0sMF8po7A', NULL, 'daniel.castro@salud.local', 'ACTIVO', '2001-04-22', 'MASCULINO', 'Daniel', '1048224531', NULL, 'CC'),
('PERSONAL_SALUD', 8, 'Bustamante', '$argon2id$v=19$m=16384,t=2,p=1$YwMgq/yLpmCRovhZkwNEPQ$OALnY7B9ZcK/GS4JlYFDbIT+GPdIdzTOuXbmStHN6TQ', NULL, 'aranza.bustamante@salud.local', 'ACTIVO', '1997-02-21', 'FEMENINO', 'Aranza', '10412564589', NULL, 'CC'),
('PERSONAL_SALUD', 9, 'Jimenez', '$argon2id$v=19$m=16384,t=2,p=1$O1/7unytJ9VcH3VrMB8WsA$VCtDTHbYpgf8U3Qou6FMFwIqCHJGf8y2NRRHfS4coGQ', NULL, 'marco.jimenez@salud.local', 'ACTIVO', '2002-06-03', 'MASCULINO', 'Marco', '10453659780', NULL, 'CC'),
('PERSONAL_SALUD', 10, 'Camargo', '$argon2id$v=19$m=16384,t=2,p=1$vOAKr4mAWvJVIAVxLIf+Ow$cw7CmwQYoDHAYURsihTFYW4dMyS4S65q7bRdkcBSOHY', NULL, 'danilo.carmargo@salud.local', 'ACTIVO', '1985-07-05', 'MASCULINO', 'Danilo', '1041224563', NULL, 'CC'),
('PERSONAL_SALUD', 11, 'Lopez', '$argon2id$v=19$m=16384,t=2,p=1$fhjADtBJGtW/fj/uopqByQ$dOzGiFstarxsqsTctr3MEtFg4I5SPwzF7MpH3IYAZhI', NULL, 'daniela.lopez@salud.local', 'ACTIVO', '1994-04-21', 'FEMENINO', 'Daniela', '1041456899', NULL, 'CC'),
('PERSONAL_SALUD', 12, 'Serrano', '$argon2id$v=19$m=16384,t=2,p=1$4yboQTps+SbNYLKISK4nKg$a9DCfSKDPBgoTvofSX+3fvvzwAG9fdYuEgqWaRBpDHA', 'Calle 45 #53 - 27', 'armando.serrano@salud.local', 'ACTIVO', '2006-01-01', 'MASCULINO', 'Armando', '10225634978', '3004004569', 'CC'),
('PERSONAL_SALUD', 13, 'Bohorquez', '$argon2id$v=19$m=16384,t=2,p=1$kxDQVlfDFBsFrgw3NBCrjw$i/LL/h0IkajScbY12niUw86dle559itvab5pmzsfY+Q', 'Calle 45 #53 - 27', 'marcos.bohorque@salud.local', 'ACTIVO', '2006-10-09', 'MASCULINO', 'Marcos', '10482569713', '3008914563', 'CC'),
('CIUDADANO', 14, 'Garcia', '$argon2id$v=19$m=16384,t=2,p=1$mvekGqiKfn1hvkZHBIj9Iw$Z3LdWe1Sc1gCmpix+ajzm3BW/8+bQyxjYcAsHEfE9f0', 'Cra 19A #87-56', 'fabiangarcia12@gmail.com', 'ACTIVO', '2013-02-15', 'MASCULINO', 'Fabian', '10412245963', NULL, 'TI'),
('CIUDADANO', 15, 'Rodriguez', '$argon2id$v=19$m=16384,t=2,p=1$ttYfdUDJUix/0kbIR9j+wQ$3m0MEfEv7CyA3up25+zCVSTxJ+ph9fSgu1pgTUsA97Q', 'Calle 25A #56 - 22', 'andresrodriguez@gmail.com', 'ACTIVO', '1998-06-15', 'MASCULINO', 'Andrés', '10412567891', '3005647986', 'CC'),
('CIUDADANO', 16, 'Camargo', '$argon2id$v=19$m=16384,t=2,p=1$J3Ts7fqcPWX0ZXZ5siL2dg$91qxDez232ukREq3lmZR6VG0Y0GESp1pKI6yrcEh/uQ', 'Call19 #75B -87', 'davidcarmargo@gmail.com', 'ACTIVO', '2004-10-15', 'MASCULINO', 'David', '10412459745', '3004567890', 'CC'),
('CIUDADANO', 17, 'Palma', '$argon2id$v=19$m=16384,t=2,p=1$heCrOWEB2+LBLjQWlz6jIA$8ki5sam/j3wRoyIpM1UdDxANSPzFcOqH/6LaY5gHjTE', 'Call19 #75A -36', 'arianapalma@gmail.com', 'ACTIVO', '2015-06-15', 'FEMENINO', 'Ariana', '10478965123', '3001454563', 'TI'),
('CIUDADANO', 18, 'Hernandez', '$argon2id$v=19$m=16384,t=2,p=1$VhsiWqhB/kiQJ/BsJB2LUQ$43lXWwKsMNZL89HKwYjN8+bbQIL2N+A+p6X6htUNbfE', 'calle 45B #56-89', 'danielpadilla@gmail.com', 'ACTIVO', '2021-02-10', 'MASCULINO', 'Daniel', '10456349745', '3002245164', 'TI'),
('PERSONAL_SALUD', 19, 'Padilla', '$argon2id$v=19$m=16384,t=2,p=1$GCadRABea+4Cm8kteq5eDg$D/Bn5gs8/VR4ys290a7LUSuHyDjBAN2yFeibTZARw+Y', 'calle76c#05-03', 'marianaaltahona@gmail.com', 'INACTIVO', '2006-01-13', 'FEMENINO', 'Mariana', '1293474394', '3135123064', 'CC'),
('CIUDADANO', 20, 'Torres', NULL, 'Cra 30 #45-12', 'sofia.torres@email.local', 'ACTIVO', '2000-05-10', 'FEMENINO', 'Sofia', '1099887766', '3101122334', 'CC'),
('CIUDADANO', 21, 'cossio', '$argon2id$v=19$m=16384,t=2,p=1$wXDCxVYMyibaA7Tq1vhRJQ$KFWSKRVO8cI4p4KbPpmNblLflCULh3/TdBLk+cWeFlM', 'calle72b#76-293', 'jefersoncossio@gmail.com', 'ACTIVO', '2026-07-17', 'MASCULINO', 'jefferson', '10442235454', '3135678374', 'CC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacuna`
--

CREATE TABLE `vacuna` (
  `id_vacuna` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `dosis_totales` int(11) NOT NULL,
  `estado` enum('ACTIVA','INACTIVA') NOT NULL,
  `fabricante` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `t_almacenamiento` double DEFAULT NULL,
  `via_administracion` enum('Intradermica','Intramuscular','Oral','Subcutanea') NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vacuna`
--

INSERT INTO `vacuna` (`id_vacuna`, `codigo`, `dosis_totales`, `estado`, `fabricante`, `nombre`, `t_almacenamiento`, `via_administracion`, `fecha_modificacion`) VALUES
(2, 'VAC-002', 1, 'ACTIVA', 'Laboratorios XYZ', 'BCG', 4.5, 'Intradermica', NULL),
(3, 'VAC-003', 1, 'INACTIVA', 'Laboratorios 123', 'New Covid-19', 7.2, 'Intradermica', NULL),
(4, 'VAC-004', 2, 'ACTIVA', 'Laboratorios ABC', 'BCG Actualizada', 5, 'Intradermica', NULL),
(5, 'VAC-005', 2, 'ACTIVA', 'Pfitzer', 'Fiebre amarilla', 6.5, 'Intradermica', NULL),
(15, 'VAC-006', 2, 'ACTIVA', 'Jhonson', 'Fiebre amarilla', 7, 'Subcutanea', NULL),
(101, 'VAC-BCG-01', 1, 'ACTIVA', 'Serum Institute of India', 'BCG', NULL, 'Intradermica', NULL),
(102, 'VAC-HEPB-01', 3, 'ACTIVA', 'LG Chem', 'Hepatitis B', NULL, 'Intramuscular', NULL),
(103, 'VAC-VIP-01', 5, 'ACTIVA', 'Sanofi Pasteur', 'Antipolio VIP', NULL, 'Intramuscular', NULL),
(104, 'VAC-ROTA-01', 2, 'ACTIVA', 'GlaxoSmithKline', 'Rotavirus', NULL, 'Oral', NULL),
(105, 'VAC-NEUMO-01', 3, 'ACTIVA', 'Pfizer', 'Neumococo', NULL, 'Intramuscular', NULL),
(106, 'VAC-PENTA-01', 3, 'ACTIVA', 'Serum Institute of India', 'Pentavalente (DPT-HB-Hib)', NULL, 'Intramuscular', NULL),
(107, 'VAC-INFL-01', 2, 'ACTIVA', 'Sanofi Pasteur', 'Influenza estacional', NULL, 'Intramuscular', NULL),
(108, 'VAC-SRP-01', 2, 'ACTIVA', 'Serum Institute of India', 'Triple Viral (SRP)', NULL, 'Subcutanea', NULL),
(109, 'VAC-FA-01', 1, 'ACTIVA', 'Bio-Manguinhos', 'Fiebre amarilla', NULL, 'Subcutanea', NULL),
(110, 'VAC-HEPA-01', 1, 'ACTIVA', 'GlaxoSmithKline', 'Hepatitis A', NULL, 'Intramuscular', NULL),
(111, 'VAC-VARI-01', 2, 'ACTIVA', 'MSD', 'Varicela', NULL, 'Subcutanea', NULL),
(112, 'VAC-DPT-01', 2, 'ACTIVA', 'Serum Institute of India', 'DPT (Difteria-Tosferina-Tétanos)', NULL, 'Intramuscular', NULL),
(113, 'VAC-VPH-01', 1, 'ACTIVA', 'MSD', 'Virus del Papiloma Humano (VPH)', NULL, 'Intramuscular', NULL),
(114, 'VAC-TD-01', 5, 'ACTIVA', 'Bio Farma', 'Toxoide Tetánico y Diftérico (Td)', NULL, 'Intramuscular', NULL),
(115, 'VAC-TDAP-01', 1, 'ACTIVA', 'GlaxoSmithKline', 'TdaP Acelular Adultos', NULL, 'Intramuscular', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunacion`
--

CREATE TABLE `vacunacion` (
  `id_vacunacion` int(11) NOT NULL,
  `fecha_aplicacion` date NOT NULL,
  `dosis` enum('Primera','Segunda','Tercera','Refuerzo','Unica') NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `reacciones_adversas` tinyint(1) NOT NULL DEFAULT 0,
  `id_ciudadano` bigint(20) NOT NULL,
  `id_personal_salud` bigint(20) NOT NULL,
  `id_inventario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vacunacion`
--

INSERT INTO `vacunacion` (`id_vacunacion`, `fecha_aplicacion`, `dosis`, `observaciones`, `reacciones_adversas`, `id_ciudadano`, `id_personal_salud`, `id_inventario`) VALUES
(1, '2026-08-12', 'Primera', 'Aplicada sin novedades', 0, 5, 2, 2),
(2, '2026-08-17', 'Primera', '', 0, 20, 2, 4),
(3, '2026-08-17', 'Unica', '', 0, 21, 2, 10),
(4, '2026-08-17', 'Primera', '', 0, 21, 2, 4),
(5, '2026-08-18', 'Primera', '', 0, 21, 2, 11),
(6, '2026-08-18', 'Primera', '', 0, 21, 2, 12),
(7, '2026-08-18', 'Primera', '', 0, 21, 2, 13),
(8, '2026-08-18', 'Primera', '', 0, 18, 2, 12),
(9, '2026-08-18', 'Segunda', '', 0, 21, 2, 12);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id_auditoria`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `esquema_vacunacion`
--
ALTER TABLE `esquema_vacunacion`
  ADD PRIMARY KEY (`id_esquema`),
  ADD KEY `FKr9abarjbo1ed88uyajl4v7s71` (`id_vacuna`);

--
-- Indices de la tabla `inventario_lote`
--
ALTER TABLE `inventario_lote`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `FKenciyqn6u3akjyhx56qdmkigh` (`id_vacuna`);

--
-- Indices de la tabla `personal_salud`
--
ALTER TABLE `personal_salud`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  ADD PRIMARY KEY (`id_recordatorio`),
  ADD KEY `FKg1prmvqsofvj8eb84rgg4pm50` (`id_esquema`),
  ADD KEY `FKfraf2j65r3ndsrjq3qpolhbiw` (`id_ciudadano`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `UK2mlfr087gb1ce55f2j87o74t` (`correo`),
  ADD UNIQUE KEY `UKcyd6xjxln9p38cm60dkrox5no` (`numero_documento`);

--
-- Indices de la tabla `vacuna`
--
ALTER TABLE `vacuna`
  ADD PRIMARY KEY (`id_vacuna`),
  ADD UNIQUE KEY `UKah0mduccu90p0hgvxd0mqk2iu` (`codigo`);

--
-- Indices de la tabla `vacunacion`
--
ALTER TABLE `vacunacion`
  ADD PRIMARY KEY (`id_vacunacion`),
  ADD KEY `id_ciudadano` (`id_ciudadano`),
  ADD KEY `id_personal_salud` (`id_personal_salud`),
  ADD KEY `idx_vacunacion_inventario` (`id_inventario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id_auditoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `esquema_vacunacion`
--
ALTER TABLE `esquema_vacunacion`
  MODIFY `id_esquema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `inventario_lote`
--
ALTER TABLE `inventario_lote`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  MODIFY `id_recordatorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `vacuna`
--
ALTER TABLE `vacuna`
  MODIFY `id_vacuna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `vacunacion`
--
ALTER TABLE `vacunacion`
  MODIFY `id_vacunacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `FKpt2bj0l5q4npigarogy7p1834` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `auditoria_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD CONSTRAINT `FK49y4t75e3kmoueoxhnuktdum9` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `esquema_vacunacion`
--
ALTER TABLE `esquema_vacunacion`
  ADD CONSTRAINT `FKr9abarjbo1ed88uyajl4v7s71` FOREIGN KEY (`id_vacuna`) REFERENCES `vacuna` (`id_vacuna`);

--
-- Filtros para la tabla `inventario_lote`
--
ALTER TABLE `inventario_lote`
  ADD CONSTRAINT `FKenciyqn6u3akjyhx56qdmkigh` FOREIGN KEY (`id_vacuna`) REFERENCES `vacuna` (`id_vacuna`);

--
-- Filtros para la tabla `personal_salud`
--
ALTER TABLE `personal_salud`
  ADD CONSTRAINT `FKdjshnjxupwmathxyabphpoyyw` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  ADD CONSTRAINT `FKg1prmvqsofvj8eb84rgg4pm50` FOREIGN KEY (`id_esquema`) REFERENCES `esquema_vacunacion` (`id_esquema`),
  ADD CONSTRAINT `fk_recordatorio_ciudadano` FOREIGN KEY (`id_ciudadano`) REFERENCES `ciudadano` (`id_usuario`);

--
-- Filtros para la tabla `vacunacion`
--
ALTER TABLE `vacunacion`
  ADD CONSTRAINT `fk_vacunacion_inventario` FOREIGN KEY (`id_inventario`) REFERENCES `inventario_lote` (`id_inventario`),
  ADD CONSTRAINT `vacunacion_ibfk_1` FOREIGN KEY (`id_ciudadano`) REFERENCES `ciudadano` (`id_usuario`),
  ADD CONSTRAINT `vacunacion_ibfk_2` FOREIGN KEY (`id_personal_salud`) REFERENCES `personal_salud` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
