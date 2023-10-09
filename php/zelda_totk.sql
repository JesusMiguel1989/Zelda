-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 09-10-2023 a las 13:49:24
-- Versión del servidor: 8.0.32
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `zelda totk`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `completados`
--

CREATE TABLE `completados` (
  `Correo` varchar(40) NOT NULL,
  `COD_SANTUARIO` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `completados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poderes`
--

CREATE TABLE `poderes` (
  `NOMBRE` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(500) NOT NULL,
  `LOGO` varchar(200) NOT NULL,
  `Uicación` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `poderes`
--

INSERT INTO `poderes` (`NOMBRE`, `DESCRIPCION`, `LOGO`, `Uicación`) VALUES
('Ultramano', 'Asir, mover y girar objetos a distancia así como fusionar distintas piezas del entorno para crear vehículos o estructuras.', './imagenes/Poderes/mano.png', 'Santuario de Uqo\'u'),
('Combinación', 'Combinar armas, escudos y munición con elementos del mundo para crear una nueva versión.', './imagenes/Poderes/combinacion.png', 'Santuario de Insa'),
('Infiltración', 'Saltar hacia arriba en vertical para atravesar superficies y salir por el otro lado.', './imagenes/Poderes/ascenso.png', 'Santuario de Gutanabaq'),
('Retroceso', 'Hacer retroceder ciertos elementos en el tiempo y/o devolverlos a su posición original.', './imagenes/Poderes/retroceso.png', 'En la misión del templo del tiempo ( la puerta cerrada)'),
('Amiibo', 'Escanear figuras Amiibo para obtener recompensas.', './imagenes/Poderes/amiibo.png', 'Al desbloquear el primer poder'),
('Mapa', 'Realizar teletransportes entre portales.', './imagenes/Poderes/mapa.png', 'Se obtiene después de conseguir Ultramano, Combinación, Infiltración y Retroceso como parte de la misión La puerta cerrada.'),
('Cámara de fotos', 'Sacar fotos con la Tableta de Prunia y obtener información más detallada del mundo.', './imagenes/Poderes/fotos.png', 'Se obtiene durante la misión principal Los habitantes del subsuelo; te la instala Rotver en la tableta cuando te reúnes con él en el subsuelo.'),
('Generador de esquema', 'Almacena todo lo que construyas con la Ultramano y emplea zonnanio y materiales cercanos para recrear al instante tus construcciones.', './imagenes/Poderes/generador.png', 'Se obtiene durante la misión principal El templo del subsuelo, interactuando con un gólem en la Gran mina abandonada central.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posee`
--

CREATE TABLE `posee` (
  `CORREO` varchar(40) NOT NULL,
  `COD_ROPA` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `posee`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `COD_REGION` int NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `FOTO` varchar(100) NOT NULL,
  `SANTUARIOS` int NOT NULL,
  `DESCRIPCION` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`COD_REGION`, `NOMBRE`, `FOTO`, `SANTUARIOS`, `DESCRIPCION`) VALUES
(1, 'Gran Isla de los Albores', './imagenes/Albores.png', 4, 'Isla donde empieza la aventura.'),
(2, 'Centro Hyrule', './imagenes/CentralHyrule.webp', 7, 'Centro del territorio de Hyrule,<br>Aqui se pueden encontrar:<br>El Castillo.'),
(3, 'Llanura de Hyrule', './imagenes/llanurahyrule.webp', 10, 'Llanura central del territorio de Hyrule.<br>Aqui se pueden encuentra:<br>Castillo y la base central.'),
(4, 'Pantano de Lanayru y Necluda occidental', './imagenes/lanayru.jpg', 9, 'Pantano Lanayru y Necluda Occidental.<br>Aqui se pueden encontrar:<br> El territorio Zora, Monte Lanayru y Kakarico.'),
(5, 'Farone', './imagenes/Farone.png', 8, ''),
(6, 'Necluda oriental', './imagenes/necludaOriental.png', 5, ''),
(7, 'Monte Lanayru', './imagenes/monteLanayru.png', 7, ''),
(8, 'Akkala', './imagenes/akkala.png', 9, ''),
(9, 'El gran bosque de Hyrule', './imagenes/bosqueHyrule.png', 9, ''),
(10, 'Gran Estepa de Tabanta', './imagenes/estepaTabanta.png', 5, ''),
(11, 'Colinas de Hyrule y Confines de Tabanta', './imagenes/colinasTabanta.png', 8, ''),
(12, 'Cordillera de Gerudo', './imagenes/gerudo.png', 5, ''),
(13, 'Hebra', './imagenes/hebra.png', 8, ''),
(14, 'Eldin', './imagenes/eldin.png', 11, ''),
(15, 'Manantial Lanayru', './imagenes/manantialLanayru.png', 7, ''),
(16, 'Desierto Gerudo', './imagenes/desiertoGerudo.png', 13, ''),
(17, 'Cielo Hebra', './imagenes/cieloHebra.png', 8, ''),
(18, 'Cielo Centro Hyrule', './imagenes/cieloCentro.png', 2, ''),
(19, 'Cielo Eldin', './imagenes/cieloEldin.png', 1, ''),
(20, 'Cielo Akkala', './imagenes/cieloAkkala.png', 4, ''),
(21, 'Cielo Lanayru', './imagenes/cieloLanayru.png', 3, ''),
(22, 'Cielo Necluda', './imagenes/cieloNecluda.png', 4, ''),
(23, 'Cielo Farone', './imagenes/cieloFarone.png', 2, ''),
(24, 'Cielo Gerudo', './imagenes/cieloGerudo.png', 4, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registradas`
--

CREATE TABLE `registradas` (
  `CORREO` varchar(40) NOT NULL,
  `COD_REGION` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `registradas`
--

INSERT INTO `registradas` (`CORREO`, `COD_REGION`) VALUES
('jes11989@hotmail.com', 2),
('jes11989@hotmail.com', 3),
('jes11989@hotmail.com', 4),
('jes11989@hotmail.com', 5),
('jes11989@hotmail.com', 6),
('jes11989@hotmail.com', 7),
('jes11989@hotmail.com', 8),
('jes11989@hotmail.com', 9),
('jes11989@hotmail.com', 10),
('jes11989@hotmail.com', 11),
('jes11989@hotmail.com', 12),
('jes11989@hotmail.com', 13),
('jes11989@hotmail.com', 14),
('jes11989@hotmail.com', 15),
('jes11989@hotmail.com', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ropas`
--

CREATE TABLE `ropas` (
  `COD_ROPA` int NOT NULL,
  `Tipo` enum('Normal','Especial','Calor','Frio') NOT NULL,
  `NOMBRE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PARTE` enum('CABEZA','CUERPO','PIERNAS') NOT NULL,
  `UBICACION` varchar(200) NOT NULL,
  `COD_REGION` int NOT NULL,
  `MEJORA` varchar(200) NOT NULL,
  `ARMADURA` int NOT NULL,
  `FOTO` varchar(200) NOT NULL,
  `CONJUNTO` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ropas`
--

INSERT INTO `ropas` (`COD_ROPA`, `Tipo`, `NOMBRE`, `PARTE`, `UBICACION`, `COD_REGION`, `MEJORA`, `ARMADURA`, `FOTO`, `CONJUNTO`) VALUES
(1, 'Normal', 'Sandalias Arcaicas', 'PIERNAS', 'Gran Isla de los Albores', 1, 'Ninguna', 1, './imagenes/Ropajes/Arcaica.png', 'Armadura Arcaica'),
(2, 'Normal', 'Toga Arcaica', 'CUERPO', 'Cueva del estanque (Gran isla de los albores).', 1, 'Ninguna', 1, './imagenes/Ropajes/Arcaica.png', 'Armadura Arcaica'),
(3, 'Normal', 'Capucha hyliana', 'CABEZA', 'Tienda de armaduras del Fuerte vigía.', 2, 'Ninguna', 3, './imagenes/Ropajes/setHyliano.png', 'Set Hyliano'),
(4, 'Normal', 'Túnica hyliana', 'CUERPO', 'Tienda de armaduras del Fuerte vigía.\r\n', 2, 'Ninguna', 3, './imagenes/Ropajes/setHyliano.png', 'Set Hyliano'),
(5, 'Normal', 'Patalón hyliana', 'PIERNAS', 'Tienda de armaduras del Fuerte vigía.\r\n', 2, 'Ninguna', 3, './imagenes/Ropajes/setHyliano.png', 'Set Hyliano'),
(6, 'Normal', 'Botas Guardia Real', 'PIERNAS', 'Castillo Hyrule', 2, 'Ninguna', 4, './imagenes/Ropajes/guardiaReal.png', 'Set Guardia Real'),
(7, 'Normal', 'Boina Guardia Real', 'CABEZA', 'Castillo Hyrule', 2, 'Ninguna', 4, './imagenes/Ropajes/guardiaReal.png', 'Set Guardia Real'),
(8, 'Normal', 'Uniforme Guardia Real', 'CUERPO', 'Castillo Hyrule', 2, 'Ninguna', 4, './imagenes/Ropajes/guardiaReal.png', 'Set Guardia Real'),
(9, 'Normal', 'Armadura Hyliana', 'CUERPO', 'Castillo Hyrule', 2, 'Ninguna', 4, './imagenes/Ropajes/caballeroHyliano.png', 'Set Caballero Hyliano'),
(10, 'Normal', 'Greba Hylianas', 'PIERNAS', 'Castillo Hyrule', 2, 'Ninguna', 4, './imagenes/Ropajes/caballeroHyliano.png', 'Set Caballero Hyliano'),
(11, 'Normal', 'Casco Hyliano', 'CABEZA', 'Castillo Hyrule', 2, 'Ninguna', 4, './imagenes/Ropajes/caballeroHyliano.png', 'Set Caballero Hyliano'),
(12, 'Normal', 'Túnica Crepúsculo', 'CUERPO', 'Raíz de Qimimeg', 8, 'Ninguna', 3, './imagenes/Ropajes/tunicaCrepusculo.png', 'Set del Crepúsculo'),
(13, 'Normal', 'Gorro Crepúsculo', 'CABEZA', 'Nido de Griock', 10, 'Ninguna', 3, './imagenes/Ropajes/tunicaCrepusculo.png', 'Set del Crepúsculo'),
(14, 'Normal', 'Pantalón del Tiempo', 'PIERNAS', 'Mina valle Gerudo', 16, 'Ninguna', 3, './imagenes/Ropajes/tiempo.png', 'Set del Tiempo'),
(15, 'Normal', 'Gorro del tiempo', 'CABEZA', 'Cascadas Taortol', 13, 'Ninguna', 3, './imagenes/Ropajes/tiempo.png', 'Set del Tiempo'),
(16, 'Normal', 'Túnica del tiempo', 'CUERPO', 'Mina del valle de Labla', 3, 'Ninguna', 3, './imagenes/Ropajes/tiempo.png', 'Set del Tiempo'),
(17, 'Normal', 'Tunica de los Recuerdos', 'CUERPO', 'Tiendas de las estatuas de los subsuelos', 2, 'Ninguna', 2, './imagenes/Ropajes/recuerdos.png', 'Túnica Recuerdos'),
(18, 'Normal', 'Tunica del Viento', 'CUERPO', 'Mina del valle Holcan', 14, 'Ninguna', 3, './imagenes/Ropajes/viento.png', 'Set del Viento'),
(19, 'Normal', 'Pantalones del Viento', 'PIERNAS', 'Cantera de Bressia', 6, 'Ninguna', 3, './imagenes/Ropajes/viento.png', 'Set del Viento'),
(20, 'Normal', 'Gorro del Viento', 'CABEZA', 'subsuelo de la Isla Advid', 14, 'Ninguna', 3, './imagenes/Ropajes/viento.png', 'Set del Viento'),
(21, 'Normal', 'Gorro de lo Salvaje', 'CABEZA', 'Fósil tenebroso de Hebra', 13, 'Ninguna', 3, './imagenes/Ropajes/salvaje.png', 'Set de lo Salvaje'),
(22, 'Normal', 'Túnica de lo salvaje', 'CUERPO', 'Fósil tenebroso de Gerudo', 16, 'Ninguna', 4, './imagenes/Ropajes/salvaje.png', 'Set de lo Salvaje'),
(23, 'Normal', 'Pantalones de lo Salvaje', 'PIERNAS', 'Fósil tenebroso de Eldin', 14, 'Ninguna', 4, './imagenes/Ropajes/salvaje.png', 'Set de lo Salvaje'),
(24, 'Normal', 'Túnica de los Cielos', 'CUERPO', 'Floresta de Minsh.', 9, 'Ninguna', 3, './imagenes/Ropajes/cielos.png', 'Set de los Cielos'),
(25, 'Normal', 'Pantalón de los cielos', 'PIERNAS', 'Mina del Valle Gongol', 4, 'Ninguna', 3, './imagenes/Ropajes/cielos.png', 'Set de los Cielos'),
(26, 'Normal', 'Gorro de los cielos', 'CABEZA', 'Floresta Maestral', 7, 'Ninguna', 3, './imagenes/Ropajes/cielos.png', 'Set de los Cielos'),
(27, 'Normal', 'Gorro del preludio', 'CABEZA', 'Mina del valle Rizor', 6, 'Ninguna', 3, './imagenes/Ropajes/preludio.png', 'Set del preludio'),
(28, 'Normal', 'Túnica del preludio', 'CUERPO', 'Mina de los valles gemelos', 6, 'Ninguna', 3, './imagenes/Ropajes/preludio.png', 'Set del preludio'),
(29, 'Normal', 'Pantalón del preludio', 'PIERNAS', 'Mina del valle de Corvon', 13, 'Ninguna', 3, './imagenes/Ropajes/preludio.png', 'Set del preludio'),
(30, 'Normal', 'Pantalón del despertar', 'PIERNAS', 'Cueva del coliseo', 3, 'Ninguna', 3, './imagenes/Ropajes/despertar.png', 'Set del Despertar'),
(31, 'Normal', 'Máscara del despertar', 'CABEZA', 'Cueva de la meseta del trueno', 11, 'Ninguna', 3, './imagenes/Ropajes/despertar.png', 'Set del Despertar'),
(32, 'Normal', 'Túnica del despertar', 'CUERPO', 'Cueva de los pilares ancestrales', 11, 'Ninguna', 3, './imagenes/Ropajes/despertar.png', 'Set del Despertar'),
(33, 'Normal', 'Túnica del elegido', 'CUERPO', 'Castillo de hyrule', 2, 'Ninguna', 5, './imagenes/Ropajes/nuevatunica.png', 'Nueva túnica del elegido'),
(34, 'Normal', 'Sombrero de Sogene', 'CABEZA', 'Completando la misión: Las elecciones a la alcaldía.', 6, 'Ninguna', 3, './imagenes/Ropajes/sogene.png', 'Sombrero Sogene'),
(35, 'Normal', 'Pendientes de Ambar', 'CABEZA', 'Tienda de Gerudo, tras completar : Riju en la ciudadela Gerudo', 16, 'Ninguna', 4, './imagenes/Ropajes/pendientes.WEBP', 'Pendientes ambar'),
(36, 'Especial', 'Túnica aerodinámica', 'CUERPO', 'Isla de la prueba del valor', 11, 'Aumenta la movilidad al planear', 2, './imagenes/Especiales/aerodinamico.png', 'Set Aerodinámico'),
(37, 'Especial', 'Gorro aerodinámico', 'CABEZA', 'Isla de la prueba del arrojo', 7, 'Aumenta la movilidad al planear', 2, './imagenes/Especiales/aerodinamico.png', 'Set aerodinámico'),
(38, 'Especial', 'Pantalón aerodinámico', 'PIERNAS', 'Isla prueba del coraje', 9, 'Aumenta la movilidad al planear', 2, './imagenes/Especiales/aerodinamico.png', 'Set Aerodinámico'),
(39, 'Especial', 'Túnica aislante', 'CUERPO', 'Cueva de la colina Sibilante', 2, 'Aumenta la resistencia eléctrica ', 5, './imagenes/Especiales/aislante.png', 'Set Aislante'),
(40, 'Especial', 'Pantalón aislante', 'PIERNAS', 'Cueva de la Bahía de Horon', 15, 'Aumenta la resistencia eléctrica ', 3, './imagenes/Especiales/aislante.png', 'Set Aislante'),
(41, 'Especial', 'Casco aislante', 'CABEZA', 'Cueva del bosque Sarjon', 5, 'Aumenta la resistencia eléctrica ', 3, './imagenes/Especiales/aislante.png', 'Set Aislante'),
(42, 'Especial', 'Capucha Anfibia', 'CABEZA', 'Completando los rumores sobre zelda', 0, 'Aumenta la Adherencia', 3, './imagenes/Especiales/anfibio.png', 'Set Anfibio'),
(43, 'Especial', 'Hombreras anfibia', 'CUERPO', 'Completando Los rumores sobre Zelda', 0, 'Aumenta la adherencia', 3, './imagenes/Especiales/anfibio.png', 'Set Anfibio'),
(44, 'Especial', 'Grebas Anfibias', 'PIERNAS', 'Completando los rumores sobre Zelda', 0, 'Aumenta la Adherencia', 3, './imagenes/Especiales/anfibio.png', 'Set Anfibio'),
(45, 'Especial', 'Camiseta de Tingle', 'CUERPO', 'Cueva sur de los picos gemelos', 6, 'Aumenta la movilidad nocturna', 2, './imagenes/Especiales/tingle.png', 'Set de Tingle'),
(46, 'Especial', 'Mallas de Tingle', 'PIERNAS', 'Completando el tesoro de Nambod en la cueva', 0, 'Aumenta la movilidad nocturna', 2, './imagenes/Especiales/tingle.png', 'Set de Tingle'),
(47, 'Especial', 'Gorro de Tingle', 'CABEZA', 'Completando el tesoro de Nambod en las heroinas', 0, 'Aumenta la movilidad nocturna', 2, './imagenes/Especiales/tingle.png', 'Set de Tingle'),
(48, 'Especial', 'Túnica del clan Yiga', 'CUERPO', 'Laboratorio de Akkala', 8, 'Aumenta el sigilo', 1, './imagenes/Especiales/yiga.png', 'Set de Yiga'),
(49, 'Especial', 'Mascara del clan Yiga', 'CABEZA', 'Campamento al noreste de la isla Hyla', 5, 'Aumenta el sigilo', 1, './imagenes/Especiales/yiga.png', 'Set de Yiga'),
(50, 'Especial', 'Mallas del clan Yiga', 'PIERNAS', 'Division del clan Yiga en idilia', 9, 'Aumenta el sigilo', 1, './imagenes/Especiales/yiga.png', 'Set de Yiga'),
(51, 'Especial', 'Perchera de Bárbaro ', 'CUERPO', 'Cueva de la colina de Gongol', 2, 'Aumenta el Ataque', 3, './imagenes/Especiales/barbaro.png', 'Set de Barbaro'),
(52, 'Especial', 'Pantalón de Bárbaro ', 'PIERNAS', 'Cueva del monte Igarra', 7, 'Aumenta el ataque', 3, './imagenes/Especiales/barbaro.png', 'Set de Barbaro'),
(53, 'Especial', 'Casco de Bárbaro', 'CABEZA', 'Cueeva de la meseta de Rilog', 6, 'Aumenta el ataque', 3, './imagenes/Especiales/barbaro.png', 'Set de Barbaro'),
(54, 'Especial', 'Camiseta de Escalada', 'CUERPO', 'Cueva de la Llanura de Hyrule Norte', 3, 'Facilita la escalada', 3, './imagenes/Especiales/escalada.png', 'Set de Escalada'),
(55, 'Especial', 'Pañuelo de Escalada', 'CABEZA', 'Cueva del Monte trueno', 7, 'Facilita la Escalada', 3, './imagenes/Especiales/escalada.png', 'Set de Escalada'),
(56, 'Especial', 'Mallas de Escalada', 'PIERNAS', 'Tunel de la meseta de Zorana', 14, 'Facilita la escalada', 3, './imagenes/Especiales/escalada.png', 'Set de Escalada'),
(57, 'Especial', 'Casco de Espectro', 'CABEZA', 'Cueva de la playa de Sugob', 5, 'Aumenta el ataque', 8, './imagenes/Especiales/espectro.png', 'Set de Espectro'),
(58, 'Especial', 'Armadura de Espectro', 'CUERPO', 'Cueva del rio Tamit', 12, 'Aumenta el ataque', 8, './imagenes/Especiales/espectro.png', 'Set de Espectro'),
(59, 'Especial', 'Grebas de Espectro', 'PIERNAS', 'Ruinas del antiguo Altar', 16, 'Aumenta el ataque', 8, './imagenes/Especiales/espectro.png', 'Set de Espectro'),
(60, 'Especial', 'Túnica de los espíritus', 'CUERPO', 'Intercambiando emblemas de Fantano', 0, 'Pierdes rupias en lugar de corazones', 3, './imagenes/Especiales/espiritu.png', 'Set de Espíritu'),
(61, 'Especial', 'Pantalón de los espíritus', 'PIERNAS', 'Intercambiando emblemas de fantasmo', 0, 'Pierdes rupias en lugar de corazones', 3, './imagenes/Especiales/espiritu.png', 'Set de Espíritu'),
(62, 'Especial', 'Tocado de los espíritus', 'CABEZA', 'Intercambiando emblemas de fantasmos', 0, 'Pierdes rupias en lugar de corazones', 3, './imagenes/Especiales/espiritu.png', 'Set de Espíritu'),
(63, 'Especial', 'Máscara de la Deidad', 'CABEZA', 'Cueva del lago calavera', 8, 'Aumenta el ataque', 3, './imagenes/Especiales/deidad.png', 'Set de la Deidad'),
(64, 'Especial', 'Pantalón de la Deidad', 'PIERNAS', 'Cueva del árbol milenario marchito', 2, 'Aumenta el ataque', 3, './imagenes/Especiales/deidad.png', 'Set de la Deidad'),
(65, 'Especial', 'Armadura de la Deidad', 'CUERPO', 'Cueva de la cima del bastión de Akkala', 8, 'Aumenta el ataque', 3, './imagenes/Especiales/deidad.png', 'Set de la Deidad'),
(66, 'Especial', 'Pantalón de la llama', 'PIERNAS', 'Cueva de Bachin', 0, 'Aumenta el ataque con calor', 2, './imagenes/Especiales/llama.png', 'Set de la Llama'),
(67, 'Especial', 'Túnica de la llama', 'CUERPO', 'Cueva del rio Gorobin', 14, 'Aumenta el ataque con calor', 2, './imagenes/Especiales/llama.png', 'Set de la Llama'),
(68, 'Especial', 'Tocado de la llama', 'CABEZA', 'Cueva sur de Yunoo S.G.', 14, 'Aumenta el ataque con calor', 2, './imagenes/Especiales/llama.png', 'Set de la Llama'),
(69, 'Especial', 'Túnica de la ventisca', 'CUERPO', 'Cueva de las setas luminosas', 13, 'Aumenta el ataque con frio', 2, './imagenes/Especiales/ventisca.png', 'Set de la Ventisca'),
(70, 'Especial', 'Pantalón de la ventisca', 'PIERNAS', 'Cueva del manantial de Hebra', 13, 'Aumenta el ataque con frio', 2, './imagenes/Especiales/ventisca.png', 'Set de la Ventisca'),
(71, 'Especial', 'Tocado de la ventisca', 'CABEZA', 'Cueva del lago Orune', 13, 'Aumenta el ataque con frio', 2, './imagenes/Especiales/ventisca.png', 'Set de la Ventisca'),
(72, 'Especial', 'Túnica de las tinieblas', 'CUERPO', 'Tienda a cambio de Poe, en la estatua de Tabanta', 10, 'Aumenta la resistencia al aura maligna', 3, './imagenes/Especiales/tinieblas.png', 'Set de las Tinieblas'),
(73, 'Especial', 'Grebas de las tinieblas', 'PIERNAS', 'Tienda a cambio de Poe. bajo la laguna abismal, centro de Hyrule', 2, 'Aumenta la resistencia al aura maligna', 3, './imagenes/Especiales/tinieblas.png', 'Set de las Tinieblas'),
(74, 'Especial', 'Capucha de las tinieblas', 'CABEZA', 'Tienda a cambio de Poe, en el manantial de la Sabiduría ', 7, 'Aumenta la resistencia al aura maligna', 3, './imagenes/Especiales/tinieblas.png', 'Set de las Tinieblas'),
(75, 'Especial', 'Coraza de minero', 'CUERPO', 'Mina del valle Dauphness', 3, 'Luminosidad', 3, './imagenes/Especiales/minero.png', 'Set de Minero'),
(76, 'Especial', 'Máscara de minero', 'CABEZA', 'Mina abandonada de Sekken', 16, 'Luminosidad', 3, './imagenes/Especiales/minero.png', 'Set de Minero'),
(77, 'Especial', 'Pantalón de minero', 'PIERNAS', 'Mina del valle de Hylia', 16, 'Luminosidad', 3, './imagenes/Especiales/minero.png', 'Set de Minero'),
(78, 'Especial', 'Máscara de sigilo', 'CABEZA', 'Se compra en pueblo kakariko', 7, 'Aumenta el sigilo', 2, './imagenes/Especiales/sigilo.png', 'Set de Sigilo'),
(79, 'Especial', 'Túnica de sigilo', 'CUERPO', 'Se compra en pueblo kakariko', 7, 'Aumenta el sigilo', 2, './imagenes/Especiales/sigilo.png', 'Set de Sigilo'),
(80, 'Especial', 'Mallas de Sigilo', 'PIERNAS', 'Se compra en kakariko', 7, 'Aumenta el Sigilo', 2, './imagenes/Especiales/sigilo.png', 'Set de Sigilo'),
(81, 'Especial', 'Cota del espíritu maligno', 'CUERPO', 'Abismo de la isla Lomei, completando la profecia de la isla de Lomei', 8, 'Aumenta el sigilo, y con las 3 activas camuflaje y armas oseas', 4, './imagenes/Especiales/maligno.png', 'Set de Espiritu maligno'),
(82, 'Especial', 'Botas de espíritu maligno', 'PIERNAS', 'Abismo de la fortaleza de lomei norte', 8, 'Aumenta el sigilo, y con las 3 activas camuflaje y armas oseas', 4, './imagenes/Especiales/maligno.png', 'Set de Espiritu maligno'),
(83, 'Especial', 'Casco del espíritu maligno', 'CABEZA', 'Abismo de lomei sur', 8, 'Aumenta el sigilo, y con las 3 activas camuflaje y armas oseas', 4, './imagenes/Especiales/maligno.png', 'Set de Espiritu maligno'),
(84, 'Especial', 'Máscara luminosa', 'CABEZA', 'Se compra en kakariko', 7, 'aspecto visual de esqueleto por la noche', 3, './imagenes/Especiales/luminoso.png', 'Set Luminoso'),
(85, 'Especial', 'Camiseta luminosa', 'CUERPO', 'Se compra en kakariko', 7, 'aspecto visual de esqueleto por la noche', 3, './imagenes/Especiales/luminoso.png', 'Set Luminoso'),
(86, 'Especial', 'Mallas luminosas', 'PIERNAS', 'Se compra en kakariko', 7, 'aspecto visual de esqueleto por la noche', 3, './imagenes/Especiales/luminoso.png', 'Set Luminoso'),
(87, 'Especial', 'Túnica oscura', 'CUERPO', 'Estatua de Poe del fuerte vigía (150) ', 2, 'aumenta la velocidad de noche', 3, './imagenes/Especiales/oscuro.png', 'Set oscuro'),
(88, 'Especial', 'Pantalón oscuro', 'PIERNAS', 'Se compra en una estatua Poe (subsueo manantial de poder)', 8, 'aumenta la velocidad de noche', 3, './imagenes/Especiales/oscuro.png', 'Set oscuro'),
(89, 'Especial', 'Máscara oscura', 'CABEZA', 'Se compra en las estatuas Poe (bajo el manantial del valor)', 7, 'aumenta la velocidad de noche', 3, './imagenes/Especiales/oscuro.png', 'Set oscuro'),
(90, 'Especial', 'Armadura zora', 'CUERPO', 'Misión \"Reparando la armadura zora\"', 7, 'Permite nadar mas rápido', 3, './imagenes/Especiales/zora.png', 'Set Zora'),
(91, 'Especial', 'Capucha zora', 'CABEZA', 'Terminando la mision \"El sermon interminable\"', 7, 'Permite nadar mas rápido', 3, './imagenes/Especiales/zora.png', 'Set Zora'),
(92, 'Especial', 'Grebas zora', 'PIERNAS', 'Haciendo la misión \"Símbolo de la amistad\"', 0, 'Permite nadar mas rápido', 3, './imagenes/Especiales/zora.png', 'Set Zora'),
(93, 'Especial', 'Grebas de zonnanio', 'PIERNAS', 'Isla de la cantera', 20, 'aumenta la energia zonan', 4, './imagenes/Especiales/zonnanio.png', 'Set Zonnanio'),
(94, 'Especial', 'Loriga de zonnanio', 'CUERPO', 'Refinería de zonnanio', 22, 'Aumenta la energía zonan', 4, './imagenes/Especiales/zonnanio.png', 'Set Zonnanio'),
(95, 'Especial', 'Casco de zonnanio', 'CABEZA', 'Isla purificadora del mal', 17, 'Aumenta la energía zonan', 4, './imagenes/Especiales/zonnanio.png', 'Set Zonnanio'),
(96, 'Especial', 'Loriga de la centella', 'CUERPO', 'Lago Drako (tras el secreto de las ruinas anulares)', 7, 'Aumenta el ataque durante las tormentas', 3, './imagenes/Especiales/centella.png', 'Set de la Centella'),
(97, 'Especial', 'Pantalón de la centella', 'PIERNAS', 'El río Drako', 7, 'Aumenta el ataque durante las tormentas', 3, './imagenes/Especiales/centella.png', 'Set de la Centella'),
(98, 'Especial', 'Tocado de la centella', 'CABEZA', 'En el río Drako', 7, 'Aumenta el ataque durante las tormentas', 3, './imagenes/Especiales/centella.png', 'Set de la Centella'),
(99, 'Especial', 'Capucha de Ravio', 'CABEZA', 'Coliseo recondito', 7, 'Mejora el movimiento lateral al escalar', 2, './imagenes/Especiales/ravio.png', 'Capucha de Ravio'),
(100, 'Especial', 'Casco Antitrueno', 'CABEZA', 'Guarida clan Yiga (tras infiltración en el clan yiga)', 0, 'Te hace inmune a los rayos', 3, './imagenes/Especiales/trueno.png', 'Casco antitrueno'),
(101, 'Especial', 'Casco de Midna', 'CABEZA', 'Coliseo de la isla remota (subsuelo abajo derecha)', 0, 'Aumenta la resistencia al aura oscura', 7, './imagenes/Especiales/midna.png', 'Casco de Midna'),
(102, 'Especial', 'Casco de Zant', 'CABEZA', 'Coliseo abrasador', 14, 'Ser inmune a la congelación', 3, './imagenes/Especiales/zant.png', 'Casco de Zant'),
(103, 'Especial', 'Casco divino de Medoh', 'CABEZA', 'Cueva norte de la estepa de Orubell', 11, 'Defensa contra el frio', 2, './imagenes/Especiales/medoh.png', 'Casco Medoh'),
(104, 'Especial', 'Casco divino Naboris', 'CABEZA', 'Ruinas hundidas de Gerudo oeste', 16, 'Aumenta la resistencia contra el rayo', 2, './imagenes/Especiales/naboris.png', 'Casco Naboris'),
(105, 'Especial', 'Casco de Rudania', 'CABEZA', 'Madriguera de los Lagartos', 14, 'Aumenta la resistencia al fuego', 2, './imagenes/Especiales/rudania.png', 'Casco Rudania'),
(106, 'Especial', 'Casco divino Ruta', 'CABEZA', 'Cueva subterranea de los Zora', 7, 'Aumenta la velocidad al nadar', 2, './imagenes/Especiales/ruta.png', 'Casco de Ruta'),
(107, 'Especial', 'Coletero Viejo', 'CABEZA', 'Pozo casa de Zelda', 6, 'Ninguna', 0, './imagenes/Especiales/coletero.png', 'Coletero Viejo'),
(108, 'Especial', 'Máscara de bokoblin', 'CABEZA', 'Completando \"A por emblemas de Fantasmo\"', 0, 'Los bokoblin dudan en atacarte', 3, './imagenes/Especiales/bokoblin.png', 'Máscara Bokoblin'),
(109, 'Especial', 'Máscara de Moblin', 'CABEZA', 'Intercambiándola por emblemas de Fantasmo', 0, 'Los moblins dudan en atacarte', 3, './imagenes/Especiales/moblin.png', 'Máscara Moblin'),
(110, 'Especial', 'Máscara Lizalfos', 'CABEZA', 'Intercambiando emblemas de Fantasmo', 0, 'Los lizalfos dudan en atacarte', 3, './imagenes/Especiales/lizalfos.png', 'Mascara Lizalfos'),
(111, 'Especial', 'Máscara de Horroblin', 'CABEZA', 'Intercambiando por emblemas de Fantasmos', 0, 'Los horroblins dudan en atacarte', 3, './imagenes/Especiales/horroblin.png', 'Máscara Horroblin'),
(112, 'Especial', 'Máscara de Centaleon', 'CABEZA', 'Intercambiando emblemas de Fantasmos', 0, 'Los centaleones dudan en atacarte', 3, './imagenes/Especiales/centaleon.png', 'Máscara Centaleon'),
(113, 'Especial', 'Máscara de Sheik', 'CABEZA', 'Coliseo del desierto', 16, 'Aumenta el sigilo', 2, './imagenes/Especiales/sheik.png', 'Máscara de Sheik'),
(114, 'Especial', 'Máscara de Kolog', 'CABEZA', 'Coliseo Floresta', 14, 'Vibra y suena cuando hay kologs cerca', 1, './imagenes/Especiales/kolog.png', 'Máscara Kolog'),
(115, 'Especial', 'Máscara Majora', 'CABEZA', 'Coliseo flotante', 2, 'Los enemigos tardan en atacarte', 1, './imagenes/Especiales/majora.png', 'Máscara Majora'),
(116, 'Especial', 'Espíritu Heroe Ancestral', 'CUERPO', 'Tras hacer \"A la conquista de los santuarios\"', 0, 'Aspecto visual de zonan', 12, './imagenes/Especiales/ancestral.png', 'Espíritu Ancestral'),
(117, 'Especial', 'Botas de nieve', 'PIERNAS', 'Se compra en el club secreto Gerudo', 0, 'Aumenta la velocidad en la nieve', 3, './imagenes/Especiales/botas.png', 'Botas de Nieve'),
(118, 'Especial', 'Botas del desierto', 'PIERNAS', 'Se compran en el club secreto Gerudo', 0, 'Aumenta la velocidad en el desierto', 3, './imagenes/Especiales/desierto.png', 'Botas del desierto'),
(119, 'Especial', 'Diadema de Diamante', 'CABEZA', 'Se compra en la joyería de la ciudadela Gerudo tras (Riju, en la ciudadela gerudo)', 16, 'Aumenta el ataque', 4, './imagenes/Especiales/diamante.png', 'Diadema Diamante'),
(120, 'Especial', 'Pendientes de Topacio', 'CABEZA', 'Se compra en la joyería de la ciudadela gerudo tras(Riju, en la ciudadela gerudo)', 16, 'Aumenta la resistencia Eléctrica ', 3, './imagenes/Especiales/pendientes.png', 'Pendientes Topacio'),
(121, 'Especial', 'Pendientes de Ópalo ', 'CABEZA', 'Se compra en la joyería de la ciudadela gerudo tras(Riju, en la ciudadela gerudo)', 16, 'Aumenta la velocidad al nadar', 3, './imagenes/Especiales/opalo.png', 'Pendientes de Opalo'),
(122, 'Frio', 'Botas forradas arcaicas', 'PIERNAS', 'Cueva nordeste del santuario Gutanabaq', 1, 'Resistencia al frio', 2, './imagenes/frio/botas.png', 'Botas forradas Arcaicas'),
(123, 'Frio', 'Plumas orni', 'CABEZA', 'Tienda en el poblado orni', 10, 'Aumenta la resistencia al frio', 3, './imagenes/frio/orni.png', 'Set Orni'),
(124, 'Frio', 'Túnica orni', 'CUERPO', 'Tienda en el poblado orni', 10, 'Aumenta la resistencia al frio', 3, './imagenes/frio/orni.png', 'Set Orni'),
(125, 'Frio', 'Pantalones orni', 'PIERNAS', 'Tienda en el poblado orni', 10, 'Aumenta la resistencia al frio', 3, './imagenes/frio/orni.png', 'Set Orni'),
(126, 'Frio', 'Diadema Rubí', 'CABEZA', 'Se compra en la ciudadela Gerudo, tras (Riju, en la ciudadela Gerudo)', 16, 'Aumenta la resistencia al frio', 4, './imagenes/frio/diadema.webp', 'Diadema rubí'),
(127, 'Calor', 'Camiseta de langosta', 'CUERPO', 'Aldea Onaona', 6, 'Resistencia al calor', 1, './imagenes/calor/langosta.png', 'Camiseta langosta'),
(128, 'Calor', 'Grebas Ignifugas', 'PIERNAS', 'Tienda de armaduras de ciudad Goron', 14, 'Aumenta la resistencia al calor', 3, './imagenes/calor/ignifugo.png', 'Set Ignifugo'),
(129, 'Calor', 'Armadura Ignifuga', 'CUERPO', 'Tienda de armaduras de ciudad Goron', 14, 'Aumenta la resistencia al calor', 3, './imagenes/calor/ignifugo.png', 'Set Ignifugo'),
(130, 'Calor', 'Casco Ignifugo', 'CABEZA', 'Tienda de armaduras de ciudad Goron', 14, 'Aumenta la resistencia al calor', 14, './imagenes/calor/ignifugo.png', 'Set Ignifugo'),
(131, 'Calor', 'Coletero del desierto', 'CABEZA', 'Bazar Sekken', 16, 'Aumenta la resistencia al calor', 3, './imagenes/calor/desierto.png', 'Set del Desierto'),
(132, 'Calor', 'Hombrera del desierto', 'CUERPO', 'Club secreto Gerudo', 16, 'Aumenta la resistencia al calor', 3, './imagenes/calor/desierto.png', 'Set del Desierto'),
(133, 'Calor', 'Grebas del Desierto', 'PIERNAS', 'Club secreto Gerudo', 16, 'Aumenta la resistencia al calor', 3, './imagenes/calor/desierto.png', 'Set del Desierto'),
(134, 'Calor', 'Diadema Zafiro ', 'CABEZA', 'Joyería ciudadela Gerudo (Riju, en la ciudadela gerudo)', 16, 'Aumenta la resistencia al calor', 4, './imagenes/calor/diadema.webp', 'Diadema Zafiro'),
(135, 'Normal', 'Pantalones del Crepusculo', 'PIERNAS', 'Minas Akkala (subsuelo)', 8, 'Ninguna', 3, './imagenes/Ropajes/tunicaCrepusculo.png', 'Set del Crepúsculo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `santuarios`
--

CREATE TABLE `santuarios` (
  `COD_SANTUARIO` int NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `COD_REGION` int NOT NULL,
  `GUIA` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `santuarios`
--

INSERT INTO `santuarios` (`COD_SANTUARIO`, `NOMBRE`, `COD_REGION`, `GUIA`) VALUES
(1, 'Uqo\'u', 1, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/uqou'),
(2, 'Inisa', 1, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/santuario-de-inisa'),
(3, 'Gutanabaq', 1, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/gutanabaq'),
(4, 'Nasio\'aia', 1, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/nasioaia'),
(5, 'Qiononi\'su', 2, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qiononisu'),
(6, 'Se\'paa', 2, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/sepaa'),
(7, 'Oiami', 2, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/oiami'),
(8, 'Ios\'ini', 2, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/iosini'),
(9, 'usuai', 2, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/susuai'),
(10, 'Iso\'dag', 2, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/iosini'),
(11, 'Serut\'ab', 2, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/serutab'),
(12, 'Maia\'tinou', 3, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maiatinou'),
(13, 'Sutu\'um', 3, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/sutuum'),
(14, 'Riog\'oq', 3, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/riogoq'),
(15, 'Usat\'sum.', 3, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/usatsum'),
(16, 'Sonapanio', 3, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/sonapanio'),
(17, 'Taraoq\'un', 3, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/taraoqun'),
(18, 'Qamiz\'una', 3, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qamizuna'),
(19, 'Qio\'quon', 3, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qioquon'),
(20, 'Teni\'iten', 3, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/teniiten'),
(21, 'Taiqa\'su', 3, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/taiqasu'),
(22, 'Muronoq', 4, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/muronoq'),
(23, 'Io\'nasaw', 4, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/ionasaw'),
(24, 'Suq\'aroqu', 4, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/suqaroqu'),
(25, 'Ren\'ise', 4, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/renise'),
(26, 'Maqasur', 4, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maqasur'),
(27, 'O\'ogin', 4, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/oogin'),
(28, 'Es\'hosie', 4, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/eshosie'),
(29, 'Ilion\'iu', 4, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/ilioniu'),
(30, 'Qura\'qat', 4, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/quraqat'),
(31, 'Sus\'ubi', 5, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/susubi'),
(32, 'Iu\'quom', 5, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/iuquom'),
(33, 'En\'oma', 5, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/enoma'),
(34, 'Utus\'oq', 5, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/utusoq'),
(35, 'Iso\'qin', 5, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/isoqin'),
(36, 'Ioun\'u', 5, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/iounu'),
(37, 'Utoi\'si', 5, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/utoisi'),
(38, 'Toqi\'uo', 6, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/toqiuo'),
(39, 'Si\'umim', 6, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/siumim'),
(40, 'Bamitoq', 6, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/bamitoq'),
(41, 'Marari\'in', 6, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/marariin'),
(42, 'Ioqis\'iu', 6, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/ioqisiu'),
(43, 'Iogo\'u', 7, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/iogou'),
(44, 'Saquus', 7, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/saquus'),
(45, 'Sanmiqa', 7, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/sanmiqa'),
(46, 'Iqaisen', 7, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/iaqisen'),
(47, 'Maia\'his', 7, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maiahis'),
(48, 'Anedamiq', 7, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/anedamiq'),
(49, 'Iomis\'uqi', 7, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/iomisuqi'),
(50, 'Ig\'asuq', 8, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/igasuq'),
(51, 'Rasi\'uaq', 8, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/rasiuaq'),
(52, 'Ioqi\'ui', 8, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/ioqiui'),
(53, 'Sinat\'aq', 8, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/sinataq'),
(54, 'Gemimiq', 8, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/gemimiq'),
(55, 'Ioqi\'ga', 8, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/ioqga'),
(56, 'Maia\'tiden', 8, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maiatiden'),
(57, 'Domizu\'in', 8, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/domizuin'),
(58, 'Qamat\'uqis', 8, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qamatuqis'),
(59, 'Maia\'oqo', 9, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maiaoqo'),
(60, 'Minetaq', 9, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/minetaq'),
(61, 'Qiqaun', 9, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qiqaun'),
(62, 'Tenma\'at', 9, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/tenmaat'),
(63, 'Siqu\'qusi', 9, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/siququsi'),
(64, 'Musanoq\'ir', 9, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/musanoqir'),
(65, 'Nin\'isi', 9, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/santuario-de-ninisi'),
(66, 'Pup\'uqe', 9, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/pupuqe'),
(67, 'Sequ\'nom', 9, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/sequnom'),
(68, 'Osioza\'un', 10, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/osoizaun'),
(69, 'Maia\'otaq', 10, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maiaotaq'),
(70, 'Maia\'usiu', 10, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maiausiu'),
(71, 'Orosium', 10, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/orosium'),
(72, 'Nouda', 10, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/nouda'),
(73, 'Taqi\'iaba', 11, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/santuario-de-taqiiaba'),
(74, 'Qiol\'iou', 11, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qioliou'),
(75, 'Sinaq\'awa', 11, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/sinaqawa'),
(76, 'Maqu\'ur', 11, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maquur'),
(77, 'Iun\'oroq', 11, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/iunoroq'),
(78, 'Run\'aqit', 11, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/runaqit'),
(79, 'Oromu\'aq', 11, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/oromuaq'),
(80, 'Iqataq', 11, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/iqataq'),
(81, 'Sur\'aqau', 12, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/suraqau'),
(82, 'Gaasia', 12, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/gaasia'),
(83, 'Rotsum\'um', 12, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/rotsumum'),
(84, 'Otusu\'um', 12, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/otusuum'),
(85, 'Maia\'masun', 12, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maiamasun'),
(86, 'Ota\'aq', 13, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/otaaq'),
(87, 'Tauio\'siun', 13, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/tauiosiun'),
(88, 'Wao\'sa', 13, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/waosa'),
(89, 'Gataqis', 13, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/gataqis'),
(90, 'Eu\'toum', 13, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/eutoum'),
(91, 'Rutahu\'me', 13, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/rutahume'),
(92, 'Sa\'iroua', 13, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/sairoua'),
(93, 'Sis\'uran', 13, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/sisuran'),
(94, 'Qima\'iat', 14, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qimaiat'),
(95, 'Momo\'siq', 14, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/momosiq'),
(96, 'Siba\'iataq', 14, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/sibaiataq'),
(97, 'Iot\'aq', 14, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/iotaq'),
(98, 'Maraqu\'ti', 14, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maraquti'),
(99, 'Sisu\'moi', 14, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/sisumoi'),
(100, 'Mosiap', 14, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/mosiap'),
(101, 'Qisin\'on', 14, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qisinon'),
(102, 'Eqotiu', 14, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/eqotiu'),
(103, 'Timauaq', 14, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/timauq'),
(104, 'Isi\'ime', 14, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/isiime'),
(105, 'Rasitaqi\'u', 15, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/rasitaqiu'),
(106, 'Gatanisi', 15, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/gatanisi'),
(107, 'Apog\'eq', 15, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/apogeq'),
(108, 'Ioniu', 15, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/ioniu'),
(109, 'Mog\'awaq', 15, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/mogawaq'),
(110, 'Ihena', 15, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/ihena'),
(111, 'Maoiesuq', 15, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maoiesuq'),
(112, 'Suari\'auq', 16, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/suariauq'),
(113, 'Raquda\'it', 16, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/raqudait'),
(114, 'Qitaw\'aq', 16, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qitawaq'),
(115, 'Mosutis', 16, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/mosutis'),
(116, 'Siuaq\'am', 16, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/siuaqam'),
(117, 'Tiqumau', 16, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/tiqumau'),
(118, 'Qaratag', 16, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qaratag'),
(119, 'Irasuq', 16, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/irasuq'),
(120, 'Miriotaniq', 16, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/miriotaniq'),
(121, 'Qudani\'sar', 16, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qudanisar'),
(122, 'Soriotan', 16, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/soriotan'),
(123, 'Maia\'taat', 16, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maiataat'),
(124, 'Sur\'aqami', 16, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/suraqami'),
(125, 'Qa\'atanau', 17, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qaatanau'),
(126, 'Maia\'umeq', 17, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maiaumeq'),
(127, 'Tanin\'ou', 17, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/taninou'),
(128, 'Teneb\'esai', 17, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/tenebesai'),
(129, 'Iyo\'o', 17, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/santuario-de-iyoo'),
(130, 'Taun\'ilo', 17, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/taunilo'),
(131, 'Ga\'ahis', 17, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/gaahis'),
(132, 'Ganoza', 17, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/ganoza'),
(133, 'Maia\'am', 18, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maiaam'),
(134, 'Simosi\'uaq', 18, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/simosiuaq'),
(135, 'Qadaunir', 19, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qadaunir'),
(136, 'Mogisar', 20, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/mogisar'),
(137, 'Guia\'un', 20, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/guiaun'),
(138, 'Nataq\'aq', 20, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/nataqaq'),
(139, 'Igoso\'on', 20, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/igosoon'),
(140, 'Iruta\'um', 21, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/irutaum'),
(141, 'Si\'aiou', 21, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/siaiou'),
(142, 'Maia\'nat', 21, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maianat'),
(143, 'Io\'xiu', 22, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/ioxiu'),
(144, 'Uqo\'isi', 22, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/uqoisi'),
(145, 'Ianasamin', 22, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/ianasamin'),
(146, 'Qumain', 22, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/qumain'),
(147, 'Ioqu\'u', 23, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/ioquu'),
(148, 'Ioqu\'sin', 23, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/ioqusin'),
(149, 'Siamo\'susi', 24, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/siamosusi'),
(150, 'Raqasi\'o', 24, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/raqasio'),
(151, 'Inodoaq', 24, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/inodoaq'),
(152, 'Maia\'siara', 24, 'https://vandal.elespanol.com/guias/guia-the-legend-of-zelda-tears-of-the-kingdom-trucos-consejos-y-secretos/maiasiara');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Correo` varchar(40) NOT NULL,
  `Contraseña` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Correo`, `Contraseña`) VALUES
('jes11989@hotmail.com', '$2y$10$aLYCep3oO7GBSQ4eQtVuqOdW9Xp4od0JaGCQHz60GbYgyspQzgaKu');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `completados`
--
ALTER TABLE `completados`
  ADD PRIMARY KEY (`Correo`,`COD_SANTUARIO`);

--
-- Indices de la tabla `posee`
--
ALTER TABLE `posee`
  ADD PRIMARY KEY (`CORREO`,`COD_ROPA`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`COD_REGION`);

--
-- Indices de la tabla `registradas`
--
ALTER TABLE `registradas`
  ADD PRIMARY KEY (`CORREO`,`COD_REGION`);

--
-- Indices de la tabla `ropas`
--
ALTER TABLE `ropas`
  ADD PRIMARY KEY (`COD_ROPA`);

--
-- Indices de la tabla `santuarios`
--
ALTER TABLE `santuarios`
  ADD PRIMARY KEY (`COD_SANTUARIO`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Correo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
