-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Temps de generació: 17-11-2016 a les 08:21:44
-- Versió del servidor: 5.7.16-0ubuntu0.16.04.1
-- Versió de PHP: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `trabajos`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `archivos`
--

CREATE TABLE `archivos` (
  `id` mediumint(9) NOT NULL,
  `nombre` char(150) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `url` char(200) DEFAULT NULL,
  `fecha_creacion_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion_in` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `documentos`
--

CREATE TABLE `documentos` (
  `idMovimiento` int(11) NOT NULL COMMENT 'id de tarea',
  `url` varchar(100) NOT NULL COMMENT 'url de documento'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Relación de documentos con tarea';

-- --------------------------------------------------------

--
-- Estructura de la taula `estados`
--

CREATE TABLE `estados` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `etiquetas`
--

CREATE TABLE `etiquetas` (
  `id` mediumint(9) NOT NULL,
  `nombre` char(20) DEFAULT NULL,
  `descripcion` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `facturas`
--

CREATE TABLE `facturas` (
  `id` int(11) NOT NULL,
  `numfact` int(11) NOT NULL COMMENT 'Número de factura del proyecto',
  `comentario` varchar(50) DEFAULT NULL,
  `fechaFactura` date NOT NULL,
  `fechaPagado` date DEFAULT NULL,
  `Total` float DEFAULT '0',
  `idProyecto` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `grupos_tareas`
--

CREATE TABLE `grupos_tareas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `idProyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `movimientos`
--

CREATE TABLE `movimientos` (
  `id` int(10) UNSIGNED NOT NULL,
  `idTarea` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `fechaInicio` timestamp NULL DEFAULT NULL,
  `fechaFinal` timestamp NULL DEFAULT NULL,
  `descripcion` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `personal`
--

CREATE TABLE `personal` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `enviarTareas` tinyint(1) DEFAULT NULL COMMENT 'Nos dice si enviamos email o no al terminar tarea'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `descripcion` text,
  `svn` varchar(50) NOT NULL DEFAULT 'NO',
  `ftp` varchar(30) DEFAULT NULL,
  `dirFtp` varchar(30) DEFAULT NULL,
  `dirLocal` varchar(130) DEFAULT NULL,
  `activado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Saber si el proyecto esta en activo',
  `facturacion` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Saber si el proyecto requiere facturación'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `rFacturasPagos`
--

CREATE TABLE `rFacturasPagos` (
  `id` tinyint(4) NOT NULL,
  `idFactura` tinyint(4) NOT NULL,
  `pagado` float(9,2) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Movimiento de pagos en facturas';

-- --------------------------------------------------------

--
-- Estructura de la taula `rMovimientoArchivos`
--

CREATE TABLE `rMovimientoArchivos` (
  `id` int(11) NOT NULL,
  `idMovimiento` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `rMovimientoTablas`
--

CREATE TABLE `rMovimientoTablas` (
  `idMovimiento` int(11) NOT NULL DEFAULT '0',
  `tabla` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='rel: movimientos.id Tablas afectadas por el movimiento';

-- --------------------------------------------------------

--
-- Estructura de la taula `r_etiqueta_archivo`
--

CREATE TABLE `r_etiqueta_archivo` (
  `etiquetas_id` mediumint(9) NOT NULL,
  `archivos_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `r_grupos_tareas`
--

CREATE TABLE `r_grupos_tareas` (
  `grupo_id` int(11) NOT NULL,
  `tarea_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relación entre tareas y grupos';

-- --------------------------------------------------------

--
-- Estructura de la taula `r_personal_proyecto`
--

CREATE TABLE `r_personal_proyecto` (
  `personal_id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='rel:personal id,proyectos id';

-- --------------------------------------------------------

--
-- Estructura de la taula `r_usuarios_roles`
--

CREATE TABLE `r_usuarios_roles` (
  `usuarios_id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='rel: usuarios roles';

-- --------------------------------------------------------

--
-- Estructura de la taula `tareas`
--

CREATE TABLE `tareas` (
  `id` int(10) UNSIGNED NOT NULL,
  `prioridad` tinyint(2) DEFAULT '0',
  `idProyecto` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `presupuesto` decimal(9,2) DEFAULT NULL,
  `compensacion` decimal(9,2) DEFAULT '0.00',
  `euroshora` decimal(9,2) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFinal` date DEFAULT NULL,
  `fechaPagado` date DEFAULT NULL,
  `descripcion` text,
  `idFactura` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `tiempos`
--

CREATE TABLE `tiempos` (
  `id` int(10) UNSIGNED NOT NULL,
  `idMovimiento` int(11) DEFAULT NULL,
  `fechaInicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaFinal` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `trab_archivos`
--

CREATE TABLE `trab_archivos` (
  `id` mediumint(9) NOT NULL,
  `nombre` char(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `url` char(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_creacion_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion_in` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `trab_etiquetas`
--

CREATE TABLE `trab_etiquetas` (
  `id` mediumint(9) NOT NULL,
  `nombre` char(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `trab_registros`
--

CREATE TABLE `trab_registros` (
  `id` int(11) NOT NULL,
  `sesion` int(11) DEFAULT NULL,
  `fecha` int(14) DEFAULT NULL,
  `tipo` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fichero` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `linea` int(11) DEFAULT NULL,
  `mensaje` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(1300) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `trab_r_etiqueta_archivo`
--

CREATE TABLE `trab_r_etiqueta_archivo` (
  `etiquetas_id` mediumint(9) NOT NULL,
  `archivos_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `trab_usuarios`
--

CREATE TABLE `trab_usuarios` (
  `id` int(11) NOT NULL,
  `usuario` char(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pass_md5` char(32) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` char(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellidos` char(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mail` char(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` char(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Indexos per taules bolcades
--

--
-- Index de la taula `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Index de la taula `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Index de la taula `etiquetas`
--
ALTER TABLE `etiquetas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Index de la taula `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id`);

--
-- Index de la taula `grupos_tareas`
--
ALTER TABLE `grupos_tareas`
  ADD PRIMARY KEY (`id`);

--
-- Index de la taula `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`);

--
-- Index de la taula `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`);

--
-- Index de la taula `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`);

--
-- Index de la taula `rFacturasPagos`
--
ALTER TABLE `rFacturasPagos`
  ADD PRIMARY KEY (`id`);

--
-- Index de la taula `rMovimientoArchivos`
--
ALTER TABLE `rMovimientoArchivos`
  ADD KEY `id` (`id`);

--
-- Index de la taula `rMovimientoTablas`
--
ALTER TABLE `rMovimientoTablas`
  ADD PRIMARY KEY (`idMovimiento`,`tabla`);

--
-- Index de la taula `r_etiqueta_archivo`
--
ALTER TABLE `r_etiqueta_archivo`
  ADD PRIMARY KEY (`etiquetas_id`,`archivos_id`);

--
-- Index de la taula `r_grupos_tareas`
--
ALTER TABLE `r_grupos_tareas`
  ADD UNIQUE KEY `grupo_id` (`grupo_id`,`tarea_id`);

--
-- Index de la taula `r_personal_proyecto`
--
ALTER TABLE `r_personal_proyecto`
  ADD PRIMARY KEY (`personal_id`,`proyecto_id`);

--
-- Index de la taula `r_usuarios_roles`
--
ALTER TABLE `r_usuarios_roles`
  ADD PRIMARY KEY (`usuarios_id`,`roles_id`);

--
-- Index de la taula `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`);

--
-- Index de la taula `tiempos`
--
ALTER TABLE `tiempos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fechaFinal` (`fechaFinal`);

--
-- Index de la taula `trab_archivos`
--
ALTER TABLE `trab_archivos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Index de la taula `trab_etiquetas`
--
ALTER TABLE `trab_etiquetas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Index de la taula `trab_registros`
--
ALTER TABLE `trab_registros`
  ADD PRIMARY KEY (`id`);

--
-- Index de la taula `trab_r_etiqueta_archivo`
--
ALTER TABLE `trab_r_etiqueta_archivo`
  ADD PRIMARY KEY (`etiquetas_id`,`archivos_id`);

--
-- Index de la taula `trab_usuarios`
--
ALTER TABLE `trab_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT per la taula `etiquetas`
--
ALTER TABLE `etiquetas`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT per la taula `grupos_tareas`
--
ALTER TABLE `grupos_tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT per la taula `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3995;
--
-- AUTO_INCREMENT per la taula `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT per la taula `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT per la taula `rFacturasPagos`
--
ALTER TABLE `rFacturasPagos`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT per la taula `rMovimientoArchivos`
--
ALTER TABLE `rMovimientoArchivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32832;
--
-- AUTO_INCREMENT per la taula `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2395;
--
-- AUTO_INCREMENT per la taula `tiempos`
--
ALTER TABLE `tiempos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8746;
--
-- AUTO_INCREMENT per la taula `trab_archivos`
--
ALTER TABLE `trab_archivos`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la taula `trab_etiquetas`
--
ALTER TABLE `trab_etiquetas`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `trab_registros`
--
ALTER TABLE `trab_registros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7042;
--
-- AUTO_INCREMENT per la taula `trab_usuarios`
--
ALTER TABLE `trab_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
