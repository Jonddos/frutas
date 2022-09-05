-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2022 a las 04:27:49
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fruver`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `ID_CARGO` int(5) NOT NULL,
  `CARGO_NOMBRE` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID_CATE` int(5) NOT NULL,
  `CATE_NOMBRE` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID_CATE`, `CATE_NOMBRE`) VALUES
(1, 'frutas'),
(2, 'mecato'),
(3, 'verduras'),
(4, 'hogar'),
(5, 'licores'),
(6, 'granos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_CLIENTE` int(5) NOT NULL,
  `CLIENTE_APELLIDO` varchar(40) DEFAULT NULL,
  `CLIENTE_NOMBRE` varchar(40) DEFAULT NULL,
  `CLIENTE_DOC` bigint(20) DEFAULT NULL,
  `CLIENTE_TELEFONO` bigint(20) DEFAULT NULL,
  `CLIENTE_DIRECCION` varchar(40) DEFAULT NULL,
  `CLIENTE_GENERO` enum('FEMENINO','MASCULINO','INDEFINIDO','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contabilidad`
--

CREATE TABLE `contabilidad` (
  `ID_CONT` int(5) NOT NULL,
  `CONT_UTILIDAD` float NOT NULL,
  `CONT_INGRESOSTOTALES` float NOT NULL,
  `CONT_EGRESOSTOTALES` float NOT NULL,
  `ID_FACT2` int(5) NOT NULL,
  `ID_DETPEDIDO4` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle factura`
--

CREATE TABLE `detalle factura` (
  `ID_DETFACTURA` int(5) NOT NULL,
  `DETFACTURA_SUBTOTAL` float NOT NULL,
  `DETFACTURA_VALORIVA` float NOT NULL,
  `DETFACTURA_PROPINA` float NOT NULL,
  `DETFACTURA_DESCUENTO` float NOT NULL,
  `DETFACTURA_DOMICILIO` float NOT NULL,
  `DETFACTURA_VALORTOTAL` int(11) NOT NULL,
  `ID_VENTA2` int(5) NOT NULL,
  `ID_IVA2` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle pedido`
--

CREATE TABLE `detalle pedido` (
  `ID_DETPEDIDO` int(5) NOT NULL,
  `DETPEDIDO_VALORIVA` float NOT NULL,
  `DETPEDIDO_SUBVALOR` float NOT NULL,
  `DETPEDIDO_VALORTOTAL` float NOT NULL,
  `ID_IVA3` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `ID_EMPL` int(5) NOT NULL,
  `ID_CARGO2` int(5) DEFAULT NULL,
  `EMPL_NOMBRE` varchar(40) DEFAULT NULL,
  `EMPL_APELLIDO` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `ID_FACT` int(5) NOT NULL,
  `FACT_NUMERO` bigint(20) NOT NULL,
  `FACT_FECHAFACT` date NOT NULL,
  `FACT_CAJA` int(5) NOT NULL,
  `ID_DETFACTURA2` int(5) NOT NULL,
  `ID_EMPL2` int(5) NOT NULL,
  `ID_CLIENTE2` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `ID_INVENTARIO` int(5) NOT NULL,
  `INVENTARIO_STOCKINICIAL` int(5) NOT NULL,
  `INVENTARIO_CANTIDAD` int(5) NOT NULL,
  `INVENTARIO_STOCKFINAL` int(5) NOT NULL,
  `INVENTARIO_FECHAREGISTRO` date NOT NULL,
  `ID_DETPEDIDO2` int(5) NOT NULL,
  `ID_PROD2` int(5) NOT NULL,
  `ID_MOV2` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iva`
--

CREATE TABLE `iva` (
  `ID_IVA` int(5) NOT NULL,
  `IVA_TASAIVA` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medida`
--

CREATE TABLE `medida` (
  `ID_MEDIDA` int(5) NOT NULL,
  `MEDIDA_NOMBRE` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medida`
--

INSERT INTO `medida` (`ID_MEDIDA`, `MEDIDA_NOMBRE`) VALUES
(1, 'GRAMOS'),
(2, 'LITROS'),
(3, 'LIBRAS'),
(4, 'UNIDADES'),
(5, 'DECENA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `ID_MOV` int(5) NOT NULL,
  `DESC_MOV` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `ID_PED` int(5) NOT NULL,
  `ID_PROVEE3` int(5) NOT NULL,
  `ID_DETPEDIDO3` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_PROD` int(5) NOT NULL,
  `ID_MEDIDA2` int(5) DEFAULT NULL,
  `ID_CATE2` int(5) DEFAULT NULL,
  `PROD_NOMBRE` varchar(40) DEFAULT NULL,
  `PROD_FV` date DEFAULT NULL,
  `PROD_REFERENCIA` bigint(20) DEFAULT NULL,
  `PROD_UBICACION` varchar(40) DEFAULT NULL,
  `PROD_MARCA` varchar(40) DEFAULT NULL,
  `PROD_VALORCOMPRA` float DEFAULT NULL,
  `PROD_VALORVENTA` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_PROD`, `ID_MEDIDA2`, `ID_CATE2`, `PROD_NOMBRE`, `PROD_FV`, `PROD_REFERENCIA`, `PROD_UBICACION`, `PROD_MARCA`, `PROD_VALORCOMPRA`, `PROD_VALORVENTA`) VALUES
(1, 5, 1, 'Salsify, Organic', '2021-11-03', 8733438021, NULL, 'Perindopril Erbumine', 67, 53),
(2, 3, 5, 'Mushroom - Morel Frozen', '2022-06-22', 2993301403, NULL, 'Ultra Sensitive Faceblock SPF 25', 10, 43),
(3, 4, 3, 'Black Currants', '2022-02-04', 6098810508, NULL, 'Clean Choice Foodservice Antibacterial', 53, 73),
(4, 1, 2, 'Bread - White Epi Baguette', '2021-07-18', 4204963870, NULL, 'Amlodipine Besylate and Benazepril Hydro', 35, 42),
(5, 5, 5, 'Bread - Dark Rye, Loaf', '2022-07-29', 2700730836, NULL, 'Stimulant laxative plus stool softener', 75, 91),
(6, 1, 3, 'Rice - Jasmine Sented', '2022-06-08', 5799824857, NULL, '07 Moisture Foundation SPF 15', 70, 26),
(7, 5, 6, 'Asparagus - Frozen', '2021-07-04', 6813967118, NULL, 'Divalproex Sodium', 81, 92),
(8, 2, 6, 'Wine - Red, Gallo, Merlot', '2022-05-12', 7330465984, NULL, 'TopCare Daily Moisturizer', 19, 59),
(9, 5, 4, 'Oil - Coconut', '2022-02-10', 7394373517, NULL, 'Sertraline', 99, 16),
(10, 1, 3, 'Turkey - Breast, Boneless Sk On', '2022-04-14', 6624674512, NULL, 'Ginger Lime hand sanitizer', 85, 86),
(11, 1, 6, 'arroz', '2022-07-01', 1561, 'bodega', 'diana', 5411, 7800);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `ID_PROVEE` int(5) NOT NULL,
  `PROVEE_NIT` int(15) DEFAULT NULL,
  `PROVEE_NOMBRE` varchar(40) DEFAULT NULL,
  `PROVEE_DIRECCION` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `ID_VENTA` int(5) NOT NULL,
  `VENTA_CANTIDADPRODUCTO` int(5) DEFAULT NULL,
  `VENTA_VALORBRUTO` float DEFAULT NULL,
  `VENTA_PORCENTAJEDESCUENTO` float DEFAULT NULL,
  `VENTA_DESCUENTO` float DEFAULT NULL,
  `VENTA_SUBTOTAL` float DEFAULT NULL,
  `VENTA_VALORNETO` float DEFAULT NULL,
  `ID_PROD3` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`ID_CARGO`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_CATE`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indices de la tabla `contabilidad`
--
ALTER TABLE `contabilidad`
  ADD PRIMARY KEY (`ID_CONT`),
  ADD KEY `ID_FACT2` (`ID_FACT2`,`ID_DETPEDIDO4`),
  ADD KEY `ID_DETPEDIDO4` (`ID_DETPEDIDO4`);

--
-- Indices de la tabla `detalle factura`
--
ALTER TABLE `detalle factura`
  ADD PRIMARY KEY (`ID_DETFACTURA`),
  ADD KEY `ID_VENTA2` (`ID_VENTA2`,`ID_IVA2`),
  ADD KEY `ID_IVA2` (`ID_IVA2`);

--
-- Indices de la tabla `detalle pedido`
--
ALTER TABLE `detalle pedido`
  ADD PRIMARY KEY (`ID_DETPEDIDO`),
  ADD KEY `ID_IVA3` (`ID_IVA3`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID_EMPL`),
  ADD KEY `ID_CARGO2` (`ID_CARGO2`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID_FACT`),
  ADD KEY `ID_EMPL2` (`ID_EMPL2`,`ID_CLIENTE2`),
  ADD KEY `ID_DETFACTURA2` (`ID_DETFACTURA2`),
  ADD KEY `ID_CLIENTE2` (`ID_CLIENTE2`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`ID_INVENTARIO`),
  ADD KEY `ID_DETPEDIDO2` (`ID_DETPEDIDO2`,`ID_PROD2`,`ID_MOV2`),
  ADD KEY `ID_MOV2` (`ID_MOV2`),
  ADD KEY `ID_PROD2` (`ID_PROD2`);

--
-- Indices de la tabla `iva`
--
ALTER TABLE `iva`
  ADD PRIMARY KEY (`ID_IVA`);

--
-- Indices de la tabla `medida`
--
ALTER TABLE `medida`
  ADD PRIMARY KEY (`ID_MEDIDA`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`ID_MOV`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID_PED`),
  ADD KEY `ID_PROVEE3` (`ID_PROVEE3`,`ID_DETPEDIDO3`),
  ADD KEY `ID_DETPEDIDO3` (`ID_DETPEDIDO3`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_PROD`),
  ADD KEY `ID_MEDIDA2` (`ID_MEDIDA2`,`ID_CATE2`),
  ADD KEY `ID_CATE2` (`ID_CATE2`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`ID_PROVEE`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`ID_VENTA`),
  ADD KEY `ID_PROD3` (`ID_PROD3`),
  ADD KEY `ID_PROD3_2` (`ID_PROD3`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contabilidad`
--
ALTER TABLE `contabilidad`
  ADD CONSTRAINT `ID_DETPEDIDO4` FOREIGN KEY (`ID_DETPEDIDO4`) REFERENCES `detalle pedido` (`ID_DETPEDIDO`),
  ADD CONSTRAINT `ID_FACT2` FOREIGN KEY (`ID_FACT2`) REFERENCES `factura` (`ID_FACT`);

--
-- Filtros para la tabla `detalle factura`
--
ALTER TABLE `detalle factura`
  ADD CONSTRAINT `ID_IVA2` FOREIGN KEY (`ID_IVA2`) REFERENCES `iva` (`ID_IVA`),
  ADD CONSTRAINT `ID_VENTA2` FOREIGN KEY (`ID_VENTA2`) REFERENCES `venta` (`ID_VENTA`);

--
-- Filtros para la tabla `detalle pedido`
--
ALTER TABLE `detalle pedido`
  ADD CONSTRAINT `ID_IVA3` FOREIGN KEY (`ID_IVA3`) REFERENCES `iva` (`ID_IVA`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `ID_CARGO2` FOREIGN KEY (`ID_CARGO2`) REFERENCES `cargo` (`ID_CARGO`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `ID_CLIENTE2` FOREIGN KEY (`ID_CLIENTE2`) REFERENCES `cliente` (`ID_CLIENTE`),
  ADD CONSTRAINT `ID_DETFACTURA2` FOREIGN KEY (`ID_DETFACTURA2`) REFERENCES `detalle factura` (`ID_DETFACTURA`),
  ADD CONSTRAINT `ID_EMPL2` FOREIGN KEY (`ID_EMPL2`) REFERENCES `empleados` (`ID_EMPL`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `ID_DETPEDIDO2` FOREIGN KEY (`ID_DETPEDIDO2`) REFERENCES `detalle pedido` (`ID_DETPEDIDO`),
  ADD CONSTRAINT `ID_MOV2` FOREIGN KEY (`ID_MOV2`) REFERENCES `movimiento` (`ID_MOV`),
  ADD CONSTRAINT `ID_PROD2` FOREIGN KEY (`ID_PROD2`) REFERENCES `producto` (`ID_PROD`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `ID_DETPEDIDO3` FOREIGN KEY (`ID_DETPEDIDO3`) REFERENCES `detalle pedido` (`ID_DETPEDIDO`),
  ADD CONSTRAINT `ID_PROVEE3` FOREIGN KEY (`ID_PROVEE3`) REFERENCES `proveedor` (`ID_PROVEE`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `ID_CATE2` FOREIGN KEY (`ID_CATE2`) REFERENCES `categoria` (`ID_CATE`),
  ADD CONSTRAINT `ID_MEDIDA2` FOREIGN KEY (`ID_MEDIDA2`) REFERENCES `medida` (`ID_MEDIDA`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `ID_PROD3` FOREIGN KEY (`ID_PROD3`) REFERENCES `producto` (`ID_PROD`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
