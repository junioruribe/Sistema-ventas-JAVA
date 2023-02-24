-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-02-2023 a las 23:12:14
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `dbventas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizar`(IN `cod` VARCHAR(11), IN `nom` VARCHAR(50), IN `tel` VARCHAR(12), IN `email` VARCHAR(40), IN `esta` BOOLEAN, IN `usser` VARCHAR(10))
update empleado set Nombre=nom,Correo=Email,Telefono=tel,Estado=esta,Usuario=usser where
Id=cod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCliente`(IN `id` VARCHAR(10), IN `nom` VARCHAR(50), IN `dire` VARCHAR(50), IN `esta` BOOLEAN)
update cliente set Nombres=nom,Direccion=dire,Estado=esta where
IdCliente=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarProducto`(IN `id` INT, IN `nom` VARCHAR(50), IN `pre` INT, IN `descu` DOUBLE, IN `sto` INT, IN `esta` BOOLEAN)
update producto set IdProducto=id,Nombre=nom,Precio=pre,Descuento=descu,Stock=sto,Estado=esta where
IdProducto=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spAgregar`(IN `id` VARCHAR(11), IN `nom` VARCHAR(50), IN `email` VARCHAR(40), IN `tel` VARCHAR(12), IN `usuario` VARCHAR(10), IN `pass` INT, IN `esta` BOOLEAN)
insert into empleado(Id,Nombre,Correo,Telefono,Usuario,Clave,Estado) values(id,nom,email,tel,usuario,pass,esta)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SpAgregarCliente`(IN `Id` VARCHAR(10), IN `nom` VARCHAR(50), IN `dire` VARCHAR(50), IN `esta` BOOLEAN)
insert into cliente(IdCliente,Nombres,Direccion,Estado) values(id,nom,dire,esta)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spAgregarProducto`(IN `id` INT, IN `nom` VARCHAR(50), IN `pre` INT, IN `descu` DOUBLE, IN `sto` INT, IN `esta` BOOLEAN)
insert into producto(IdProducto,Nombre,Precio,Descuento,Stock,Estado)
values (id,nom,pre,descu,sto,esta)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spbuscar`(IN `cod` VARCHAR(11))
select*from empleado where Id=cod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spBuscarCliente`(IN `id` VARCHAR(10))
select*from cliente where IdCliente=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spBuscarDNI`(IN `nom` VARCHAR(50), IN `usu` VARCHAR(10), IN `correo` VARCHAR(40))
    NO SQL
select fnGetDNI(nom,usu,correo)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spBuscarProducto`(IN `id` INT)
select*from producto where IdProducto=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spBuscarVenta`(IN `idven` INT)
    NO SQL
SELECT V.IdVenta,IdCliente,DNI,Fecha,D.Valor,V.Estado,IdDetalle,D.IdProducto,
		Nombre,Cantidad,D.Descuento
FROM Venta V inner join Detalle D on V.idVenta=D.idVenta 
			inner join Producto P on D.IdProducto=P.IdProducto
WHERE V.idVenta=idven$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spEliminar`(IN `doc` VARCHAR(11))
delete  from empleado where Id=doc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spEliminarCliente`(IN `id` INT)
delete  from cliente where IdCliente=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spEliminarProducto`(IN `id` INT)
delete  from producto where IdProducto=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spListar`()
select * from empleado$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spListarC`()
SELECT * FROM cliente$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spListarProducto`()
select * from producto$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `splogin`(IN `user` VARCHAR(10), IN `pass` INT)
select * from empleado where Usuario=user AND Clave=pass$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spmaxIdVenta`()
    NO SQL
SELECT AUTO_INCREMENT
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'dbventas' AND TABLE_NAME='venta'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spRegistrarDetalle`(IN `idven` INT, IN `idpro` INT, IN `cant` INT, IN `vr` INT, IN `des` DOUBLE)
    NO SQL
