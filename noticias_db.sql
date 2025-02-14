-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-02-2025 a las 17:54:27
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
-- Base de datos: `noticias_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `contenido` text NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_usuario` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `visitas` int(11) DEFAULT 0,
  `destacado` tinyint(1) DEFAULT 0,
  `me_gusta` int(11) DEFAULT 0,
  `reproducciones` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `titulo`, `contenido`, `imagen`, `video`, `fecha_publicacion`, `id_usuario`, `id_categoria`, `visitas`, `destacado`, `me_gusta`, `reproducciones`) VALUES
(1, 'Noticia 1', 'Descripción de la noticia 1.', 'img2.jfif', NULL, '2025-02-13 02:31:37', NULL, NULL, 0, 1, 39, 12),
(2, 'Noticia 2', 'Descripción de la noticia 2.', 'img1.jfif', NULL, '2025-02-13 02:31:37', NULL, NULL, 0, 1, 22, 7),
(3, 'Noticia 3', 'Descripción de la noticia 3.', 'img2.jfif', NULL, '2025-02-13 02:31:37', NULL, NULL, 0, 1, 15, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `contenido` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_usuario` int(11) DEFAULT NULL,
  `id_articulo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reacciones`
--

CREATE TABLE `reacciones` (
  `id` int(11) NOT NULL,
  `tipo` enum('me_gusta','reproduccion') NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_articulo` int(11) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `reacciones`
--

INSERT INTO `reacciones` (`id`, `tipo`, `id_usuario`, `id_articulo`, `fecha`) VALUES
(1, 'me_gusta', NULL, 2, '2025-02-13 02:41:36'),
(2, 'reproduccion', NULL, 2, '2025-02-13 02:41:39'),
(3, 'me_gusta', NULL, 2, '2025-02-13 02:41:43'),
(4, 'me_gusta', NULL, 2, '2025-02-13 02:41:44'),
(5, 'reproduccion', NULL, 2, '2025-02-13 02:41:46'),
(6, 'me_gusta', NULL, 3, '2025-02-13 02:41:48'),
(7, 'reproduccion', NULL, 3, '2025-02-13 02:41:49'),
(8, 'me_gusta', NULL, 1, '2025-02-13 02:41:53'),
(9, 'reproduccion', NULL, 1, '2025-02-13 02:41:54'),
(10, 'me_gusta', NULL, 1, '2025-02-13 02:41:55'),
(11, 'reproduccion', NULL, 1, '2025-02-13 02:41:58'),
(12, 'me_gusta', NULL, 1, '2025-02-13 02:49:04'),
(13, 'reproduccion', NULL, 1, '2025-02-13 02:49:05'),
(14, 'reproduccion', NULL, 2, '2025-02-13 02:49:10'),
(15, 'me_gusta', NULL, 2, '2025-02-13 02:49:11'),
(16, 'me_gusta', NULL, 1, '2025-02-13 02:49:44'),
(17, 'reproduccion', NULL, 1, '2025-02-13 02:49:52'),
(18, 'me_gusta', NULL, 2, '2025-02-13 02:50:53'),
(19, 'reproduccion', NULL, 2, '2025-02-13 02:50:54'),
(20, 'me_gusta', NULL, 3, '2025-02-13 02:50:58'),
(21, 'reproduccion', NULL, 3, '2025-02-13 02:50:59'),
(22, 'me_gusta', NULL, 1, '2025-02-13 02:51:03'),
(23, 'reproduccion', NULL, 1, '2025-02-13 02:51:04'),
(24, 'me_gusta', NULL, 1, '2025-02-13 02:57:56'),
(25, 'reproduccion', NULL, 1, '2025-02-13 02:57:58'),
(26, 'me_gusta', NULL, 2, '2025-02-13 02:58:00'),
(27, 'reproduccion', NULL, 2, '2025-02-13 02:58:01'),
(28, 'me_gusta', NULL, 2, '2025-02-13 02:58:05'),
(29, 'me_gusta', NULL, 3, '2025-02-13 02:58:57'),
(30, 'me_gusta', NULL, 1, '2025-02-14 14:17:58'),
(31, 'me_gusta', NULL, 2, '2025-02-14 14:18:03'),
(32, 'reproduccion', NULL, 2, '2025-02-14 14:18:05'),
(33, 'me_gusta', NULL, 2, '2025-02-14 14:28:04'),
(34, 'me_gusta', NULL, 2, '2025-02-14 14:28:06'),
(35, 'me_gusta', NULL, 2, '2025-02-14 14:28:09'),
(36, 'me_gusta', NULL, 2, '2025-02-14 14:28:11'),
(37, 'reproduccion', NULL, 2, '2025-02-14 14:28:12'),
(38, 'reproduccion', NULL, 2, '2025-02-14 14:28:16'),
(39, 'reproduccion', NULL, 3, '2025-02-14 14:28:19'),
(40, 'me_gusta', NULL, 3, '2025-02-14 14:28:42'),
(41, 'me_gusta', NULL, 3, '2025-02-14 14:28:43'),
(42, 'me_gusta', NULL, 3, '2025-02-14 14:28:44'),
(43, 'me_gusta', NULL, 1, '2025-02-14 14:28:54'),
(44, 'reproduccion', NULL, 1, '2025-02-14 14:28:57'),
(45, 'me_gusta', NULL, 2, '2025-02-14 14:33:36'),
(46, 'me_gusta', NULL, 2, '2025-02-14 14:33:36'),
(47, 'reproduccion', NULL, 2, '2025-02-14 14:33:38'),
(48, 'me_gusta', NULL, 1, '2025-02-14 14:33:50'),
(49, 'me_gusta', NULL, 1, '2025-02-14 14:33:50'),
(50, 'me_gusta', NULL, 1, '2025-02-14 14:33:55'),
(51, 'me_gusta', NULL, 1, '2025-02-14 14:33:55'),
(52, 'reproduccion', NULL, 1, '2025-02-14 14:33:59'),
(53, 'me_gusta', NULL, 1, '2025-02-14 14:45:41'),
(54, 'me_gusta', NULL, 1, '2025-02-14 14:45:41'),
(55, 'me_gusta', NULL, 1, '2025-02-14 14:45:44'),
(56, 'me_gusta', NULL, 1, '2025-02-14 14:45:44'),
(57, 'reproduccion', NULL, 1, '2025-02-14 14:45:46'),
(58, 'reproduccion', NULL, 1, '2025-02-14 14:53:35'),
(59, 'reproduccion', NULL, 1, '2025-02-14 14:58:34'),
(60, 'me_gusta', NULL, 1, '2025-02-14 14:58:36'),
(61, 'me_gusta', NULL, 1, '2025-02-14 14:58:36'),
(62, 'me_gusta', NULL, 1, '2025-02-14 14:58:38'),
(63, 'me_gusta', NULL, 1, '2025-02-14 14:58:38'),
(64, 'reproduccion', NULL, 2, '2025-02-14 15:00:00'),
(65, 'reproduccion', NULL, 1, '2025-02-14 15:00:04'),
(66, 'reproduccion', NULL, 1, '2025-02-14 15:03:13'),
(67, 'reproduccion', NULL, 2, '2025-02-14 15:03:24'),
(68, 'reproduccion', NULL, 2, '2025-02-14 15:03:26'),
(69, 'reproduccion', NULL, 2, '2025-02-14 15:03:27'),
(70, 'reproduccion', NULL, 2, '2025-02-14 15:03:30'),
(71, 'reproduccion', NULL, 1, '2025-02-14 15:04:25'),
(72, 'me_gusta', NULL, 1, '2025-02-14 15:05:43'),
(73, 'me_gusta', NULL, 1, '2025-02-14 15:05:43'),
(74, 'me_gusta', NULL, 2, '2025-02-14 15:06:08'),
(75, 'me_gusta', NULL, 2, '2025-02-14 15:06:08'),
(76, 'reproduccion', NULL, 2, '2025-02-14 15:06:10'),
(77, 'me_gusta', NULL, 1, '2025-02-14 15:07:29'),
(78, 'me_gusta', NULL, 1, '2025-02-14 15:07:29'),
(79, 'reproduccion', NULL, 1, '2025-02-14 15:07:35'),
(80, 'reproduccion', NULL, 1, '2025-02-14 15:27:32'),
(81, 'reproduccion', NULL, 1, '2025-02-14 15:27:34'),
(82, 'reproduccion', NULL, 1, '2025-02-14 15:27:48'),
(83, 'reproduccion', NULL, 1, '2025-02-14 15:27:50'),
(84, 'reproduccion', NULL, 1, '2025-02-14 15:27:51'),
(85, 'reproduccion', NULL, 2, '2025-02-14 15:33:59'),
(86, 'me_gusta', NULL, 2, '2025-02-14 15:34:01'),
(87, 'me_gusta', NULL, 2, '2025-02-14 15:34:01'),
(88, 'me_gusta', NULL, 2, '2025-02-14 15:34:02'),
(89, 'me_gusta', NULL, 2, '2025-02-14 15:34:02'),
(90, 'me_gusta', NULL, 2, '2025-02-14 15:34:03'),
(91, 'me_gusta', NULL, 2, '2025-02-14 15:34:03'),
(92, 'reproduccion', NULL, 1, '2025-02-14 15:51:42'),
(93, 'me_gusta', NULL, 1, '2025-02-14 15:51:44'),
(94, 'me_gusta', NULL, 1, '2025-02-14 15:51:44'),
(95, 'me_gusta', NULL, 1, '2025-02-14 15:51:44'),
(96, 'me_gusta', NULL, 1, '2025-02-14 15:51:44'),
(97, 'me_gusta', NULL, 3, '2025-02-14 15:52:05'),
(98, 'me_gusta', NULL, 3, '2025-02-14 15:52:05'),
(99, 'reproduccion', NULL, 1, '2025-02-14 15:54:38'),
(100, 'me_gusta', NULL, 1, '2025-02-14 15:54:39'),
(101, 'me_gusta', NULL, 1, '2025-02-14 15:54:39'),
(102, 'me_gusta', NULL, 1, '2025-02-14 15:54:40'),
(103, 'me_gusta', NULL, 1, '2025-02-14 15:54:40'),
(104, 'reproduccion', NULL, 2, '2025-02-14 15:55:03'),
(105, 'reproduccion', NULL, 1, '2025-02-14 16:16:41'),
(106, 'me_gusta', NULL, 1, '2025-02-14 16:16:49'),
(107, 'me_gusta', NULL, 1, '2025-02-14 16:16:49'),
(108, 'me_gusta', NULL, 1, '2025-02-14 16:16:50'),
(109, 'me_gusta', NULL, 1, '2025-02-14 16:16:50'),
(110, 'reproduccion', NULL, 1, '2025-02-14 16:49:59'),
(111, 'me_gusta', NULL, 1, '2025-02-14 16:50:02'),
(112, 'me_gusta', NULL, 1, '2025-02-14 16:50:02'),
(113, 'me_gusta', NULL, 1, '2025-02-14 16:50:05'),
(114, 'me_gusta', NULL, 1, '2025-02-14 16:50:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `enlace` varchar(255) NOT NULL,
  `posicion` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` enum('admin','autor') DEFAULT 'autor',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_articulo` (`id_articulo`);

--
-- Indices de la tabla `reacciones`
--
ALTER TABLE `reacciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_articulo` (`id_articulo`);

--
-- Indices de la tabla `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reacciones`
--
ALTER TABLE `reacciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT de la tabla `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reacciones`
--
ALTER TABLE `reacciones`
  ADD CONSTRAINT `reacciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reacciones_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
