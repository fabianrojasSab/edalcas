-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-10-2018 a las 13:33:00
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyformativo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `numCel` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombre`, `numCel`) VALUES
(19, 'aura', '512951');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientesinteresados`
--

CREATE TABLE `clientesinteresados` (
  `idCliente` int(11) NOT NULL,
  `idPlan` int(11) NOT NULL,
  `FechaRegistro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE `planes` (
  `idPlan` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `oferta` varchar(40) DEFAULT NULL,
  `precio` varchar(20) NOT NULL,
  `proteccionEquipo` varchar(40) DEFAULT NULL,
  `antivirus` varchar(10) DEFAULT NULL,
  `numCanales` varchar(20) DEFAULT NULL,
  `HD` varchar(20) DEFAULT NULL,
  `SD` varchar(20) DEFAULT NULL,
  `paqueteAdicional` varchar(50) DEFAULT NULL,
  `anchoBanda` varchar(20) DEFAULT NULL,
  `movistarPLay` varchar(20) DEFAULT NULL,
  `llamadasNac` varchar(40) DEFAULT NULL,
  `llamadasInt` varchar(50) DEFAULT NULL,
  `minutos` varchar(20) DEFAULT NULL,
  `preferidos` varchar(30) DEFAULT NULL,
  `PromocionMinutos` varchar(30) DEFAULT NULL,
  `capacidadNube` varchar(20) DEFAULT NULL,
  `appsIlimitadas` varchar(50) DEFAULT NULL,
  `promocionMusica` varchar(5) DEFAULT NULL,
  `numDecos` varchar(40) DEFAULT NULL,
  `obsequio` varchar(20) DEFAULT NULL,
  `obsequio2` varchar(40) DEFAULT NULL,
  `tipoPlan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`idPlan`, `precio`, `proteccionEquipo`, `antivirus`, `numCanales`, `HD`, `SD`, `paqueteAdicional`, `anchoBanda`, `movistarPLay`, `llamadasNac`, `llamadasInt`, `minutos`, `preferidos`, `PromocionMinutos`, `capacidadNube`, `appsIlimitadas`, `promocionMusica`, `numDecos`, `obsequio`, `obsequio2`, `tipoPlan`) VALUES
