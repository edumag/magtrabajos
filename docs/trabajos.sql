-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-09-2012 a las 16:35:37
-- Versión del servidor: 5.5.24
-- Versión de PHP: 5.3.10-1ubuntu3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `trabajos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE IF NOT EXISTS `archivos` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nombre` char(150) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `url` char(200) DEFAULT NULL,
  `fecha_creacion_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion_in` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE IF NOT EXISTS `documentos` (
  `idMovimiento` int(11) NOT NULL COMMENT 'id de tarea',
  `url` varchar(100) NOT NULL COMMENT 'url de documento'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Relación de documentos con tarea';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiquetas`
--

CREATE TABLE IF NOT EXISTS `etiquetas` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nombre` char(20) DEFAULT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE IF NOT EXISTS `facturas` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `comentario` varchar(50) DEFAULT NULL,
  `fechaFactura` date NOT NULL,
  `fechaPagado` date DEFAULT NULL,
  `Total` float DEFAULT '0',
  `idProyecto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE IF NOT EXISTS `movimientos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idTarea` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `fechaInicio` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fechaFinal` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2105 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `enviarTareas` tinyint(1) DEFAULT NULL COMMENT 'Nos dice si enviamos email o no al terminar tarea',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE IF NOT EXISTS `proyectos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `descripcion` text,
  `svn` varchar(50) NOT NULL DEFAULT 'NO',
  `ftp` varchar(30) DEFAULT NULL,
  `dirFtp` varchar(30) DEFAULT NULL,
  `dirLocal` varchar(130) DEFAULT NULL,
  `activado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Saber si el proyecto esta en activo',
  `facturacion` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Saber si el proyecto requiere facturación',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE IF NOT EXISTS `registros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sesion` int(11) DEFAULT NULL,
  `fecha` time DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fichero` varchar(100) DEFAULT NULL,
  `linea` int(11) DEFAULT NULL,
  `mensaje` varchar(500) DEFAULT NULL,
  `descripcion` varchar(1300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3175 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rFacturasPagos`
--

CREATE TABLE IF NOT EXISTS `rFacturasPagos` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `idFactura` tinyint(4) NOT NULL,
  `pagado` float(9,2) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Movimiento de pagos en facturas' AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rMovimientoArchivos`
--

CREATE TABLE IF NOT EXISTS `rMovimientoArchivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idMovimiento` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(100) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9800 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rMovimientoTablas`
--

CREATE TABLE IF NOT EXISTS `rMovimientoTablas` (
  `idMovimiento` int(11) NOT NULL DEFAULT '0',
  `tabla` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`idMovimiento`,`tabla`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='rel: movimientos.id Tablas afectadas por el movimiento';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_etiqueta_archivo`
--

CREATE TABLE IF NOT EXISTS `r_etiqueta_archivo` (
  `etiquetas_id` mediumint(9) NOT NULL,
  `archivos_id` mediumint(9) NOT NULL,
  PRIMARY KEY (`etiquetas_id`,`archivos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_personal_proyecto`
--

CREATE TABLE IF NOT EXISTS `r_personal_proyecto` (
  `personal_id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  PRIMARY KEY (`personal_id`,`proyecto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='rel:personal id,proyectos id';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE IF NOT EXISTS `tareas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `idFactura` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1375 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiempos`
--

CREATE TABLE IF NOT EXISTS `tiempos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idMovimiento` int(11) DEFAULT NULL,
  `fechaInicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaFinal` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4513 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` char(50) DEFAULT NULL,
  `pass_md5` char(32) DEFAULT NULL,
  `nombre` char(50) DEFAULT NULL,
  `apellidos` char(50) DEFAULT NULL,
  `fecha` time DEFAULT NULL,
  `fecha_actualizacion` time DEFAULT NULL,
  `mail` char(60) DEFAULT NULL,
  `telefono` char(15) DEFAULT NULL,
  `administrador` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