insert into Detalle(IdVenta,IdProducto,Cantidad,Valor,Descuento)
values (idven,idpro,cant,vr,des)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spRegistrarVenta`(IN `idcli` VARCHAR(10), IN `idemp` VARCHAR(11), IN `fe` DATE, IN `vr` DOUBLE, IN `esta` VARCHAR(12))
    NO SQL
INSERT INTO venta(IdCliente,DNI,Fecha,Valor,Estado)
VALUES(idcli,idemp,fe,vr,esta)$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `fnGetDNI`(`nom` VARCHAR(50), `usu` VARCHAR(10), `email` VARCHAR(40)) RETURNS varchar(11) CHARSET latin1
begin
	declare idemp varchar(11);
    set idemp = (select Id 
              from Empleado
              where Nombre=nom and Usuario=usu and Correo=email
              );
     return idemp;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `IdCliente` varchar(10) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`IdCliente`),
  KEY `IdCliente` (`IdCliente`),
  KEY `IdCliente_2` (`IdCliente`),
  KEY `IdCliente_3` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`IdCliente`, `Nombres`, `Direccion`, `Estado`) VALUES
('1212', 'esneider', 'C 85A # 50-31', 1),
('123', 'alberto', 'robledo', 0),
('1313', 'Juan', 'Cll 80M 63-102', 1),
('1414', 'daniela', 'Cll 78N 68-10', 0),
('1515', 'aleida', 'Cr 78E 50-60', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE IF NOT EXISTS `detalle` (
  `IdDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `IdVenta` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Valor` int(11) NOT NULL,
  `Descuento` double NOT NULL,
  PRIMARY KEY (`IdDetalle`),
  KEY `IdDetalle` (`IdDetalle`),
  KEY `IdVenta` (`IdVenta`),
  KEY `IdProducto` (`IdProducto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`IdDetalle`, `IdVenta`, `IdProducto`, `Cantidad`, `Valor`, `Descuento`) VALUES
(14, 1, 1020, 1, 40000, 50),
(15, 2, 5020, 1, 3920, 2),
(16, 3, 6010, 1, 39200, 2),
(17, 4, 9020, 1, 76000, 5),
(18, 5, 5020, 2, 7840, 2),
(19, 6, 1020, 3, 80000, 50),
(20, 7, 1020, 2, 80000, 50),
(21, 7, 9020, 2, 152000, 5);

--
-- Disparadores `detalle`
--
DROP TRIGGER IF EXISTS `ActualizarStockProducto`;
DELIMITER //
CREATE TRIGGER `ActualizarStockProducto` BEFORE INSERT ON `detalle`
 FOR EACH ROW BEGIN
	UPDATE producto set Stock = Stock-NEW.Cantidad
    WHERE IdProducto = New.IdProducto;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `Id` varchar(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Correo` varchar(40) NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  `Usuario` varchar(10) NOT NULL,
  `Clave` int(11) NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`Id`, `Nombre`, `Correo`, `Telefono`, `Usuario`, `Clave`, `Estado`) VALUES
('1111', 'junior', 'junior@outlook.com', '3107312011', 'jr', 123, 1),
('2222', 'kelly', 'kelly@outlook.com', '4610236', 'kelly', 1234, 1),
('3333', 'juan', 'juan@outlook.com', '4869632', 'juan', 12345, 0),
('4444', 'aleida', 'aleidacañola@hotmail.com', '3126029876', 'mama', 123, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `IdProducto` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Precio` int(11) NOT NULL,
  `Descuento` double NOT NULL,
  `Stock` int(11) NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `IdProducto` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`IdProducto`, `Nombre`, `Precio`, `Descuento`, `Stock`, `Estado`) VALUES
(1020, 'camisas', 80000, 10, 100, 0),
(3211, 'gafas', 10000, 20, 10, 1),
(5020, 'Medias', 4000, 2, 145, 0),
(6010, 'Pantalon', 40000, 2, 47, 1),
(9020, 'Jeans', 80000, 5, 17, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
  `IdVenta` int(11) NOT NULL AUTO_INCREMENT,
  `IdCliente` varchar(10) NOT NULL,
  `DNI` varchar(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Valor` double NOT NULL,
  `Estado` varchar(12) NOT NULL,
  PRIMARY KEY (`IdVenta`),
  KEY `DNI` (`DNI`),
  KEY `IdCliente` (`IdCliente`),
  KEY `IdVenta` (`IdVenta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`IdVenta`, `IdCliente`, `DNI`, `Fecha`, `Valor`, `Estado`) VALUES
(1, '1212', '1111', '2022-12-07', 40000, 'Pago'),
(2, '1313', '1111', '2022-12-07', 3920, 'Pago'),
(3, '1414', '1111', '2022-12-07', 39200, 'Pago'),
(4, '1515', '1111', '2022-12-07', 76000, 'Pago'),
(5, '1313', '1111', '2022-12-07', 7840, 'Pago'),
(6, '123', '1111', '2022-12-07', 120000, 'Pago'),
(7, '1212', '1111', '2022-12-12', 232000, 'Pago');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`),
  ADD CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`IdVenta`) REFERENCES `venta` (`IdVenta`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `empleado` (`Id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
