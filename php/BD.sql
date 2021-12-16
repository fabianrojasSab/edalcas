-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2018 a las 18:14:30
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

CREATE TABLE clientes (
  idCliente int(11) NOT NULL,
  nombre varchar(50) NOT NULL,
  numCel int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientesinteresados`
--

CREATE TABLE clientesinteresados (
  idCliente int(11) NOT NULL,
  idPlan int(11) NOT NULL,
  FechaRegistro date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE planes (
  idPlan int(11) NOT NULL,
  nombre varchar(40) NOT NULL,
  precio int(11) NOT NULL,
  proteccionEquipo varchar(40) DEFAULT NULL,
  antivirus varchar(10) DEFAULT NULL,
  numCanales int(11) DEFAULT NULL,
  HD int(11) DEFAULT NULL,
  SD int(11) DEFAULT NULL,
  paqueteAdicional varchar(50) DEFAULT NULL,
  anchoBanda varchar(20) DEFAULT NULL,
  movistarPLay varchar(5) DEFAULT NULL,
  llamadasNac varchar(5) DEFAULT NULL,
  llamadasInt varchar(50) DEFAULT NULL,
  minutos varchar(20) DEFAULT NULL,
  preferidos varchar(30) DEFAULT NULL,
  PromocionMinutos varchar(30) DEFAULT NULL,
  capacidadNube varchar(20) DEFAULT NULL,
  appsIlimitadas varchar(50) DEFAULT NULL,
  promocionMusica varchar(5) DEFAULT NULL,
  numDecos varchar(15) DEFAULT NULL,
  obsequio varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE clientes
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `clientesinteresados`
--
ALTER TABLE clientesinteresados
  ADD KEY idCliente (idCliente),
  ADD KEY idPlan (idPlan);

--
-- Indices de la tabla `planes`
--
ALTER TABLE planes
  ADD PRIMARY KEY (idPlan);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE clientes
  MODIFY idCliente int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE planes
  MODIFY idPlan int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientesinteresados`
--
ALTER TABLE clientesinteresados
  ADD CONSTRAINT clientesinteresados_ibfk_1 FOREIGN KEY (idCliente) REFERENCES clientes (idCliente),
  ADD CONSTRAINT clientesinteresados_ibfk_2 FOREIGN KEY (idPlan) REFERENCES planes (idPlan);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
