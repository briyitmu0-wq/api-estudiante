-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-08-2026 a las 17:41:46
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
-- Base de datos: `cafe`
--
CREATE DATABASE IF NOT EXISTS `cafe` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cafe`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `stock`, `id_categoria`, `imagen`) VALUES
(3, 'Galleta', 18, 3, 0, NULL),
(4, 'Pan', 7, 3, 0, NULL),
(5, 'Dedito', 14, 2, 0, NULL),
(6, 'Empanada', 48, 15, 0, NULL),
(7, 'Endo', 41, 1000, 0, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Base de datos: `cafe1`
--
CREATE DATABASE IF NOT EXISTS `cafe1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cafe1`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id_admin`, `usuario`, `contraseña`, `id_rol`) VALUES
(2, 'admin', '123', 1),
(3, 'len', '123456', 1),
(4, 'len1', '789456', 1),
(5, 'red', '123456', 1),
(6, 'poli', '321654', 1),
(7, 'pepe', '1234789', 1),
(8, 'pedrito', '963852', 1),
(9, 'lolol', '123654', 1),
(10, 'queso', '789456', 1),
(11, 'boli', '123789', 1),
(12, 'camilo', '123456', 1),
(13, 'polis', '123456789', 1),
(14, 'poliso', '123456789', 1),
(15, 'bebes', '789456', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
(1, 'Café'),
(2, 'Pasabocas'),
(3, 'Galletas'),
(4, 'Postres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `contraseña` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `usuario`, `telefono`, `id_rol`, `contraseña`) VALUES
(4, 'malvi', '12458535', 2, 'hola'),
(5, 'leny', '3115851187', 2, '875'),
(6, 'mimo', '3112543019', 2, '123456'),
(7, 'yoi', '3045668', 2, '789456'),
(8, 'bri', '30496785', 2, '852369'),
(9, 'endi', '3043695874', 2, 'mocona123'),
(13, 'nimo', '369875369', 2, '123456'),
(15, 'mono', '30225403019', 2, '123456789'),
(17, 'milo', '9637724', NULL, 'mkdodpdnff'),
(18, 'mesias', '3698753645', 2, '123456789'),
(19, 'pablito', '3014698572', 2, '123456789'),
(20, 'cristiano', '301341675', 2, '456789'),
(21, 'davanis', '32058975658', 2, '123456'),
(22, 'pedro', '301469528', 2, '123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) DEFAULT 0.00,
  `total` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id_detalle`, `id_pedido`, `id_producto`, `cantidad`, `precio_unitario`, `total`) VALUES
(21, 5, 4, 3, 13.00, 39.00),
(24, 4, 9, 3, 16.50, 49.50),
(25, 4, 8, 6, 30.00, 180.00),
(26, 6, 9, 4, 16.50, 66.00),
(27, 4, 5, 4, 14.49, 57.96),
(28, 6, 7, 5, 15.00, 75.00),
(29, 6, 8, 2, 30.00, 60.00),
(30, 7, 6, 2, 10.00, 20.00),
(31, 7, 5, 2, 14.49, 28.98),
(32, 8, 4, 1, 15.00, 15.00),
(33, 9, 4, 1, 15.00, 15.00),
(34, 10, 5, 3, 14.49, 43.47),
(36, 10, 8, 2, 30.00, 60.00),
(37, 11, 4, 1, 15.00, 15.00),
(38, 11, 7, 1, 15.00, 15.00),
(39, 11, 9, 2, 16.50, 33.00),
(40, 12, 4, 1, 15.00, 15.00),
(41, 12, 5, 1, 14.49, 14.49),
(42, 12, 9, 1, 16.50, 16.50),
(43, 13, 5, 1, 14.49, 14.49),
(45, 14, 4, 5, 15.00, 75.00),
(49, 16, 4, 1, 15.00, 15.00),
(50, 16, 7, 1, 15.00, 15.00),
(51, 16, 8, 3, 30.00, 90.00),
(52, 17, 6, 1, 10.00, 10.00),
(53, 17, 4, 3, 15.00, 45.00),
(54, 17, 4, 3, 15.00, 45.00),
(58, 19, 6, 2, 10.00, 20.00),
(59, 19, 4, 1, 13.00, 13.00),
(60, 20, 4, 1, 13.00, 13.00),
(61, 20, 7, 1, 15.00, 15.00),
(62, 20, 8, 2, 30.00, 60.00),
(63, 21, 5, 2, 15.00, 30.00),
(64, 22, 5, 1, 15.00, 15.00),
(65, 22, 4, 1, 13.00, 13.00),
(69, 24, 4, 1, 13.00, 13.00),
(70, 24, 8, 1, 30.00, 30.00),
(71, 24, 7, 1, 15.00, 15.00),
(72, 25, 4, 2, 13.00, 26.00),
(73, 25, 8, 2, 30.00, 60.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_cliente`) VALUES
(5, 4),
(7, 5),
(8, 5),
(9, 5),
(13, 5),
(14, 5),
(6, 6),
(10, 6),
(4, 8),
(11, 13),
(12, 13),
(16, 15),
(17, 15),
(19, 18),
(20, 19),
(21, 19),
(22, 20),
(24, 21),
(25, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `stock`, `id_categoria`, `imagen`) VALUES
(4, 'Pan Integral', 13.00, 2, 2, NULL),
(5, 'Cappuccinoo', 15.00, 0, 1, NULL),
(6, 'Bandeja de deditos', 10.00, 4, 2, NULL),
(7, 'Croissant', 15.00, 0, 4, NULL),
(8, 'Crumbl cookies', 30.00, 1, 3, '/img/chocolate-y-trufa.jpg'),
(9, 'Sandwich Cubano', 16.50, 2, 4, '/img/sandwich-cubano.jpg'),
(12, 'Galletas punto rojo', 800.00, 3, 3, '/img/R.jpg'),
(14, 'Pan de queso', 15000.00, 2, NULL, NULL),
(15, 'Café Frío', 12.00, 9, NULL, NULL),
(16, 'Café Caliente', 57.00, 12, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'Admin'),
(2, 'Usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_pedidos_clientes` (`id_cliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `id_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_pedidos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
--
-- Base de datos: `gestion_productos`
--
CREATE DATABASE IF NOT EXISTS `gestion_productos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestion_productos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `usuario_id`, `precio`) VALUES
(10, 'balon', 'de futbol anericano', 7, 150000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `contrasena`) VALUES
(1, 'let', 'usuario1', '123456'),
(2, 'Test', 'testuser', '13d249f2cb4127b40cfa757866850278793f814ded3c587fe5'),
(4, 'Juan Perez', 'juanperez', '12345'),
(5, 'string', 'string', 'string'),
(6, 'csacc', 'c<zc', '<cz<z'),
(7, 'erto', 'erto1', '123'),
(8, 'ertq', 'scv', '23421'),
(9, 'hola', 'hola', '123'),
(10, 'qwe', 'q', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\",\"full_screen\":\"off\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"sistema_delta\",\"table\":\"vacuna\"},{\"db\":\"sistema_delta\",\"table\":\"recordatorio\"},{\"db\":\"sistema_delta\",\"table\":\"administrador\"},{\"db\":\"sistema_delta\",\"table\":\"inventario_lote\"},{\"db\":\"sistema_delta\",\"table\":\"vacunacion\"},{\"db\":\"sistema_delta\",\"table\":\"usuario\"},{\"db\":\"sistema_delta\",\"table\":\"personal_salud\"},{\"db\":\"sistema_delta\",\"table\":\"esquema_vacunacion\"},{\"db\":\"sistema_delta\",\"table\":\"ciudadano\"},{\"db\":\"sistema_delta\",\"table\":\"auditoria\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('gestion_productos', 'usuarios', 'nombre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'cafe1', 'detalle_pedidos', '{\"CREATE_TIME\":\"2025-03-26 21:08:06\"}', '2025-03-30 14:58:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-08-05 15:37:36', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\",\"NavigationWidth\":252}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `proyectomar`
--
CREATE DATABASE IF NOT EXISTS `proyectomar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyectomar`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasena` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `contrasena`) VALUES
(1, 'der', 'fret', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Base de datos: `sistemavacunaciondelta`
--
CREATE DATABASE IF NOT EXISTS `sistemavacunaciondelta` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sistemavacunaciondelta`;
--
-- Base de datos: `sistema_delta`
--
CREATE DATABASE IF NOT EXISTS `sistema_delta` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sistema_delta`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id_auditoria` int(11) NOT NULL,
  `tipo_accion` enum('Crear','Editar','Eliminar','Consultar') NOT NULL,
  `fecha_accion` date NOT NULL,
  `tabla_afectada` varchar(50) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE `ciudadano` (
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `esquema_vacunacion`
--

CREATE TABLE `esquema_vacunacion` (
  `id_esquema` int(11) NOT NULL,
  `n_dosis` enum('Primera','Segunda','Tercera','Refuerzo','Unica') NOT NULL,
  `edad_min_aplicacion` int(11) NOT NULL,
  `intervalo_dias` int(11) NOT NULL,
  `criterio_calculo` enum('POR_EDAD','POR_INTERVALO') NOT NULL,
  `id_vacuna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_lote`
--

CREATE TABLE `inventario_lote` (
  `id_inventario` int(11) NOT NULL,
  `numero_lote` varchar(50) NOT NULL,
  `cantidad_recibida` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_vencimiento` date NOT NULL,
  `stock_actual` int(11) NOT NULL,
  `id_vacuna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_salud`
--

CREATE TABLE `personal_salud` (
  `id_usuario` int(11) NOT NULL,
  `cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorio`
--

CREATE TABLE `recordatorio` (
  `id_recordatorio` int(11) NOT NULL,
  `fecha_programada` date NOT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `estado` enum('Pendiente','Enviado','Fallido') NOT NULL DEFAULT 'Pendiente',
  `id_usuario` int(11) NOT NULL,
  `id_esquema` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `tipo_documento` enum('RC','TI','CC','CE','PA') NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `genero` enum('Masculino','Femenino','Otro') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacuna`
--

CREATE TABLE `vacuna` (
  `id_vacuna` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fabricante` varchar(100) NOT NULL,
  `dosis_totales` int(11) NOT NULL,
  `via_administracion` enum('Oral','Intramuscular','Subcutanea','Intradermica') NOT NULL,
  `t_almacenamiento` double DEFAULT NULL,
  `estado` enum('Activa','Inactiva') NOT NULL DEFAULT 'Activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunacion`
--

CREATE TABLE `vacunacion` (
  `id_vacunacion` int(11) NOT NULL,
  `fecha_aplicacion` date NOT NULL,
  `dosis` int(11) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `reaccion_adversa` varchar(255) DEFAULT NULL,
  `id_personal_salud` int(11) NOT NULL,
  `id_ciudadano` int(11) NOT NULL,
  `id_vacuna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD KEY `fk_auditoria_usuario` (`id_usuario`);

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
  ADD KEY `fk_esquema_vacuna` (`id_vacuna`);

--
-- Indices de la tabla `inventario_lote`
--
ALTER TABLE `inventario_lote`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `fk_inventario_vacuna` (`id_vacuna`);

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
  ADD KEY `fk_recordatorio_ciudadano` (`id_usuario`),
  ADD KEY `fk_recordatorio_esquema` (`id_esquema`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `numero_documento` (`numero_documento`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `vacuna`
--
ALTER TABLE `vacuna`
  ADD PRIMARY KEY (`id_vacuna`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `vacunacion`
--
ALTER TABLE `vacunacion`
  ADD PRIMARY KEY (`id_vacunacion`),
  ADD KEY `fk_vacunacion_vacuna` (`id_vacuna`),
  ADD KEY `fk_vacunacion_ciudadano` (`id_ciudadano`),
  ADD KEY `fk_vacunacion_personal` (`id_personal_salud`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id_auditoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `esquema_vacunacion`
--
ALTER TABLE `esquema_vacunacion`
  MODIFY `id_esquema` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario_lote`
--
ALTER TABLE `inventario_lote`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  MODIFY `id_recordatorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vacuna`
--
ALTER TABLE `vacuna`
  MODIFY `id_vacuna` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vacunacion`
--
ALTER TABLE `vacunacion`
  MODIFY `id_vacunacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_admin_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `fk_auditoria_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD CONSTRAINT `fk_ciudadano_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `esquema_vacunacion`
--
ALTER TABLE `esquema_vacunacion`
  ADD CONSTRAINT `fk_esquema_vacuna` FOREIGN KEY (`id_vacuna`) REFERENCES `vacuna` (`id_vacuna`);

--
-- Filtros para la tabla `inventario_lote`
--
ALTER TABLE `inventario_lote`
  ADD CONSTRAINT `fk_inventario_vacuna` FOREIGN KEY (`id_vacuna`) REFERENCES `vacuna` (`id_vacuna`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `personal_salud`
--
ALTER TABLE `personal_salud`
  ADD CONSTRAINT `fk_personal_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  ADD CONSTRAINT `fk_recordatorio_ciudadano` FOREIGN KEY (`id_usuario`) REFERENCES `ciudadano` (`id_usuario`),
  ADD CONSTRAINT `fk_recordatorio_esquema` FOREIGN KEY (`id_esquema`) REFERENCES `esquema_vacunacion` (`id_esquema`);

--
-- Filtros para la tabla `vacunacion`
--
ALTER TABLE `vacunacion`
  ADD CONSTRAINT `fk_vacunacion_ciudadano` FOREIGN KEY (`id_ciudadano`) REFERENCES `ciudadano` (`id_usuario`),
  ADD CONSTRAINT `fk_vacunacion_personal` FOREIGN KEY (`id_personal_salud`) REFERENCES `personal_salud` (`id_usuario`),
  ADD CONSTRAINT `fk_vacunacion_vacuna` FOREIGN KEY (`id_vacuna`) REFERENCES `vacuna` (`id_vacuna`);
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de datos: `tienda_inventario`
--
CREATE DATABASE IF NOT EXISTS `tienda_inventario` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda_inventario`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `created_at`, `imagen`) VALUES
(1, 'Bebidas', '2025-12-02 22:18:48', '/uploads/categoria-1764965703204-317667025.png'),
(4, 'Mekatos', '2025-12-02 22:18:48', '/uploads/meka.png'),
(5, 'Canasta Basica', '2025-12-02 22:18:48', '/uploads/categoria-1765997737953-993416173.png'),
(6, 'Aseo Personal', '2025-12-02 22:18:48', '/uploads/aseo.png'),
(7, 'Limpieza', '2025-12-02 22:18:48', '/uploads/categoria-1764968345310-152897819.png'),
(8, 'Cigarrillos', '2025-12-05 17:11:35', '/uploads/categoria-1764968147112-837969558.png'),
(10, 'Cervezas', '2025-12-05 21:01:07', '/uploads/categoria-1764968686629-456538264.png'),
(11, 'Peso', '2025-12-15 23:36:12', '/uploads/categoria-1765843056634-16415663.png'),
(12, 'Papeleria y variedades', '2025-12-17 18:18:23', '/uploads/categoria-1765995553093-403027706.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `created_at`) VALUES
(1, 'Tania', '2025-12-02 22:34:17'),
(2, 'KHE NIVEL', '2025-12-04 17:51:24'),
(3, 'Mango', '2025-12-04 18:17:39'),
(4, 'Verde', '2025-12-10 16:23:33'),
(5, 'moes', '2025-12-19 21:16:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_venta`
--

CREATE TABLE `detalles_venta` (
  `id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `tamaño` varchar(50) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precio_media` decimal(10,2) DEFAULT NULL,
  `precio_completo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `categoria_id`, `tamaño`, `imagen`, `stock`, `created_at`, `updated_at`, `precio_media`, `precio_completo`) VALUES
(1, 'Coca Cola', 6500.00, 1, '1.5 Litros', 'categoria-1764965703204-317667025.png', 0, '2025-12-02 22:18:48', '2026-02-23 17:40:22', NULL, NULL),
(2, 'Pepsi', 2400.00, 1, '1 Litro', 'categoria-1764965703204-317667025.png', 35, '2025-12-02 22:18:48', '2026-02-23 17:40:22', NULL, NULL),
(4, 'Arroz Roa', 3200.00, 5, '1/2 Libra', 'categoria-1765997737953-993416173.png', 35, '2025-12-02 22:18:48', '2026-02-23 17:40:22', NULL, NULL),
(5, 'Leche Alpina', 4500.00, 5, '1100 ML', 'categoria-1765997737953-993416173.png', 52, '2025-12-02 22:18:48', '2026-02-23 17:40:22', NULL, NULL),
(6, 'Leche Colanta', 4400.00, 5, '900 ML', 'categoria-1765997737953-993416173.png', 43, '2025-12-02 22:18:48', '2026-02-23 17:40:22', NULL, NULL),
(9, 'Banano', 600.00, 5, NULL, 'categoria-1765997737953-993416173.png', 8, '2025-12-02 22:18:48', '2026-02-23 17:40:22', NULL, NULL),
(10, 'Tomate', 3000.00, 11, NULL, '/uploads/producto-1764878871680-59898805.png', 16, '2025-12-02 22:18:48', '2026-01-22 21:05:40', NULL, NULL),
(11, 'Jabón Protex', 2500.00, 6, NULL, 'aseo.png', 65, '2025-12-02 22:18:48', '2026-02-23 17:40:22', NULL, NULL),
(13, 'Detergente Ariel', 8000.00, 7, NULL, 'categoria-1764968345310-152897819.png', 31, '2025-12-02 22:18:48', '2026-02-23 17:40:22', NULL, NULL),
(14, 'Clorox', 3500.00, 7, '1 Litro', 'categoria-1764968345310-152897819.png', 1, '2025-12-02 22:18:48', '2026-02-23 17:40:22', NULL, NULL),
(15, 'Arroz Diana', 3000.00, 5, '1 Libra', 'categoria-1765997737953-993416173.png', 75, '2025-12-02 22:22:28', '2026-02-23 17:40:22', NULL, NULL),
(16, 'Tio Nacho', 1300.00, 6, NULL, 'aseo.png', 5, '2025-12-04 15:49:01', '2026-02-23 17:40:22', NULL, NULL),
(17, 'Head & Shoulders', 1300.00, 6, NULL, 'aseo.png', 25, '2025-12-04 15:50:13', '2026-02-23 17:40:22', NULL, NULL),
(18, 'Frijoles', 2500.00, 5, '1/2 Libra', 'categoria-1765997737953-993416173.png', 24, '2025-12-04 19:35:13', '2026-02-23 17:40:22', NULL, NULL),
(19, 'Coca Cola', 1500.00, 1, '125 ML', 'categoria-1764965703204-317667025.png', 20, '2025-12-04 21:41:54', '2026-02-23 17:40:22', NULL, NULL),
(20, 'Coca Cola', 2600.00, 1, '300 ML', 'categoria-1764965703204-317667025.png', 15, '2025-12-04 21:42:31', '2026-02-23 17:40:22', NULL, NULL),
(21, 'Coca Cola', 3500.00, 1, '1 Litro', 'categoria-1764965703204-317667025.png', 10, '2025-12-04 21:42:50', '2026-02-23 17:40:22', NULL, NULL),
(22, 'Coca Cola', 5000.00, 1, '2 Litros', 'categoria-1764965703204-317667025.png', 10, '2025-12-04 21:43:21', '2026-02-23 17:40:22', NULL, NULL),
(23, 'Coca Cola', 3200.00, 1, '400 ML', 'categoria-1764965703204-317667025.png', 0, '2025-12-04 21:44:04', '2026-02-23 17:40:22', NULL, NULL),
(24, 'Coca Cola', 8500.00, 1, '2.25 Litros', 'categoria-1764965703204-317667025.png', 0, '2025-12-04 21:44:40', '2026-02-23 17:40:22', NULL, NULL),
(25, 'Cigarrillos L&M', 500.00, 8, NULL, 'categoria-1764968147112-837969558.png', 5, '2025-12-05 17:11:35', '2026-02-23 17:40:22', 4500.00, 8000.00),
(26, 'Cerveza Aguila', 3500.00, 10, '300 ML', 'categoria-1764968686629-456538264.png', 36, '2025-12-05 21:01:07', '2026-02-23 17:40:22', NULL, NULL),
(27, 'Sedal Rizos', 1300.00, 6, NULL, 'aseo.png', 8, '2025-12-10 18:14:17', '2026-02-23 17:40:22', NULL, NULL),
(28, 'Patene Shampoo Sin Sal', 1300.00, 6, NULL, 'aseo.png', 17, '2025-12-10 18:15:06', '2026-02-23 17:40:22', NULL, NULL),
(29, 'Dove Shampoo', 1300.00, 6, NULL, 'aseo.png', 134, '2025-12-10 18:15:40', '2026-02-23 17:40:22', NULL, NULL),
(30, 'Sedal ', 1300.00, 6, NULL, 'aseo.png', 17, '2025-12-10 18:16:26', '2026-02-23 17:40:22', NULL, NULL),
(31, 'Pantene Crema para peinar', 1300.00, 6, NULL, 'aseo.png', 15, '2025-12-10 18:17:34', '2026-02-23 17:40:22', NULL, NULL),
(32, 'El Rodeo Esencial', 1300.00, 5, '25 G', 'categoria-1765997737953-993416173.png', 7, '2025-12-10 18:18:31', '2026-02-23 17:40:22', NULL, NULL),
(33, 'Leche Klim', 1800.00, 5, '26 G', 'categoria-1765997737953-993416173.png', 15, '2025-12-10 18:20:18', '2026-02-23 17:40:22', NULL, NULL),
(34, 'Nestum', 2000.00, 5, '25 G', 'categoria-1765997737953-993416173.png', 16, '2025-12-10 18:22:39', '2026-02-23 17:40:22', NULL, NULL),
(35, 'Queso', 21000.00, 11, NULL, '/uploads/producto-1765841772560-404324292.png', 0, '2025-12-15 23:36:12', '2026-01-25 18:49:42', NULL, NULL),
(36, 'Papa', 2000.00, 11, NULL, '/uploads/producto-1765841909745-949310010.png', 0, '2025-12-15 23:38:29', '2025-12-18 20:15:00', NULL, NULL),
(37, 'Saca Punta', 500.00, 12, NULL, '/uploads/producto-1765995503494-723402605.png', 46, '2025-12-17 18:18:23', '2025-12-17 18:19:23', NULL, NULL),
(38, 'Guineo Verde', 400.00, 5, NULL, 'categoria-1765997737953-993416173.png', 27, '2025-12-17 18:50:03', '2026-02-23 17:40:22', NULL, NULL),
(39, 'Platano', 1400.00, 5, NULL, 'categoria-1765997737953-993416173.png', 49, '2025-12-17 18:50:33', '2026-02-23 17:40:22', NULL, NULL),
(40, 'Huevo', 700.00, 5, NULL, 'categoria-1765997737953-993416173.png', 22, '2025-12-17 18:50:54', '2026-02-23 17:40:22', NULL, NULL),
(41, 'Huevos Kikes', 12500.00, 5, '15 Unidades', 'categoria-1765997737953-993416173.png', 7, '2025-12-17 18:51:31', '2026-02-23 17:40:22', NULL, NULL),
(42, 'Salsa de Tomate Bary', 2500.00, 5, '1100 G', 'categoria-1765997737953-993416173.png', 12, '2025-12-17 18:52:19', '2026-02-23 17:40:22', NULL, NULL),
(43, 'Sal Refisal', 1900.00, 5, '1 Libra', 'categoria-1765997737953-993416173.png', 28, '2025-12-17 18:53:12', '2026-02-23 17:40:22', NULL, NULL),
(44, 'Azucar Manuelita', 3000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2025-12-17 18:53:47', '2026-02-23 17:40:22', NULL, NULL),
(45, 'Café Sello Rojo', 2700.00, 5, '60 G', 'categoria-1765997737953-993416173.png', 20, '2025-12-17 19:00:50', '2026-02-23 17:40:22', NULL, NULL),
(46, 'Café Colcafe Papeleta', 1500.00, 5, '8 G', 'categoria-1765997737953-993416173.png', 25, '2025-12-17 19:01:43', '2026-02-23 17:40:22', NULL, NULL),
(47, 'Cafe Colcafe Papeletica', 300.00, 5, '1.5 G', 'categoria-1765997737953-993416173.png', 51, '2025-12-17 19:02:19', '2026-02-23 17:40:22', NULL, NULL),
(48, 'Nescafé', 400.00, 5, NULL, 'categoria-1765997737953-993416173.png', 59, '2025-12-17 19:02:45', '2026-02-23 17:40:22', NULL, NULL),
(49, 'Fabuloso', 2500.00, 7, '200 ML', 'categoria-1764968345310-152897819.png', 18, '2025-12-17 19:03:24', '2026-02-23 17:40:22', NULL, NULL),
(50, 'Pan Tajado Completo', 4000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 20, '2025-12-17 19:03:52', '2026-02-23 17:40:22', NULL, NULL),
(51, 'Jugo Hit Personal', 3000.00, 1, NULL, 'categoria-1764965703204-317667025.png', 10, '2025-12-17 19:04:24', '2026-02-23 17:40:22', NULL, NULL),
(52, 'Jugo Hit', 5000.00, 1, '1 Litro', 'categoria-1764965703204-317667025.png', 21, '2025-12-17 19:05:01', '2026-02-23 17:40:22', NULL, NULL),
(53, 'Botalla de Agua', 2000.00, 1, NULL, 'categoria-1764965703204-317667025.png', 12, '2025-12-17 19:05:43', '2026-02-23 17:40:22', NULL, NULL),
(54, 'Botalla de Agua', 800.00, 1, NULL, 'categoria-1764965703204-317667025.png', 19, '2025-12-17 19:06:09', '2026-02-23 17:40:22', NULL, NULL),
(55, 'Botella de Agua con Gas', 2000.00, 1, NULL, 'categoria-1764965703204-317667025.png', 3, '2025-12-17 19:06:39', '2026-02-23 17:40:22', NULL, NULL),
(56, 'Escoba', 9500.00, 12, NULL, '/uploads/producto-1766079863148-206663655.png', 6, '2025-12-18 17:44:23', '2026-01-27 16:42:45', NULL, NULL),
(57, 'Trapero', 9500.00, 12, NULL, '/uploads/producto-1766079886834-152256883.png', 6, '2025-12-18 17:44:46', '2025-12-19 21:39:26', NULL, NULL),
(58, 'Detoditos', 2600.00, 4, '60 G', 'meka.png', 23, '2025-12-19 21:37:15', '2026-02-23 17:40:22', NULL, NULL),
(59, 'Papitas Margarita', 2500.00, 4, '60 G', 'meka.png', 32, '2025-12-19 21:37:42', '2026-02-23 17:40:22', NULL, NULL),
(60, 'Chocorramo', 2700.00, 4, '65 G', 'meka.png', 23, '2025-12-19 21:38:22', '2026-02-23 17:40:22', NULL, NULL),
(61, 'Arroz Diana', 1600.00, 5, '1/2 Libra', 'categoria-1765997737953-993416173.png', 19, '2025-12-20 17:41:09', '2026-02-23 17:40:22', NULL, NULL),
(62, 'Arroz Comuneros', 3500.00, 5, '1 Libra', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:17:09', '2026-02-23 17:40:22', NULL, NULL),
(63, 'Arroz Pinillar', 3000.00, 5, '1 Libra', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:18:51', '2026-02-23 17:40:22', NULL, NULL),
(64, 'Arroz Pinillar', 1600.00, 5, '1/2 Libra', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:19:32', '2026-02-23 17:40:22', NULL, NULL),
(65, 'Azucar Morena', 3000.00, 5, '1 Libra', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:21:28', '2026-02-23 17:40:22', NULL, NULL),
(66, 'Azucar Rio Paila', 3000.00, 5, '1 Libra', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:22:37', '2026-02-23 17:40:22', NULL, NULL),
(67, 'Azucar Sembrador', 1600.00, 5, '1/2 Libra', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:25:45', '2026-02-23 17:40:22', NULL, NULL),
(68, 'Sal Doña Blanca', 1000.00, 5, '400 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:28:12', '2026-02-23 17:40:22', NULL, NULL),
(69, 'Mi Sal ', 1000.00, 5, '1 Libra', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:31:04', '2026-02-23 17:40:22', NULL, NULL),
(70, 'Fideo Comarico', 1200.00, 5, '125 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:33:42', '2026-02-23 17:40:22', NULL, NULL),
(71, 'Macarron Grueso', 2500.00, 5, '250 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:36:19', '2026-02-23 17:40:22', NULL, NULL),
(72, 'Fideos Buena Mesa', 1000.00, 5, '120 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:38:08', '2026-02-23 17:40:22', NULL, NULL),
(73, 'Fideos Tornillos', 2500.00, 5, '250 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:39:18', '2026-02-23 17:40:22', NULL, NULL),
(74, 'Fideos Caracol', 2500.00, 5, '250 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:40:21', '2026-02-23 17:40:22', NULL, NULL),
(75, 'Sopa Aji-no-men', 3800.00, 5, '80 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:41:35', '2026-02-23 17:40:22', NULL, NULL),
(76, 'Maiz Pira', 2500.00, 5, '220 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:43:06', '2026-02-23 17:40:22', NULL, NULL),
(77, 'Frijol Rojo', 2800.00, 5, '220 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:44:21', '2026-02-23 17:40:22', NULL, NULL),
(78, 'Lentejas', 2800.00, 5, '220 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:45:54', '2026-02-23 17:40:22', NULL, NULL),
(79, 'Frijol Cabezita Negra', 2600.00, 5, '220 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:47:50', '2026-02-23 17:40:22', NULL, NULL),
(80, 'Harina Pan', 5000.00, 5, '1 Kilo', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:54:04', '2026-02-23 17:40:22', NULL, NULL),
(81, 'Harina Pan', 2500.00, 5, '1 Libra', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:55:09', '2026-02-23 17:40:22', NULL, NULL),
(82, 'Arepa Arepa', 2600.00, 5, '1 Libra', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 18:59:02', '2026-02-23 17:40:22', NULL, NULL),
(83, 'Harina de Trigo', 2600.00, 5, '1 Libra', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 19:00:48', '2026-02-23 17:40:22', NULL, NULL),
(84, 'Avena en Hojuela', 1500.00, 5, '115 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 19:01:35', '2026-02-23 17:40:22', NULL, NULL),
(85, 'Avena Molida', 1500.00, 5, '115 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 19:02:04', '2026-02-23 17:40:22', NULL, NULL),
(86, 'Salsa Mostaza', 300.00, 5, '8 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 19:17:00', '2026-02-23 17:40:22', NULL, NULL),
(87, 'Salsa Negra', 300.00, 5, '7 ML', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 19:17:27', '2026-02-23 17:40:22', NULL, NULL),
(88, 'Ajo Listo', 700.00, 5, '20 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 19:17:55', '2026-02-23 17:40:22', NULL, NULL),
(89, 'Mayonesa San Jorge', 1000.00, 5, '40 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 19:18:33', '2026-02-23 17:40:22', NULL, NULL),
(90, 'Salsa de Tomate San Jorge', 1000.00, 5, '40 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 19:19:23', '2026-02-23 17:40:22', NULL, NULL),
(91, 'Salsa de Tomate Fruko', 2000.00, 5, '80 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 19:19:51', '2026-02-23 17:40:22', NULL, NULL),
(92, 'Mayonesa Fruko', 2000.00, 5, '80 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 19:20:29', '2026-02-23 17:40:22', NULL, NULL),
(93, 'Salsa BBQ', 2000.00, 5, '80 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 19:21:34', '2026-02-23 17:40:22', NULL, NULL),
(94, 'Mostaza', 1500.00, 5, '90 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 19:58:58', '2026-02-23 17:40:22', NULL, NULL),
(95, 'Salsa Tartara', 2200.00, 5, '80 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 19:59:42', '2026-02-23 17:40:22', NULL, NULL),
(96, 'Salsa Rosada Bary ', 2500.00, 5, '1100 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 20:00:40', '2026-02-23 17:40:22', NULL, NULL),
(97, 'Mayonesa Bary', 2500.00, 5, '1100 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 20:01:51', '2026-02-23 17:40:22', NULL, NULL),
(98, 'Salsa Tartara Alfresko', 7000000.00, 5, '200 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 20:05:42', '2026-02-23 17:40:22', NULL, NULL),
(99, 'Mostaza Bary', 2500.00, 5, '1100 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 20:06:15', '2026-02-23 17:40:22', NULL, NULL),
(100, 'Salsa Tomate 26B', 6500.00, 5, '500 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 20:07:23', '2026-02-23 17:40:22', NULL, NULL),
(101, 'Salsa de Tomate Pompeya', 12000.00, 5, '1000 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 20:08:37', '2026-02-23 17:40:22', NULL, NULL),
(102, 'Mostaza Pompeya', 12000.00, 5, '1000 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 20:09:14', '2026-02-23 17:40:22', NULL, NULL),
(103, 'Mayonesa Alfresco', 4100.00, 5, '200 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 20:11:14', '2026-02-23 17:40:22', NULL, NULL),
(104, 'Mostaza San Jorge', 2700.00, 5, '100 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 20:12:40', '2026-02-23 17:40:22', NULL, NULL),
(105, 'Salsa Negra La Constancia', 2500.00, 5, '100 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-20 20:14:17', '2026-02-23 17:40:22', NULL, NULL),
(106, 'Salsa Aji Picante Duque', 3800.00, 5, '375 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:28:52', '2026-02-23 17:40:22', NULL, NULL),
(107, 'Salsa Soya la Constancia', 2500.00, 5, '100 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:29:41', '2026-02-23 17:40:22', NULL, NULL),
(108, 'Vinagreta Bary', 2700.00, 5, '110 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:30:42', '2026-02-23 17:40:22', NULL, NULL),
(109, 'Salsa Aji Picante Mash Jungla', 4500.00, 5, '155 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:31:33', '2026-02-23 17:40:22', NULL, NULL),
(113, 'Salsa Aji Picante Mashs', 3800.00, 5, '175 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:32:41', '2026-02-23 17:40:22', NULL, NULL),
(114, 'Salsa Piña', 2500.00, 5, '80 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:33:36', '2026-02-23 17:40:22', NULL, NULL),
(115, 'Mermelada de Piña la Constancia', 3000.00, 5, '80 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:34:14', '2026-02-23 17:40:22', NULL, NULL),
(116, 'Vinagre San Jorge', 500.00, 5, '25 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:35:23', '2026-02-23 17:40:22', NULL, NULL),
(117, 'Vinagre Blanco Eden', 2000.00, 5, '500 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:36:03', '2026-02-23 17:40:22', NULL, NULL),
(118, 'Vinagre Blanco Selecto', 7000.00, 5, '3000 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:36:48', '2026-02-23 17:40:22', NULL, NULL),
(119, 'Salsa de Soya SEV', 3500.00, 5, '178 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:37:21', '2026-02-23 17:40:22', NULL, NULL),
(120, 'Arbeja Selecto', 5500.00, 5, '310 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:37:55', '2026-02-23 17:40:22', NULL, NULL),
(121, 'Arberja con Zanahoria', 5500.00, 5, '310 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:38:47', '2026-02-23 17:40:22', NULL, NULL),
(122, 'Maiz Tierno Cooltivo', 6800.00, 5, '340 G', 'categoria-1765997737953-993416173.png', 0, '2025-12-22 20:39:26', '2026-02-23 17:40:22', NULL, NULL),
(123, 'Maiz Dulce Andalucia', 6000.00, 5, '130 G', 'categoria-1765997737953-993416173.png', 50, '2026-01-22 19:29:19', '2026-02-23 17:40:22', NULL, NULL),
(124, 'Atun Van Camps', 8000.00, 5, '104 G', 'categoria-1765997737953-993416173.png', 47, '2026-01-22 20:06:54', '2026-02-23 17:40:22', NULL, NULL),
(125, 'Atun Aceite Girasol', 7500.00, 5, '160 G', 'categoria-1765997737953-993416173.png', 50, '2026-01-22 20:07:38', '2026-02-23 17:40:22', NULL, NULL),
(126, 'Atun Bary', 7500.00, 5, '140 G', 'categoria-1765997737953-993416173.png', 20, '2026-01-22 20:08:17', '2026-02-23 17:40:22', NULL, NULL),
(127, 'Sardina Selecto', 4500.00, 5, '155 G', 'categoria-1765997737953-993416173.png', 50, '2026-01-22 20:11:42', '2026-02-23 17:40:22', NULL, NULL),
(128, 'Sardina AndaLucia', 8000.00, 5, '200 G', 'categoria-1765997737953-993416173.png', 20, '2026-01-22 20:12:14', '2026-02-23 17:40:22', NULL, NULL),
(129, 'Alcaparro Alfresco', 6500.00, 5, '70 G', 'categoria-1765997737953-993416173.png', 30, '2026-01-22 20:12:55', '2026-02-23 17:40:22', NULL, NULL),
(130, 'Salchicha Zenu', 6000.00, 5, '150 G', 'categoria-1765997737953-993416173.png', 30, '2026-01-22 20:13:40', '2026-02-23 17:40:22', NULL, NULL),
(131, 'Esencia Coco - Vainilla - Kola', 2500.00, 5, '250 G', 'categoria-1765997737953-993416173.png', 30, '2026-01-22 20:14:25', '2026-02-23 17:40:22', NULL, NULL),
(132, 'Maizena Original', 4200.00, 5, '90 G', 'categoria-1765997737953-993416173.png', 30, '2026-01-22 20:14:58', '2026-02-23 17:40:22', NULL, NULL),
(133, 'Kola Granulada', 2400.00, 5, '200 G', 'categoria-1765997737953-993416173.png', 30, '2026-01-22 20:16:01', '2026-02-23 17:40:22', NULL, NULL),
(134, 'Leche condensada', 3800.00, 5, '90 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:30:10', '2026-02-23 17:40:22', NULL, NULL),
(135, 'Leche condensada', 1200.00, 5, '25 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:30:27', '2026-02-23 17:40:22', NULL, NULL),
(136, 'Nescafé', 2000.00, 5, '10 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:31:03', '2026-02-23 17:40:22', NULL, NULL),
(137, 'Cafe Tostao', 250.00, 5, '1.5 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:31:40', '2026-02-23 17:40:22', NULL, NULL),
(138, 'Chocolate Corona ', 1200.00, 5, '25 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:32:12', '2026-02-23 17:40:22', NULL, NULL),
(139, 'Cafe sello Rojo', 1500.00, 5, '20 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:32:41', '2026-02-23 17:40:22', NULL, NULL),
(140, 'Cafe sello Rojo', 2800.00, 5, '40 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:33:00', '2026-02-23 17:40:22', NULL, NULL),
(141, 'Milo', 1200.00, 5, '20 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:33:28', '2026-02-23 17:40:22', NULL, NULL),
(142, 'Cafe Tostao Selecto', 1800.00, 5, '40 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:34:01', '2026-02-23 17:40:22', NULL, NULL),
(143, 'Cafe Juan Valdez', 2000.00, 5, '10 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:34:29', '2026-02-23 17:40:22', NULL, NULL),
(144, 'Chocolisto', 1000.00, 5, '18 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:35:07', '2026-02-23 17:40:22', NULL, NULL),
(145, 'Aceite Ideal', 27000.00, 5, '3 Litros', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:35:43', '2026-02-23 17:40:22', NULL, NULL),
(146, 'Aceite Ideal', 9000.00, 5, '900 ML', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:36:34', '2026-02-23 17:40:22', NULL, NULL),
(147, 'Aceite Samario', 9000.00, 5, '900 ML', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:37:06', '2026-02-23 17:40:22', NULL, NULL),
(148, 'Aceite Ideal', 4500.00, 5, '394 ML', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:37:32', '2026-02-23 17:40:22', NULL, NULL),
(149, 'Aceite Samario', 4500.00, 5, '450 ML', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:38:23', '2026-02-23 17:40:22', NULL, NULL),
(150, 'Aceite Ideal', 3000.00, 5, '191 ML', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:39:00', '2026-02-23 17:40:22', NULL, NULL),
(151, 'Aceite Samario', 3000.00, 5, '220 ML', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:39:24', '2026-02-23 17:40:22', NULL, NULL),
(152, 'Galleta Saltin', 2000.00, 5, '102 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:40:00', '2026-02-23 17:40:22', NULL, NULL),
(153, 'Galleta Ducales', 4000.00, 5, '105 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:40:28', '2026-02-23 17:40:22', NULL, NULL),
(154, 'Maggie Desmenuzada ', 600.00, 5, '9 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:41:12', '2026-02-23 17:40:22', NULL, NULL),
(155, 'Ricostilla Original', 600.00, 5, '9 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-22 21:41:42', '2026-02-23 17:40:22', NULL, NULL),
(156, 'Ricostilla en cubo', 600.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:51:31', '2026-02-23 17:40:22', NULL, NULL),
(157, 'Magii en cubo', 600.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:52:12', '2026-02-23 17:40:22', NULL, NULL),
(158, 'Revuelto seco Unidad', 400.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:52:33', '2026-02-23 17:40:22', NULL, NULL),
(159, 'Pimienta picante Rey', 2500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:52:59', '2026-02-23 17:40:22', NULL, NULL),
(160, 'Ajo Molido Rey', 1000.00, 5, '13 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:53:43', '2026-02-23 17:40:22', NULL, NULL),
(161, 'Pimienta picante Rey', 1000.00, 5, '8 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:54:11', '2026-02-23 17:40:22', NULL, NULL),
(162, 'Tomillo Rey', 2000.00, 5, '20 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:54:41', '2026-02-23 17:40:22', NULL, NULL),
(163, 'Oregano Rey', 2000.00, 5, '10 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:55:16', '2026-02-23 17:40:22', NULL, NULL),
(164, 'Hiervas finas', 2000.00, 5, '15 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:55:50', '2026-02-23 17:40:22', NULL, NULL),
(165, 'Ajo Molido ', 2500.00, 5, '55 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:57:04', '2026-02-23 17:40:22', NULL, NULL),
(166, 'Sasona Rey', 2500.00, 5, '110 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:57:33', '2026-02-23 17:40:22', NULL, NULL),
(167, 'Finas Hiervas', 1000.00, 5, '4 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:58:07', '2026-02-23 17:40:22', NULL, NULL),
(168, 'Sasona Rey pequeño', 500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:58:44', '2026-02-23 17:40:22', NULL, NULL),
(169, 'Salsita Color', 100.00, 5, '1.6 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 18:59:18', '2026-02-23 17:40:22', NULL, NULL),
(170, 'Trisason', 200.00, 5, '1.4 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:00:04', '2026-02-23 17:40:22', NULL, NULL),
(171, 'Pimienta', 200.00, 5, '1.4 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:01:06', '2026-02-23 17:40:22', NULL, NULL),
(172, 'Comino', 100.00, 5, '1.5 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:01:26', '2026-02-23 17:40:22', NULL, NULL),
(173, 'Don sabor Sobre', 200.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:01:55', '2026-02-23 17:40:22', NULL, NULL),
(174, 'Don gustico', 200.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:02:11', '2026-02-23 17:40:22', NULL, NULL),
(175, 'Tricompleto Rey sobre', 100.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:03:04', '2026-02-23 17:40:22', NULL, NULL),
(176, 'Manzanilla Sobre', 500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:03:31', '2026-02-23 17:40:22', NULL, NULL),
(177, 'Pimienta de olor', 500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:03:50', '2026-02-23 17:40:22', NULL, NULL),
(178, 'Bicarbonato Rey', 500.00, 5, '10 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:04:29', '2026-02-23 17:40:22', NULL, NULL),
(179, 'Bicarbonato sobre ', 500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:05:21', '2026-02-23 17:40:22', NULL, NULL),
(180, 'Tricompleto Rey sobre', 1000.00, 5, '20 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:06:06', '2026-02-23 17:40:22', NULL, NULL),
(181, 'Anix en grano sobre', 500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:06:49', '2026-02-23 17:40:22', NULL, NULL),
(183, 'Canela en sobre', 500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:07:10', '2026-02-23 17:40:22', NULL, NULL),
(184, 'Canela', 1000.00, 5, '11 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:07:55', '2026-02-23 17:40:22', NULL, NULL),
(185, 'Clavo Olor Sobre', 500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:08:11', '2026-02-23 17:40:22', NULL, NULL),
(186, 'Papel Higienico Elite ', 1500.00, 6, NULL, 'aseo.png', 0, '2026-01-24 19:34:44', '2026-02-23 17:40:22', NULL, NULL),
(187, 'Papel Higienico Familia Exper', 2500.00, 6, NULL, 'aseo.png', 0, '2026-01-24 19:35:12', '2026-02-23 17:40:22', NULL, NULL),
(188, 'Papel Higienico Familia Megarollo', 3800.00, 6, NULL, 'aseo.png', 0, '2026-01-24 19:35:36', '2026-02-23 17:40:22', NULL, NULL),
(189, 'Papel Higienico Familia pequeño', 1500.00, 6, NULL, 'aseo.png', 0, '2026-01-24 19:35:59', '2026-02-23 17:40:22', NULL, NULL),
(190, 'Papel Higienico Rosal pequeño', 1500.00, 6, NULL, 'aseo.png', 0, '2026-01-24 19:36:24', '2026-02-23 17:40:22', NULL, NULL),
(191, 'Papel Higienico Rosal grande', 2500.00, 6, NULL, 'aseo.png', 0, '2026-01-24 19:36:52', '2026-02-23 17:40:22', NULL, NULL),
(192, 'Toallas Cocina Familia', 2800.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-01-24 19:37:26', '2026-02-23 17:40:22', NULL, NULL),
(193, 'Bombillo luz amarrilla', 3000.00, 12, NULL, '/uploads/producto-1769283474267-106248107.png', 0, '2026-01-24 19:37:54', '2026-01-24 19:37:54', NULL, NULL),
(194, 'Bombillo luz Blanca', 4800.00, 12, NULL, '/uploads/producto-1769283496995-542127294.png', 0, '2026-01-24 19:38:16', '2026-01-24 19:38:16', NULL, NULL),
(195, 'Platos 18cm', 5500.00, 12, NULL, '/uploads/producto-1769283533203-154716100.png', 0, '2026-01-24 19:38:53', '2026-01-24 19:38:53', NULL, NULL),
(196, 'Platos 20cm', 6500.00, 12, NULL, '/uploads/producto-1769283552987-442830903.png', 0, '2026-01-24 19:39:12', '2026-01-24 19:39:12', NULL, NULL),
(197, 'Alcancia pequeña', 2000.00, 12, NULL, '/uploads/producto-1769283574651-445817845.png', 0, '2026-01-24 19:39:34', '2026-01-24 19:39:34', NULL, NULL),
(198, 'Alcancia grande', 3000.00, 12, NULL, '/uploads/producto-1769283592667-191914343.png', 0, '2026-01-24 19:39:52', '2026-01-24 19:39:52', NULL, NULL),
(199, 'Uvas pasas', 1500.00, 5, '20 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:40:11', '2026-02-23 17:40:22', NULL, NULL),
(200, 'Guantes Domesticos', 5500.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-01-24 19:40:38', '2026-02-23 17:40:22', NULL, NULL),
(201, 'Guantes Plasticos', 4000.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-01-24 19:41:09', '2026-02-23 17:40:22', NULL, NULL),
(202, 'Panela pequeña', 2000.00, 5, '65 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:41:43', '2026-02-23 17:40:22', NULL, NULL),
(203, 'Panela Grande', 4500.00, 5, '500 G', 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:41:57', '2026-02-23 17:40:22', NULL, NULL),
(204, 'Panela Mediana', 4000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-24 19:42:10', '2026-02-23 17:40:22', NULL, NULL),
(205, 'Prestobarba Dorko', 1000.00, 6, NULL, 'aseo.png', 0, '2026-01-24 19:43:10', '2026-02-23 17:40:22', NULL, NULL),
(206, 'Prestobarba Minora', 2000.00, 6, NULL, 'aseo.png', 0, '2026-01-24 19:43:28', '2026-02-23 17:40:22', NULL, NULL),
(207, 'Prestobarba Gillete doble hoja', 4000.00, 6, NULL, 'aseo.png', 0, '2026-01-24 19:43:54', '2026-02-23 17:40:22', NULL, NULL),
(208, 'Prestobarba Gillete triple hoja', 5000.00, 6, NULL, 'aseo.png', 0, '2026-01-24 19:44:17', '2026-02-23 17:40:22', NULL, NULL),
(209, 'Prestobarba Schick cuatro hojas', 5000.00, 6, NULL, 'aseo.png', 0, '2026-01-24 19:44:59', '2026-02-23 17:40:22', NULL, NULL),
(210, 'Prestobarba Schick Dama', 2500.00, 6, NULL, 'aseo.png', 0, '2026-01-24 19:45:29', '2026-02-23 17:40:22', NULL, NULL),
(211, 'Blancox Limpido', 2000.00, 7, '500 ML', 'categoria-1764968345310-152897819.png', 0, '2026-01-25 19:16:49', '2026-02-23 17:40:22', NULL, NULL),
(212, 'Blancox Repuesto', 1800.00, 7, '500 ML', 'categoria-1764968345310-152897819.png', 0, '2026-01-25 19:18:39', '2026-02-23 17:40:22', NULL, NULL),
(213, 'Blancox', 700.00, 7, '100 ML', 'categoria-1764968345310-152897819.png', 0, '2026-01-25 19:19:06', '2026-02-23 17:40:22', NULL, NULL),
(214, 'Blancox Ropa color repuesto', 2500.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-01-25 19:19:30', '2026-02-23 17:40:22', NULL, NULL),
(215, 'Blancox Botella', 3200.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-01-25 19:19:48', '2026-02-23 17:40:22', NULL, NULL),
(216, 'Limpido EverHouse ', 4200.00, 7, '500 ML', 'categoria-1764968345310-152897819.png', 0, '2026-01-25 19:20:46', '2026-02-23 17:40:22', NULL, NULL),
(217, 'Pañales Winy Etapa 3', 1800.00, 6, 'Etapa 3', 'aseo.png', 0, '2026-01-25 19:23:26', '2026-02-23 17:40:22', NULL, NULL),
(218, 'Pañales Winy Etapa 2', 1800.00, 6, 'Etapa 2', 'aseo.png', 0, '2026-01-25 19:25:25', '2026-02-23 17:40:22', NULL, NULL),
(219, 'Pañales Winy Etapa 4', 1800.00, 6, 'Etapa 4', 'aseo.png', 0, '2026-01-25 19:25:49', '2026-02-23 17:40:22', NULL, NULL),
(220, 'Pañales Winy Etapa 5', 1800.00, 6, 'Etapa 5', 'aseo.png', 0, '2026-01-25 19:26:19', '2026-02-23 17:40:22', NULL, NULL),
(221, 'Jabon Coco x2', 5000.00, 6, NULL, 'aseo.png', 0, '2026-01-26 16:34:22', '2026-02-23 17:40:22', NULL, NULL),
(222, 'Fabuloso', 2500.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-01-26 16:37:57', '2026-02-23 17:40:22', NULL, NULL),
(223, 'Suavitel', 2000.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-01-26 16:38:16', '2026-02-23 17:40:22', NULL, NULL),
(224, 'Sampic', 2500.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-01-26 16:38:37', '2026-02-23 17:40:22', NULL, NULL),
(225, 'Desengrasante', 4200.00, 7, '500 ML', 'categoria-1764968345310-152897819.png', 0, '2026-01-26 16:39:07', '2026-02-23 17:40:22', NULL, NULL),
(226, 'Limpia vidrio', 4000.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-01-26 16:39:30', '2026-02-23 17:40:22', NULL, NULL),
(227, 'Lava Loza Liquido', 4000.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-01-26 16:39:56', '2026-02-23 17:40:22', NULL, NULL),
(228, 'Colgate Grande', 5000.00, 6, NULL, 'aseo.png', 0, '2026-01-26 16:40:21', '2026-02-23 17:40:22', NULL, NULL),
(229, 'Colgate Pequeño', 2800.00, 6, NULL, 'aseo.png', 0, '2026-01-26 16:40:44', '2026-02-23 17:40:22', NULL, NULL),
(230, 'Flou Carden + Cepillo', 5500.00, 6, NULL, 'aseo.png', 0, '2026-01-26 16:41:23', '2026-02-23 17:40:22', NULL, NULL),
(231, 'Flou Carden Pequeño', 2600.00, 6, NULL, 'aseo.png', 0, '2026-01-26 16:41:45', '2026-02-23 17:40:22', NULL, NULL),
(232, 'Oral B', 5000.00, 6, '50 G', 'aseo.png', 0, '2026-01-26 16:42:14', '2026-02-23 17:40:22', NULL, NULL),
(233, 'Creolina Cooper', 9000.00, 12, NULL, '/uploads/producto-1769445769553-590845035.png', 0, '2026-01-26 16:42:49', '2026-01-26 16:42:49', NULL, NULL),
(234, 'Savital Shampoo', 1300.00, 6, NULL, 'aseo.png', 0, '2026-01-26 16:44:30', '2026-02-23 17:40:22', NULL, NULL),
(235, 'Savital Enjuague', 1300.00, 6, NULL, 'aseo.png', 0, '2026-01-26 16:44:55', '2026-02-23 17:40:22', NULL, NULL),
(236, 'Savital Crema de Peinar', 1300.00, 6, NULL, 'aseo.png', 0, '2026-01-26 16:45:14', '2026-02-23 17:40:22', NULL, NULL),
(237, 'Nutribela Shampoo ', 1300.00, 6, NULL, 'aseo.png', 0, '2026-01-26 16:45:54', '2026-02-23 17:40:22', NULL, NULL),
(238, 'Nutribela Acondicionador ', 1300.00, 6, NULL, 'aseo.png', 0, '2026-01-26 16:46:38', '2026-02-23 17:40:22', NULL, NULL),
(239, 'Nutribela Crema de Peinar', 1300.00, 6, NULL, 'aseo.png', 0, '2026-01-26 16:46:57', '2026-02-23 17:40:22', NULL, NULL),
(240, 'Nutribela Tratamiento', 2000.00, 6, NULL, 'aseo.png', 0, '2026-01-26 16:47:50', '2026-02-23 17:40:22', NULL, NULL),
(241, 'Dorco Hojilla X5', 2500.00, 12, NULL, '/uploads/producto-1769534794199-413153820.png', 0, '2026-01-27 17:26:34', '2026-01-27 17:26:34', NULL, NULL),
(242, 'Minora X5', 3500.00, 12, NULL, '/uploads/producto-1769534811927-846144690.png', 0, '2026-01-27 17:26:51', '2026-01-27 17:26:51', NULL, NULL),
(243, 'Panelada', 2000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-27 17:27:08', '2026-02-23 17:40:22', NULL, NULL),
(244, 'SunTea', 1500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-27 17:27:22', '2026-02-23 17:40:22', NULL, NULL),
(245, 'Frutiño', 1000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-27 17:27:36', '2026-02-23 17:40:22', NULL, NULL),
(246, 'Boka', 1000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-01-27 17:27:49', '2026-02-23 17:40:22', NULL, NULL),
(247, 'Servilleta Familia', 3000.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-01-27 17:28:12', '2026-02-23 17:40:22', NULL, NULL),
(248, 'Bolsa de 30 KG', 500.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-01-27 17:28:35', '2026-02-23 17:40:22', NULL, NULL),
(249, 'Gel Pequeño', 1000.00, 6, NULL, 'aseo.png', 0, '2026-01-27 17:29:08', '2026-02-23 17:40:22', NULL, NULL),
(250, 'Gel Mediano', 1600.00, 6, NULL, 'aseo.png', 0, '2026-01-27 17:29:35', '2026-02-23 17:40:22', NULL, NULL),
(252, 'Dersa', 5500.00, 7, '500 G', 'categoria-1764968345310-152897819.png', 0, '2026-01-27 17:30:13', '2026-02-23 17:40:22', NULL, NULL),
(253, 'Dersa', 3500.00, 7, '250 G', 'categoria-1764968345310-152897819.png', 0, '2026-01-27 17:30:34', '2026-02-23 17:40:22', NULL, NULL),
(254, 'Dersa', 2000.00, 7, '125 G', 'categoria-1764968345310-152897819.png', 0, '2026-01-27 17:30:55', '2026-02-23 17:40:22', NULL, NULL),
(255, 'Ariel', 6500.00, 7, '450 G', 'categoria-1764968345310-152897819.png', 0, '2026-01-27 17:31:39', '2026-02-23 17:40:22', NULL, NULL),
(256, 'Ariel ', 3500.00, 7, '225 G', 'categoria-1764968345310-152897819.png', 0, '2026-01-27 17:32:06', '2026-02-23 17:40:22', NULL, NULL),
(257, 'Ariel', 2500.00, 7, '100 G', 'categoria-1764968345310-152897819.png', 0, '2026-01-27 17:32:22', '2026-02-23 17:40:22', NULL, NULL),
(258, 'Fab Original', 6500.00, 7, '450 G', 'categoria-1764968345310-152897819.png', 0, '2026-01-27 17:32:55', '2026-02-23 17:40:22', NULL, NULL),
(259, 'Fab Original', 3500.00, 7, '225 G', 'categoria-1764968345310-152897819.png', 0, '2026-01-27 17:33:17', '2026-02-23 17:40:22', NULL, NULL),
(260, 'Fab Original', 2500.00, 7, '100 G', 'categoria-1764968345310-152897819.png', 0, '2026-01-27 17:33:34', '2026-02-23 17:40:22', NULL, NULL),
(261, 'Bow Detergente', 6500.00, 7, '1000 G', 'categoria-1764968345310-152897819.png', 0, '2026-01-27 17:34:43', '2026-02-23 17:40:22', NULL, NULL),
(262, 'Bow Detergente', 4000.00, 7, '500 G', 'categoria-1764968345310-152897819.png', 0, '2026-01-27 17:35:02', '2026-02-23 17:40:22', NULL, NULL),
(263, 'Baterias Varta AAA', 3800.00, 12, NULL, '/uploads/producto-1769535330826-406564075.png', 0, '2026-01-27 17:35:30', '2026-01-27 17:35:30', NULL, NULL),
(264, 'Bterias Varta AA', 3800.00, 12, NULL, '/uploads/producto-1769535354028-506847123.png', 0, '2026-01-27 17:35:54', '2026-01-27 17:35:54', NULL, NULL),
(265, 'Cepillo Dental Floucarden', 3000.00, 6, NULL, 'aseo.png', 0, '2026-01-27 17:36:31', '2026-02-23 17:40:22', NULL, NULL),
(266, 'Cepillo Dental Colgate', 3500.00, 6, NULL, 'aseo.png', 0, '2026-01-27 17:36:49', '2026-02-23 17:40:22', NULL, NULL),
(300, 'Corta uñas grande', 3000.00, 6, 'grande', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(301, 'Corta uñas grande decorado', 3000.00, 6, 'grande decorado', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(302, 'Corta uñas pequeño', 2000.00, 6, 'pequeño', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(303, 'Saca punta metálico', 500.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(304, 'Copitos (palito)', 3000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(305, 'Jabón antibacterial', 5500.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(306, 'Peinilla grande', 1000.00, 6, 'grande', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(307, 'Peinilla pequeña', 3000.00, 6, 'pequeño', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(308, 'Peine', 1000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(309, 'Cinta transparente pequeña', 1000.00, 12, 'pequeño', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(310, 'Cinta transparente grande', 15800.00, 12, 'grande', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(311, 'Cinta transparente mediano', 3500.00, 12, 'mediano', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(312, 'Plastilina 9 colores', 4000.00, 12, '9 colores', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(313, 'Calculadora (pequeña)', 8000.00, 12, 'pequeña', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(314, 'Lápiz de color x6 colores', 5000.00, 12, 'x6', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(315, 'Marcadores borrables', 2000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(316, 'Colores x6 unidades Paper Mate', 3500.00, 12, 'x6', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(317, 'Bolígrafo offi-esco retractil (c/u)', 1200.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(318, 'Sharpie', 3500.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(319, 'Lápiz de ceja (c/u)', 1500.00, 12, 'c/u', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(320, 'Pegante blanco multiuso pequeño', 1000.00, 12, 'pequeño', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(321, 'Pegante blanco multiuso grande', 3000.00, 12, 'grande', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(322, 'Resaltador fluorescente x unidad', 1000.00, 12, 'unidad', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(323, 'Resaltador fluorescente paquete', 10000.00, 12, 'paquete', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(324, 'Resaltador fluorescente (highlighters)', 2000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(325, 'Lapiceros negro', 1000.00, 12, 'negro', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(326, 'Marcadores eterno', 2000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(327, 'Huellero dactilar', 2500.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(328, 'Grapas standard', 4500.00, 12, 'standard', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(329, 'Jeringas (unidad)', 800.00, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(330, 'Vaselina (unidad)', 99999999.99, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(331, 'Cinta microporosa', 12500.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(332, 'Pinza depiladora (unidad)', 1200.00, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(333, 'Marcador permanente (c/u)', 2000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(334, 'Paño microfibra', 8900.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(335, 'Betun Platino grande', 3000.00, 6, 'grande', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(336, 'Betun Platino pequeño', 1600.00, 6, 'pequeño', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(337, 'Condones latex (unidad)', 2000.00, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(338, 'Silicona líquida pequeño', 4000.00, 12, 'pequeño', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(339, 'Silicona líquida grande', 2000.00, 12, 'grande', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(340, 'Silicona grande marfil', 5500.00, 12, 'marfil', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(341, 'Agua oxigenada 120 ml', 5000.00, 6, '120 ml', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(342, 'Agua oxigenada 10 ud', 4500.00, 6, '10 ud', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(343, 'Fullwat led 9w', 5000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 17:34:29', NULL, NULL),
(344, 'Mini fan blade led', 14000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(345, 'Juego cartas', 6000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(346, 'Bisturí', 7000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(347, 'Aceite lubricante', 2700.00, 6, NULL, '/uploads/producto-1771868699740-729919926.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:44:59', NULL, NULL),
(348, 'Cera Ego para peinar', 5800.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(349, 'Silicona capilar Lino', 2000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(350, 'Liso inteligente', 1800.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(351, 'Pegante compacto', 99999999.99, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(352, 'Tiza china', 99999999.99, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(353, 'Chinche plasticado', 2000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(354, 'Tinte para tela', 2800.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(355, 'Pegante boxer grande', 4000.00, 12, 'grande', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(356, 'Pegante boxer pequeño', 1700.00, 12, 'pequeño', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(357, 'Pegante mediano', 2000.00, 12, 'mediano', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(358, 'Talonario recibo', 3000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(359, 'Recibo caja menor', 3300.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(360, 'Talonario de Rifa', 1800.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(361, 'Notas autoadhesivas', 1800.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(362, 'Recibo grande con talón', 2900.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(363, 'Chispitas mariposa', 2500.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(364, 'Sobres blancos (c/u)', 500.00, 12, 'c/u', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(365, 'Velas Volcán (c/u)', 3000.00, 12, 'c/u', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(366, 'Vejigas Fashion paquete', 8500.00, 12, 'paquete', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(367, 'Vejigas por unidad', 900.00, 12, 'unidad', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(368, 'Vejigas Sempertex paquete', 3200.00, 12, 'paquete', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(369, 'Vejigas Balloons paquete', 3200.00, 12, 'paquete', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(370, 'Velitas Sempertex paquete', 4300.00, 12, 'paquete', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(371, 'Gancho para ropa paquete pasta', 4000.00, 12, 'paquete', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(372, 'Gancho para ropa paquete madera', 7000.00, 12, 'paquete madera', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(373, 'Cepillo para lavar', 5000.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(374, 'Canasta de aguja', 2000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(375, 'Parques', 3000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(376, 'Bombillo LED', 5000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(377, 'Aceite para bebé (unidad)', 2000.00, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(378, 'Cordones (par)', 1000.00, 12, 'par', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(379, 'Metro (cinta métrica)', 1000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(380, 'Caimanes (unidad)', 1000.00, 12, 'unidad', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(381, 'Moñas (par)', 1000.00, 12, 'par', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(382, 'Gancho', 1500.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(383, 'Precio', 2500.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(384, 'Cepillo embetunar', 2000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(385, 'Silicona barra grueso', 2000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(386, 'Vaselina Yoly', 3500.00, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(387, 'Cinta aislante', 2000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(388, 'Plastilina (negra)', 2000.00, 12, 'negro', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(389, 'Crema Pond\'s (unidad)', 2000.00, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(390, 'Desodorante Balance (unidad)', 5000.00, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(391, 'Polvo yodora', 6500.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(392, 'Seda dental', 3000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(393, 'Toallitas húmedas', 2200.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(394, 'Ganchos pinza cajita', 3000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(395, 'Vaselina Yoly (unidad)', 3500.00, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(396, 'Cosedor metálico mini', 4700.00, 12, 'mini', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(397, 'Agua oxigenada', 4500.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(398, 'Esmalte Vogue (unidad)', 5800.00, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(399, 'Esmalte Bardot (unidad)', 5000.00, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(400, 'Esmalte Pagne (unidad)', 4000.00, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(401, 'Topitos Aretes', 1500.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(402, 'Removedor cutícula Rochy', 2000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(403, 'Removedor cutícula Akua callos', 2000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(404, 'Removedor callo Dannys', 2000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(405, 'Tijeritas plegables', 2700.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(406, 'Algodón 50 gr', 2500.00, 6, '50 gr', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(407, 'Algodón 20 gr', 2000.00, 6, '20 gr', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(408, 'Pañitos húmedos Winny', 4000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(409, 'Pañitos pequeñín', 4000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(410, 'Tampones Fresh & Free', 8000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(411, 'Tampones Rose', 8000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(412, 'Gasa HEC Plus', 2000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL);
INSERT INTO `productos` (`id`, `nombre`, `precio`, `categoria_id`, `tamaño`, `imagen`, `stock`, `created_at`, `updated_at`, `precio_media`, `precio_completo`) VALUES
(413, 'Vick VapoRub (unidad)', 6800.00, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(414, 'Vapormil pomada', 5500.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(415, 'Curitas', 200.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(416, 'Aguardiente Antioqueño', 55000.00, 1, '750 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(417, 'Whisky Black White', 50000.00, 1, NULL, 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(418, 'Aguardiente Costeño', 42000.00, 1, '750 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(419, 'Vasos desechables 7 oz', 2000.00, 12, '7 oz', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(420, 'Vasos desechables 9 oz', 3000.00, 12, '9 oz', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(421, 'Vasos desechables 12 oz', 4000.00, 12, '12 oz', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(422, 'Vasos desechables 14 oz', 5000.00, 12, '14 oz', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(423, 'Vasos desechables 3x3', 3000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(424, 'Vasos 5 oz x50', 3000.00, 12, '50 und', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(425, 'Vasos 2 oz', 2800.00, 12, '2 oz', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(426, 'Vasos Ronero x50', 2000.00, 12, '50 und', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(427, 'Bolsa 2 kilos', 2800.00, 12, '2 kg', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(428, 'Bolsa 5 kilos', 4500.00, 12, '5 kg', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(429, 'Bolsa 10 kilos', 6500.00, 12, '10 kg', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(430, 'Bolsa 3 kilos', 4500.00, 12, '3 kg', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(431, 'Palillos para chuzo', 5000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(432, 'Palillos Personal', 1800.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(433, 'Vaporizante Rubic', 3800.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(434, 'Yodora', 4200.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(435, 'Hilo unidad', 300.00, 12, 'unidad', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(436, 'Uñas postizas', 1500.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(437, 'Cinta enmascarar', 600.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(438, 'Liguitas', 3500.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(439, 'Amarradores', 3900.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(440, 'Quitacallos', 3300.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(441, 'Quitacallos madera', 3000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(442, 'Escarcha', 2500.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(443, 'Gorros para planchado', 3000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(444, 'Ganchos sujeta rollos', 2500.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(445, 'Hilo grande', 0.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(446, 'Hilo pequeño', 0.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(447, 'Impermeables', 0.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(477, 'Compás', 4000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(478, 'Colores pastel', 4700.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(479, 'Lápiz ceja marca Somy', 5000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(480, 'Resaltador Offi-Esco', 3000.00, 12, 'unidad', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(481, 'Resaltador Ipent', 2000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(482, 'Marcador permanente', 3500.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(483, 'Exacto C/U', 1400.00, 12, 'unidad', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(484, 'Líqui-Paper Pointer', 3000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(485, 'Corrector líquido', 3000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(486, 'Lápiz', 1000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(487, 'Nodriza C/U', 200.00, 12, 'unidad', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(488, 'Nodriza pequeña C/U', 100.00, 12, 'unidad', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(489, 'Colores Faber Castell', 12000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(490, 'Colores doble punta', 5000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(491, 'Plastilina 9 colores pequeño', 2000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(492, 'Botones', 400.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(493, 'Perfiladores ceja C/U', 2000.00, 6, 'unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(494, 'Limpiador uñas', 6000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(495, 'Perforadora papel', 2000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(496, 'Tijeras punta roma', 1700.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(497, 'Tijeras punta roja grande', 7000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(498, 'Aguja tejer', 2000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(499, 'Cuaderno de 100 hojas', 3800.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(500, 'Cuaderno de 50 hojas', 3000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(501, 'Libreta mini nota pequeño', 2800.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(502, 'Facturas pequeñas', 800.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(503, 'Facturas grande sin copia', 1200.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(504, 'Facturas grande copia', 3500.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(505, 'Facturas grande copio', 3000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(601, 'Pony Malta 2 litros', 7500.00, 1, '2 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(602, 'Pony Malta 1 1/2', 6000.00, 1, '1.5 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(603, 'Pony Malta 1 litro', 4000.00, 1, '1 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(604, 'Pony Malta Personal', 3000.00, 1, 'Personal', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(605, 'Pony Malta Mini', 2000.00, 1, 'Mini', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(606, 'Natu Malta litro', 4000.00, 1, '1 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(607, 'Natu Malta 1 1/2', 5500.00, 1, '1.5 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(608, 'Natu Malta Personal', 3000.00, 1, 'Personal', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(609, 'Natu Malta Mini', 2000.00, 1, 'Mini', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(610, 'Gaseosa Glacial P400', 1500.00, 1, 'P400', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(611, 'Gaseosa Glacial litro', 2900.00, 1, '1 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(612, 'Gaseosa Glacial 1 1/2', 4000.00, 1, '1.5 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(613, 'Sporade 250 ml', 1500.00, 1, '250 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(614, 'Sporade 500 ml', 2500.00, 1, '500 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(615, 'Electrolit', 9500.00, 1, NULL, 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(616, 'Pedialyte', 13000.00, 1, NULL, 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(617, 'CocaCola 3 litros', 11000.00, 1, '3 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(618, 'CocaCola 2 litros retornable', 6000.00, 1, '2 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(619, 'CocaCola 2 1/2 litros plastico', 8500.00, 1, '2.5 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(620, 'CocaCola 1 1/2', 6500.00, 1, '1.5 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(621, 'CocaCola 1 litro plastico', 5000.00, 1, '1 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(622, 'CocaCola 1 litro vidrio', 4000.00, 1, '1 L vidrio', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(623, 'CocaCola Personal vidrio', 1800.00, 1, 'Personal vidrio', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(624, 'CocaCola Mini', 1500.00, 1, 'Mini', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(625, 'CocaCola P400', 3200.00, 1, 'P400', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(626, 'CocaCola 250', 2000.00, 1, '250 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(627, 'CocaCola sin azucar 1 1/2', 6000.00, 1, '1.5 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(628, 'CocaCola P400 (segunda linea)', 3000.00, 1, 'P400', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(629, 'CocaCola lata', 3000.00, 1, 'Lata', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(650, 'Jugo del Valle 1 1/2 litro', 5000.00, 1, '1.5 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(651, 'Jugo del Valle Personal', 2500.00, 1, 'Personal', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(652, 'Gaseosa Cuatro 1 1/2 litro', 5500.00, 1, '1.5 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(653, 'Kola Roman 1 1/2 litro', 5000.00, 1, '1.5 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(654, 'Ginger 1 1/2 litro', 6000.00, 1, '1.5 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(655, 'Gaseosa Kola Roman Personal', 3000.00, 1, 'Personal', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(656, 'Gaseosa Cuatro Personal', 3000.00, 1, 'Personal', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(657, 'Gaseosa Sprite Personal', 3000.00, 1, 'Personal', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(658, 'Gaseosa Cuatro Mini', 1500.00, 1, 'Mini', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(659, 'Vive 100 1 litro', 4000.00, 1, '1 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(660, 'Vive 100 Personal', 2300.00, 1, 'Personal', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(661, 'Spartan', 2300.00, 1, NULL, 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(662, 'Saviloe -- REVISAR', 3000.00, 1, NULL, 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(663, 'Amper', 3700.00, 1, NULL, 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(664, 'Redpool', 7500.00, 1, NULL, 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(665, 'Soda Hatsu', 3500.00, 1, NULL, 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(666, 'Dolex Gripa', 2000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(667, 'Dolex Forte', 2000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(668, 'Dolex Normal', 1200.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(669, 'Advil Max', 2500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(670, 'Ibuflash', 2800.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(671, 'X Raydol', 2000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(672, 'Next', 2000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(673, 'Mieltertos ', 3800.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(674, 'Ibuprofeno', 500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(675, 'Naproxeno', 700.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(676, 'Cetalecina', 900.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(677, 'Noraver Garganta', 2000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(678, 'Sobre NEXT', 2800.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(679, 'Apronax', 2000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(680, 'Sevedol', 2000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(681, 'Descongel', 2000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(682, 'Noraver Gripa', 2500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(683, 'Noxpirin', 1500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(684, 'Loratadina', 300.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(685, 'Acetaminofen', 300.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(686, 'Gastro Full', 3000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(687, 'Sal de frutas Lua', 3200.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(688, 'Colik Forte', 2500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(689, 'Losartan', 300.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(690, 'Duraflex', 2500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(691, 'Omeprazol', 600.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(692, 'Lumbal', 2000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(693, 'Aspirineta', 1200.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(694, 'Amoxicilina', 700.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(695, 'Ampicilina', 700.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(696, 'Colmidol', 250.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(697, 'Buscapina Fem', 2500.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(698, 'Metronidazol', 800.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(699, 'Vitamina C', 800.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(700, 'Alka Seltzer', 1200.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(701, 'Lomotil', 800.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(702, 'Mareol', 1000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(703, 'Aspirina', 1200.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(704, 'Diclofenaco', 600.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(705, 'Buscapina Compuesto', 2000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(706, 'Bonfiest', 4000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(707, 'Acitromicina Caja', 5800.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(708, 'Agua Cristal 600 ml Unidad', 2000.00, 1, '600 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(709, 'Agua Glacial 600 ml Unidad', 2000.00, 1, '600 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(710, 'Agua Pool 600 ml Unidad', 2000.00, 1, '600 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(711, 'Agua Cielo 600 ml Unidad', 2000.00, 1, '600 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(712, 'Agua Cielo Litro', 2500.00, 1, '1 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(713, 'Agua Cristal Litro', 2500.00, 1, '1 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(714, 'Agua Brisa Litro', 2500.00, 1, '1 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(715, 'Agua Pool Litro', 2500.00, 1, '1 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(716, 'Agua Botella 5 litros Cristal', 8000.00, 1, '5 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(717, 'Agua Brisa 6 litros', 10000.00, 1, '6 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(718, 'Agua Cristal 300 ml', 800.00, 1, '300 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(719, 'Agua Cielo 300 ml', 800.00, 1, '300 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(720, 'Agua Pool 300 ml', 800.00, 1, '300 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(721, 'Agua Glacial 300 ml', 800.00, 1, '300 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(722, 'Agua con gas 300 ml Cristal', 1000.00, 1, '300 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(723, 'Agua con gas 600 ml Cristal', 2000.00, 1, '600 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(730, 'Agua Manzana 1/2 litro', 5000.00, 1, '500 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(731, 'Agua Manzana 600 ml', 3000.00, 1, '600 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(732, 'Agua Manzana 300 ml', 2000.00, 1, '300 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(733, 'Bretaña 1/2 litro Postobon', 5000.00, 1, '500 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(734, 'Bretaña 400 ml Postobon', 3000.00, 1, '400 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(736, 'Jugo Hit 1/2 litro Postobon', 6500.00, 1, '500 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(737, 'Jugo Hit 1 litro', 5000.00, 1, '1 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(738, 'Jugo Hit Personal 500 ml', 3000.00, 1, '500 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(739, 'Jugo Hit 250 ml', 2000.00, 1, '250 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(740, 'Jugo Hit 200 ml', 1500.00, 1, '200 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(741, 'Gatorade 500 ml', 4000.00, 1, '500 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(742, 'Agua H2O Limonata 500 ml', 3000.00, 1, '500 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(743, 'Agua H2O Limonata 300 ml', 1500.00, 1, '300 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(744, 'Speed Max Litro', 4500.00, 1, '1 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(745, 'Speed Max Personal', 2300.00, 1, 'Personal', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(746, 'Gaseosa P400 Postobon', 3000.00, 1, '400 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(748, 'Gaseosa Litro y Medio Postobon', 5500.00, 1, '1.5 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(749, 'Gaseosa 2 Litros y Medio Postobon', 6500.00, 1, '2.5 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(750, 'Gaseosa 3 Litros Postobon', 9000.00, 1, '3 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(751, 'Gaseosa 250 Personal', 1200.00, 1, '250 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(752, 'Gaseosa 237 Mini', 1000.00, 1, '237 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(753, 'Big Cola 1 Litro', 2800.00, 1, '1 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(754, 'Big Cola Personal', 1500.00, 1, 'Personal', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(755, 'Big Cola 250', 1200.00, 1, '250 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(756, 'Big Cola litro y medio', 4500.00, 1, '500 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(757, 'Big Cola 2 Litros', 6000.00, 1, '2 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(758, 'Jugo Pulp 400 ml', 2500.00, 1, '400 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(759, 'Jugo Pulp 1 Litro', 5500.00, 1, '1 L', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(760, 'Jugo Pulp 1/2', 6500.00, 1, '500 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(761, 'Jugo California 1/2', 6500.00, 1, '500 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(762, 'Jugo California Personal', 3000.00, 1, 'Personal', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(763, 'Jugo Fresky 200 ml', 1500.00, 1, '200 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(764, 'Avena Alpina California 200 ml', 2500.00, 1, '200 ml', 'categoria-1764965703204-317667025.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(765, 'Brochas Grande', 7000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(766, 'Brocha Pequeña', 5000.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(767, 'Palillos Paleta', 0.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(768, 'Platos 23 cm', 0.00, 12, '23 cm', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(769, 'Vasos 9 onzas', 4000.00, 12, '9 oz', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(770, 'Vasos 3.3 onzas -- REVISAR', 3000.00, 12, '3.3 oz', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(771, 'Vasos 5 onzas', 3000.00, 12, '5 oz', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(772, 'Platos 20 cm', 0.00, 12, '20 cm', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(773, 'Platos 18 cm', 0.00, 12, '18 cm', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(774, 'Pitillos de papel', 0.00, 12, NULL, NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(775, 'Papel Aluminio 7 mts', 0.00, 12, '7 mts', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(776, 'Ultra Pega Unidad', 2000.00, 6, 'Unidad', 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(777, 'Impermeable con Capucha', 8500.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(778, 'Liguitas para Cabello', 600.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(779, 'Separadores de Dedos', 2500.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(780, 'Piedra Pomez', 3900.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(781, 'Piedra Pomez Negra', 2000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(782, 'Pulidora Uña', 2700.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(783, 'Palita para Callos', 3300.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(784, 'Cepillo para Uñas Grande', 3000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(785, 'Cepillo para Uñas x2', 3000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(786, 'Cepillo para Uña Pequeño', 3000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(787, 'Pinza para Ceja Decorada C/U', 2000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(788, 'Piedra Pomez Sintetica', 1200.00, 6, NULL, 'aseo.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(789, 'Gaviscon', 3000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(790, 'Noraver Gripa Sobre', 3000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(791, 'Gastrum Plus', 3000.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(792, 'Dolofem 500 mg', 1000.00, 5, '500 mg', 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(793, 'Noxpirin Sobre', 3200.00, 5, NULL, 'categoria-1765997737953-993416173.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', NULL, NULL),
(798, 'Chesterfield', 700.00, 8, NULL, 'categoria-1764968147112-837969558.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', 7000.00, 14000.00),
(799, 'Marlboro', 700.00, 8, NULL, 'categoria-1764968147112-837969558.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', 8000.00, 14000.00),
(800, 'Marine', 400.00, 8, NULL, 'categoria-1764968147112-837969558.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', 4000.00, 6000.00),
(801, 'Ibiza', 400.00, 8, NULL, 'categoria-1764968147112-837969558.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', 4000.00, 6000.00),
(802, 'Rumba', 200.00, 8, NULL, 'categoria-1764968147112-837969558.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', 4000.00, 8000.00),
(803, 'Marlboro', 800.00, 8, NULL, 'categoria-1764968147112-837969558.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', 8000.00, 16000.00),
(805, 'Ultra Buy', 200.00, 8, NULL, 'categoria-1764968147112-837969558.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', 4000.00, 8000.00),
(806, 'Lucky Strike', 1000.00, 8, NULL, 'categoria-1764968147112-837969558.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', 8000.00, 16000.00),
(807, 'Marlboro Blanco', 1000.00, 8, NULL, 'categoria-1764968147112-837969558.png', 0, '2026-02-23 15:53:04', '2026-02-23 17:40:22', 8000.00, 16000.00),
(808, 'Vaso 7 Onzas', 2000.00, 12, '7 oz', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(809, 'Vaso 12 Onzas', 4000.00, 12, '12 oz', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(810, 'Vaso 25 Onzas', 2800.00, 12, '25 oz', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(811, 'Vaso Blanco 50 Unidades', 5000.00, 12, '50 und', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(812, 'Vaso 14 Onzas', 5000.00, 12, '14 oz', NULL, 0, '2026-02-23 15:53:04', '2026-02-23 15:53:04', NULL, NULL),
(813, 'Manimoto Limón', 2500.00, 4, '42 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(814, 'Mezcla Mani', 2500.00, 4, '40 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(815, 'Manimoto', 2800.00, 4, '80 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(816, 'Manimoto', 1800.00, 4, '44 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(817, 'Mani Salado', 1500.00, 4, '36 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(818, 'Mani Salado', 1000.00, 4, '23 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(819, 'Zucarita', 2000.00, 4, '30 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(820, 'Zucarita Chococrispi', 2000.00, 4, '30 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(821, 'Popetas', 2000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(822, 'Snacky', 2000.00, 4, '40 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(823, 'Mini Chip', 2000.00, 4, '35 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(824, 'Maizito', 2000.00, 4, '45 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(826, 'Tostacos', 2000.00, 4, '38 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(827, 'Chicharrones Americano', 2500.00, 4, '15 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(828, 'Chompitas Dulces Ramo', 3000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(829, 'Papa Doña Pacho', 2500.00, 4, '30 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(830, 'Chachos Americano', 6000.00, 4, '50 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(831, 'Platano Verde Ramo', 2000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(832, 'Takis', 4000.00, 4, '50 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(833, 'Pic Mix', 2500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(834, 'Ponque Chocoramo', 2800.00, 4, '65 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(835, 'Ponque Gala', 2300.00, 4, '60 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(836, 'Chocoramo Brownie', 3800.00, 4, '60 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(837, 'Biscocho Coheto', 2000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(838, 'Gancito', 2000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(839, 'Pudines Pingüinos x3', 4000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(840, 'Chocoramo Barrita', 2500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(841, 'Ramito x2', 2400.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(842, 'Galletanes', 1700.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(843, 'Porciones Pudín', 1000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(844, 'Pan de Queso Servipan', 500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(845, 'Pan de Queso Servipan', 1000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(846, 'Pan de Queso Servipan', 1500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(847, 'Natuchip', 7800.00, 4, '135 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(848, 'Chokis Chispa', 2000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(849, 'Natuchip Platano', 2500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(850, 'Cheetos', 2000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(851, 'Doritos Mega Queso', 3000.00, 4, '43 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(852, 'Doritos', 8000.00, 4, '185 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(853, 'Papas Margarita', 2500.00, 4, '70 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(854, 'Cheeto Boliqueso', 7800.00, 4, '160 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(855, 'Cheeto Boliqueso', 1200.00, 4, '20 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(856, 'Cheeto Boliqueso', 2000.00, 4, '34 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(857, 'De Todito', 18000.00, 4, '400 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(858, 'De Todito', 8000.00, 4, '165 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(859, 'De Todito', 4000.00, 4, '80 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(860, 'De Todito', 3000.00, 4, '50 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(861, 'Chestris', 2000.00, 4, '42 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(862, 'Chestris', 1200.00, 4, '30 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(863, 'Chestris', 4000.00, 4, '120 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(864, 'Choclitos', 4500.00, 4, '125 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(865, 'Choclitos', 2000.00, 4, '45 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(866, 'Choclitos', 1200.00, 4, '27 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(867, 'Gudiz', 2000.00, 4, '28 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(869, 'Papa Margarita', 7800.00, 4, '105 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(870, 'Gomas Trolli', 2000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(871, 'Salsa Pompeya', 12000.00, 5, '1000 g', 'categoria-1765997737953-993416173.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(872, 'Mostaza Pompeya', 12000.00, 5, '1000 g', 'categoria-1765997737953-993416173.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(873, 'Mogollas', 1000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(874, 'Pan Mantequilla', 1000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(875, 'Pan Largo', 1000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(876, 'Roscones Bocadillo', 1000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(877, 'Pan Integral', 1000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(878, 'Tostadas Ajo', 1000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(879, 'Tostadas Bimbo', 6800.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(880, 'Tostadas Servipan', 2000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(881, 'Tostadas Ajo Sapatoca', 1000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(882, 'Bolsa Pan de Sal', 12000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(883, 'Bolsa Rosquitas', 5000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(884, 'Bandeja Pan x12', 3600.00, 4, '12 und', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(885, 'Mogollas Pequeñas', 500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(886, 'Pan de Queso', 500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(887, 'Pan Mantequilla', 500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(888, 'Pan Largo Leche', 3000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(889, 'Pan Largo', 2000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(890, 'Galleta Queso', 500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(891, 'Galleta Rellena Bocadillo', 500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(892, 'Donas', 500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(893, 'Pan Tajado', 2000.00, 4, '200 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(894, 'Pan Tajado', 4000.00, 4, '400 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(895, 'Servipan', 4500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(896, 'Galletas Punto Rojo', 200.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(897, 'Rosquitas Unidad', 200.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(898, 'Gelatina de Pata', 500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(899, 'Merengue', 500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(900, 'Galleta Punto Rojo', 500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(901, 'Chocoramo Esquina', 3200.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(902, 'Pudin Ramo', 6800.00, 4, '230 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(903, 'Pudin Ramo Selecto', 8500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(904, 'Pudin Ramo Vino', 8500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(905, 'Ponque Bimbo', 2400.00, 4, '60 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(906, 'Ponque Casero Bimbo', 6800.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(907, 'Ponque Tres Leches', 8500.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(908, 'Bimboletes x2', 2400.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(909, 'Rosquitas Pa Mi Gente', 2000.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(910, 'Mr Brown Bimbo', 3800.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(911, 'Chocoso', 2800.00, 4, NULL, 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(912, 'Tortillas x8 Bimbo', 8700.00, 4, '140 g', 'meka.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(913, 'Club Colombia', 5000.00, 10, '330 ml', 'categoria-1764968686629-456538264.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(914, 'Poker', 3500.00, 10, '330 ml', 'categoria-1764968686629-456538264.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(915, 'Aguila', 3500.00, 10, '330 ml', 'categoria-1764968686629-456538264.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(916, 'Aguila Botella Personal', 3000.00, 10, NULL, 'categoria-1764968686629-456538264.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(917, 'Aguila Litro', 6500.00, 10, NULL, 'categoria-1764968686629-456538264.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(918, 'Costeña', 3000.00, 6, '330 ml', 'aseo.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(919, 'Aguila Light', 3000.00, 10, '269 ml', 'categoria-1764968686629-456538264.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(920, 'Budweiser', 3500.00, 10, NULL, 'categoria-1764968686629-456538264.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(921, 'Corona Lata', 3500.00, 10, '269 ml', 'categoria-1764968686629-456538264.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(922, 'Coronita', 3500.00, 10, NULL, 'categoria-1764968686629-456538264.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(923, 'Heineken', 3500.00, 6, NULL, 'aseo.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(924, 'Refajo Kola y Pola', 3000.00, 6, NULL, 'aseo.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(925, 'Cerveza Miller Botella', 3000.00, 10, NULL, 'categoria-1764968686629-456538264.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(926, 'Cerveza Like', 3700.00, 10, NULL, 'categoria-1764968686629-456538264.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(927, 'Dove Tratamiento', 2000.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(928, 'Dove Shampoo', 1300.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(929, 'Dove Acondicionador', 1300.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(930, 'Pantene Shampoo', 1300.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(931, 'Pantene Acondicionador', 1300.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(932, 'Shampoo Tio Nacho', 1300.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(933, 'Axion Crema Lava Loza', 3000.00, 7, '150 g', 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(934, 'Lava Loza Supremo', 2500.00, 7, '150 g', 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(935, 'Ever House', 5000.00, 7, '500 g', 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(936, 'Jabon Liquido Azul K Extra', 5500.00, 7, '500 ml', 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(937, 'Limpiador Multiuso Bicarbonato', 2500.00, 7, '180 ml', 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(938, 'Vanish Ropa Color', 3800.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(939, 'Vanish Ropa Blanco', 3800.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(940, 'Jabon Dersa Barra', 3000.00, 7, '250 g', 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(941, 'Vanish Blanco Sobre', 2000.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(942, 'Vanish Color Sobre', 2000.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(943, 'Jabon Rey', 4000.00, 7, '300 g', 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(944, 'Top Terra', 3800.00, 7, '230 g', 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(945, 'Dersa Azul Puro', 1800.00, 7, '220 g', 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(946, 'Jabon Mio', 2500.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(947, 'Jabon Azul K Extra', 3000.00, 7, '240 g', 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(948, 'Jabon Baño Natural Feeling', 2800.00, 7, '110 g', 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(949, 'Jabon Protex', 4000.00, 7, NULL, 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(950, 'Natural Feeling', 4000.00, 7, '90 g', 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(951, 'Varsol', 3200.00, 7, '150 g', 'categoria-1764968345310-152897819.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL),
(952, 'Huevos Quike x30', 17500.00, 5, '30 und', 'categoria-1765997737953-993416173.png', 0, '2026-02-23 17:04:28', '2026-02-23 17:40:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_recibidos`
--

CREATE TABLE `productos_recibidos` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_recepcion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tamanos`
--

CREATE TABLE `tamanos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tamanos`
--

INSERT INTO `tamanos` (`id`, `nombre`, `created_at`) VALUES
(1, '1 Litro', '2025-12-04 16:43:54'),
(2, '1.5 Litros', '2025-12-04 16:43:54'),
(3, '1 Libra', '2025-12-04 16:43:54'),
(4, '1 Kilo', '2025-12-04 16:43:54'),
(5, '1 Unidad', '2025-12-04 16:43:54'),
(6, '1/2 Libra', '2025-12-04 20:27:30'),
(7, '1100 ML', '2025-12-04 20:28:51'),
(8, '900 ML', '2025-12-04 20:29:01'),
(9, '125 ML', '2025-12-04 21:41:54'),
(10, '300 ML', '2025-12-04 21:42:31'),
(11, '2 Litros', '2025-12-04 21:43:21'),
(12, '400 ML', '2025-12-04 21:44:04'),
(13, '2.25 Litros', '2025-12-04 21:44:40'),
(14, '25 G', '2025-12-10 18:19:33'),
(15, '26 G', '2025-12-10 18:20:18'),
(16, '15 Unidades', '2025-12-17 18:51:31'),
(17, '200 G', '2025-12-17 18:52:19'),
(18, '60 G', '2025-12-17 19:00:50'),
(19, '10 G', '2025-12-17 19:01:43'),
(20, '200 ML', '2025-12-17 19:03:24'),
(21, '65 G', '2025-12-19 21:38:22'),
(22, '130 G', '2025-12-20 18:27:01'),
(23, '400 G', '2025-12-20 18:28:12'),
(24, '125 G', '2025-12-20 18:33:42'),
(25, '250 G', '2025-12-20 18:36:19'),
(26, '120 G', '2025-12-20 18:38:08'),
(27, '80 G', '2025-12-20 18:41:35'),
(28, '220 G', '2025-12-20 18:43:06'),
(29, '115 G', '2025-12-20 19:01:35'),
(30, '1100 G', '2025-12-20 19:09:02'),
(31, '8 G', '2025-12-20 19:17:00'),
(32, '7 ML', '2025-12-20 19:17:27'),
(33, '20 G', '2025-12-20 19:17:55'),
(34, '40 G', '2025-12-20 19:18:33'),
(35, '90 G', '2025-12-20 19:58:58'),
(36, '500 G', '2025-12-20 20:07:23'),
(37, '1000 G', '2025-12-20 20:08:37'),
(38, '100 G', '2025-12-20 20:12:40'),
(39, '375 G', '2025-12-22 20:28:52'),
(40, '110 G', '2025-12-22 20:30:42'),
(41, '155 G', '2025-12-22 20:31:33'),
(42, '175 G', '2025-12-22 20:32:12'),
(43, '3000 G', '2025-12-22 20:36:48'),
(44, '178 G', '2025-12-22 20:37:21'),
(45, '310 G', '2025-12-22 20:37:55'),
(46, '340 G', '2025-12-22 20:39:26'),
(47, '104 G', '2026-01-22 20:06:54'),
(48, '160 G', '2026-01-22 20:07:38'),
(49, '140 G', '2026-01-22 20:08:17'),
(50, '70 G', '2026-01-22 20:12:55'),
(51, '150 G', '2026-01-22 20:13:40'),
(52, '1.5 G', '2026-01-22 21:08:11'),
(53, '18 G', '2026-01-22 21:35:07'),
(54, '3 Litros', '2026-01-22 21:35:43'),
(55, '450 ML', '2026-01-22 21:37:32'),
(56, '394 ML', '2026-01-22 21:37:58'),
(57, '191 ML', '2026-01-22 21:39:00'),
(58, '220 ML', '2026-01-22 21:39:24'),
(59, '102 G', '2026-01-22 21:40:00'),
(60, '105 G', '2026-01-22 21:40:28'),
(61, '9 G', '2026-01-22 21:41:12'),
(62, '13 G', '2026-01-24 18:53:43'),
(63, '15 G', '2026-01-24 18:55:50'),
(64, '55 G', '2026-01-24 18:57:04'),
(65, '4 G', '2026-01-24 18:58:07'),
(66, '1.6 G', '2026-01-24 18:59:18'),
(67, '1.4 G', '2026-01-24 19:00:04'),
(68, '11 G', '2026-01-24 19:07:55'),
(69, '500 ML', '2026-01-25 19:16:49'),
(70, '100 ML', '2026-01-25 19:19:06'),
(71, 'Etapa 3', '2026-01-25 19:23:26'),
(72, 'Etapa 2', '2026-01-25 19:25:25'),
(73, 'Etapa 4', '2026-01-25 19:25:49'),
(74, 'Etapa 5', '2026-01-25 19:26:19'),
(75, '50 G', '2026-01-26 16:42:14'),
(76, '450 G', '2026-01-27 17:31:39'),
(77, '225 G', '2026-01-27 17:32:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha_hora` datetime DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `pago_nequi` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Indica si el pago fue realizado por Nequi (1) o efectivo (0)',
  `imagen_nequi` varchar(255) DEFAULT NULL COMMENT 'Ruta de la imagen del comprobante de pago Nequi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_venta`
--
ALTER TABLE `detalles_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_id` (`venta_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `productos_recibidos`
--
ALTER TABLE `productos_recibidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `tamanos`
--
ALTER TABLE `tamanos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalles_venta`
--
ALTER TABLE `detalles_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=570;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=953;

--
-- AUTO_INCREMENT de la tabla `productos_recibidos`
--
ALTER TABLE `productos_recibidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `tamanos`
--
ALTER TABLE `tamanos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_venta`
--
ALTER TABLE `detalles_venta`
  ADD CONSTRAINT `detalles_venta_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalles_venta_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `productos_recibidos`
--
ALTER TABLE `productos_recibidos`
  ADD CONSTRAINT `productos_recibidos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL;
--
-- Base de datos: `tiendita`
--
CREATE DATABASE IF NOT EXISTS `tiendita` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tiendita`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendita`
--

CREATE TABLE `tiendita` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tiendita`
--

INSERT INTO `tiendita` (`id`, `nombre`, `precio`) VALUES
(1, 'pan', 18),
(3, 'pan', 17),
(4, 'pan', 11);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tiendita`
--
ALTER TABLE `tiendita`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tiendita`
--
ALTER TABLE `tiendita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Base de datos: `zylo_db`
--
CREATE DATABASE IF NOT EXISTS `zylo_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `zylo_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barberos`
--

CREATE TABLE `barberos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `foto_perfil` varchar(255) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `estado` enum('activo','inactivo','ocupado') DEFAULT 'activo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `barberos`
--

INSERT INTO `barberos` (`id`, `usuario_id`, `descripcion`, `foto_perfil`, `ubicacion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 2, 'super barbero al mejor precio', NULL, 'santa marta', 'activo', '2025-10-10 04:36:49', '2025-10-10 04:36:49'),
(2, 4, 'fwef', NULL, 'santana', 'activo', '2025-11-13 21:58:48', '2025-11-13 21:58:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galerias`
--

CREATE TABLE `galerias` (
  `id` int(11) NOT NULL,
  `barbero_id` int(11) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `barbero_id` int(11) NOT NULL,
  `dia_semana` enum('lunes','martes','miércoles','jueves','viernes','sábado','domingo') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `barbero_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado` enum('pendiente','confirmada','completada','cancelada') DEFAULT 'pendiente',
  `comentario` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `cliente_id`, `barbero_id`, `servicio_id`, `fecha`, `hora`, `estado`, `comentario`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, '2025-11-26', '10:00:00', 'cancelada', '', '2025-11-14 18:14:04', '2025-11-14 18:18:52'),
(2, 3, 2, 3, '2025-11-26', '16:30:00', 'confirmada', '', '2025-11-14 18:18:10', '2025-11-14 18:18:35'),
(3, 3, 2, 2, '2025-11-26', '17:00:00', 'confirmada', '', '2025-11-14 18:20:26', '2025-11-14 18:20:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `created_at`) VALUES
(1, 'administrador', '2025-10-10 04:35:46'),
(2, 'barbero', '2025-10-10 04:35:46'),
(3, 'cliente', '2025-10-10 04:35:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `barbero_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `duracion_minutos` int(11) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `barbero_id`, `nombre`, `descripcion`, `precio`, `duracion_minutos`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, 'el 7', 'ufyuig', 10000.00, 5, 1, '2025-11-14 18:12:06', '2025-11-14 18:12:06'),
(2, 2, 'el 8', 'kghjbn', 0.00, 0, 1, '2025-11-14 18:15:29', '2025-11-14 18:15:29'),
(3, 2, 'el 8', 'kghjbn', 10000.00, 5, 1, '2025-11-14 18:16:03', '2025-11-14 18:16:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `rol_id` int(11) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `telefono`, `rol_id`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'admin@zylo.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3001234567', 1, 1, '2025-10-10 04:35:46', '2025-10-10 04:35:46'),
(2, 'el barbero', 'barbero@zylo.com', '$2y$10$e8DcU.SBo.aGbnCRaVt15O1PLTEadpioLWGlqT5dEXDegMtM1Xoj6', '9999999999', 2, 1, '2025-10-10 04:36:49', '2025-10-10 04:36:49'),
(3, 'qcs', 'q@q.com', '$2y$10$M79oz/Xq4OxT5KfTDyP3Burj4MCWtLP8qwNyam8v8Bi7Vb/y8GdbK', '292', 3, 1, '2025-11-13 21:58:15', '2025-11-13 21:58:15'),
(4, 'barber', 'b@b.com', '$2y$10$Vdxwv8tSRXKVBcWdobpcwOIC9Ll6qMgtEeDR6IFjvPerj/RFKtSA6', '123456', 2, 1, '2025-11-13 21:58:48', '2025-11-13 21:58:48');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barberos`
--
ALTER TABLE `barberos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`),
  ADD KEY `idx_barberos_usuario` (`usuario_id`);

--
-- Indices de la tabla `galerias`
--
ALTER TABLE `galerias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_galerias_barbero` (`barbero_id`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_barbero_dia` (`barbero_id`,`dia_semana`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicio_id` (`servicio_id`),
  ADD KEY `idx_reservas_cliente` (`cliente_id`),
  ADD KEY `idx_reservas_barbero` (`barbero_id`),
  ADD KEY `idx_reservas_fecha` (`fecha`,`hora`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_servicios_barbero` (`barbero_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_usuarios_email` (`email`),
  ADD KEY `idx_usuarios_rol` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barberos`
--
ALTER TABLE `barberos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `galerias`
--
ALTER TABLE `galerias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `barberos`
--
ALTER TABLE `barberos`
  ADD CONSTRAINT `barberos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `galerias`
--
ALTER TABLE `galerias`
  ADD CONSTRAINT `galerias_ibfk_1` FOREIGN KEY (`barbero_id`) REFERENCES `barberos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`barbero_id`) REFERENCES `barberos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`barbero_id`) REFERENCES `barberos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`barbero_id`) REFERENCES `barberos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