('72.900', '', '', '', '', '', '', '5 MB', '', 'Voz ilimitada nacional', '', '', 'Preferido fijo + móvil', '', '', '', '', '', 'El primer mes gratis', '', 'INTERNET FIJO NEGOCI'),
('81.900', 'Protección web', 'Antivirus', '', '', '', '', '5 MB', '', 'Voz ilimitada nacional', '', '', 'Preferido fijo + móvil', '', '', '', '', '', 'El primer mes gratis', '', 'INTERNET FIJO NEGOCI'),
('91.900', 'Protección web', 'Antivirus', '', '', '', '', '15 MB', '', 'Voz ilimitada nacional', '', '', 'Preferido fijo + móvil', '', '', '', '', '', 'El primer mes gratis', '', 'INTERNET FIJO NEGOCI'),
('137.900', 'Protección web', 'Antivirus', '', '', '', '', '40 MB', '', 'Voz ilimitada nacional', '', '', 'Preferido fijo + móvil', '', '', '', '', '', 'El primer mes gratis', '', 'INTERNET FIJO NEGOCI'),
('91.900', 'Protección web', 'Antivirus', '', '', '', '', '10 MB', '', 'Voz ilimitada nacional', '', '', 'Preferido fijo + móvil', '', '', '', '', '', 'El primer mes gratis', 'Repetidor WiFi gratis', 'INTERNET FIJO NEGOCI'),
('137.900', 'Protección web', 'Antivirus', '', '', '', '', '20 MB', '', 'Voz ilimitada nacional', '', '', 'Preferido fijo + móvil', '', '', '', '', '', 'El primer mes gratis', 'Repetidor WiFi gratis', 'INTERNET FIJO NEGOCI'),
('175.900', 'Protección web', 'Antivirus', '', '', '', '', '50 MB', '', 'Voz ilimitada nacional', '', '', 'Preferido fijo + móvil', '', '', '', '', '', 'El primer mes gratis', 'Repetidor WiFi gratis', 'INTERNET FIJO NEGOCI'),
('218.900', 'Protección web', 'Antivirus', '', '', '', '', '100 MB', '', 'Voz ilimitada nacional', '', '', 'Preferido fijo móvil', '', '', '', '', '', 'El primer mes gratis', 'Repetidor WiFi gratis', 'INTERNET FIJO NEGOCI'),
('111.900', '', '', '135 canales', '51 canales HD', '84 canales SD', '', '5 MB', 'Movistar Play', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '2 Decos HD', 'Los dos primeros mes', '', 'FULL HOGAR TRÍO'),
('129.900', '', '', '135 canales', '51 canales HD', '84 canales SD', '', '10 MB', 'Movistar Play', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '2 Decos HD', 'Los dos primeros mes', '', 'FULL HOGAR TRÍO'),
('146.900', '', '', '135 canales', '51 canales HD', '84 canales SD', '', '20 MB', 'Movistar Play', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '2 Decos HD', 'Los dos primeros mes', 'Gratis Smartphone 5', 'FULL HOGAR TRÍO'),
('174.900', '', '', '135 canales', '51 canales HD', '84 canales SD', '', '40 MB', 'Movistar Play', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '2 Decos HD', 'Los dos primeros mes', 'Gratis Smartphone 5"', 'FULL HOGAR TRÍO'),
('77.900', '', '', '', '', '', '', '5 MB', 'Movistar Play', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '', 'El primer mes gratis', '', 'FULL HOGAR DÚO'),
('88.900', '', '', '', '', '', '', '10 MB', 'Movistar Play', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '', 'El primer mes gratis', '', 'FULL HOGAR DÚO'),
('128.900', '', '', '', '', '', '', '20 MB', 'Movistar Play', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '', 'El primer mes gratis', 'Gratis Smartphone 5" ', 'FULL HOGAR DÚO'),
('153.900', '', '', '', '', '', '', '40 MB', 'Movistar Play', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '', 'El primer mes gratis', 'Gratis Smartphone 5" ', 'FULL HOGAR DÚO'),
('129.900', '', '', '135 canales', '51 canales HD', '84 canales SD', '', '10 MB', 'Movistar Play', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '2 Decos HD', 'Los dos primeros mes', '', 'FIBRA ÓPTICA TRÍO'),
('146.900', '', '', '135 canales', '51 canales HD', '84 canales SD', '', '20 MB', 'Movistar Play', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '2 Decos HD', 'Los dos primeros mes', 'Gratis Smartphone 5" y repetidor WiFi', 'FIBRA ÓPTICA TRÍO'),
('203.900', '', '', '135 canales', '51 canales HD', '84 canales SD', '', '50 MB', 'Movistar Play', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '2 Decos HD', 'Los dos primeros mes', 'Gratis Smartphone 5" y repetidor WiFi', 'FIBRA ÓPTICA TRÍO'),
('248.900', '', '', '135 canales', '51 canales HD', '84 canales SD', '', '100 MB', 'Movistar Play', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '2 Decos HD', 'Los dos primeros mes', 'Gratis Smartphone 5" y repetidor WiFi', 'FIBRA ÓPTICA TRÍO'),
('88.900', '', '', '', '', '', '', '10 MB', 'Movistar Play Lite', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '', '', '', 'FIBRA ÓPTICA DÚO'),
('128.900', '', '', '', '', '', '', '20 MB', 'Movistar Play Lite', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '', '', 'Gratis Smartphone 5" y repetidor WiFi', 'FIBRA ÓPTICA DÚO'),
('162.900', '', '', '', '', '', '', '50 MB', 'Movistar Play Lite', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '', '', 'Gratis Smartphone 5" y repetidor WiFi', 'FIBRA ÓPTICA DÚO'),
('210.900', '', '', '', '', '', '', '100 MB', 'Movistar Play Lite', 'Larga distancia nacional ilimitada', '', '', 'Preferido fijo + móvil', '', '', '', '', '', '', 'Gratis Smartphone 5" y repetidor WiFi', 'FIBRA ÓPTICA DÚO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `clientesinteresados`
--
ALTER TABLE `clientesinteresados`
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idPlan` (`idPlan`);

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`idPlan`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE `planes`
  MODIFY `idPlan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientesinteresados`
--
ALTER TABLE `clientesinteresados`
  ADD CONSTRAINT `clientesinteresados_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `clientesinteresados_ibfk_2` FOREIGN KEY (`idPlan`) REFERENCES `planes` (`idPlan`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
