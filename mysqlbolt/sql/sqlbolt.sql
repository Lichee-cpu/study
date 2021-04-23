/*
 Navicat Premium Data Transfer

 Source Server         : phpstydy
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : sqlbolt

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 23/04/2021 19:22:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for boxoffice
-- ----------------------------
DROP TABLE IF EXISTS `boxoffice`;
CREATE TABLE `boxoffice`  (
  `Movie_id` int(11) NOT NULL,
  `Rating` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Domestic_sales` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `International_sales` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Movie_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of boxoffice
-- ----------------------------
INSERT INTO `boxoffice` VALUES (5, '8.2', '380843261', '555900000');
INSERT INTO `boxoffice` VALUES (14, '7.4', '268492764', '475066843');
INSERT INTO `boxoffice` VALUES (8, '8', '206445654', '417277164');
INSERT INTO `boxoffice` VALUES (12, '6.4', '191452396', '368400000');
INSERT INTO `boxoffice` VALUES (3, '7.9', '245852179', '239163000');
INSERT INTO `boxoffice` VALUES (6, '8', '261441092', '370001000');
INSERT INTO `boxoffice` VALUES (9, '8.5', '223808164', '297503696');
INSERT INTO `boxoffice` VALUES (11, '8.4', '415004880', '648167031');
INSERT INTO `boxoffice` VALUES (1, '8.3', '191796233', '170162503');
INSERT INTO `boxoffice` VALUES (7, '7.2', '244082982', '217900167');
INSERT INTO `boxoffice` VALUES (10, '8.3', '293004164', '438338580');
INSERT INTO `boxoffice` VALUES (4, '8.1', '289916256', '272900000');
INSERT INTO `boxoffice` VALUES (2, '7.2', '162798565', '200600000');
INSERT INTO `boxoffice` VALUES (13, '7.2', '237283207', '301700000');
INSERT INTO `boxoffice` VALUES (15, '8.7', '340000000', '270000000');

-- ----------------------------
-- Table structure for buildings
-- ----------------------------
DROP TABLE IF EXISTS `buildings`;
CREATE TABLE `buildings`  (
  `Building_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Capacity` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buildings
-- ----------------------------
INSERT INTO `buildings` VALUES ('1e', '24');
INSERT INTO `buildings` VALUES ('1w', '32');
INSERT INTO `buildings` VALUES ('2e', '16');
INSERT INTO `buildings` VALUES ('2w', '20');

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `Role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Building` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Years_employed` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES ('Engineer	Yancy I.		0\r\nArtist	Oliver P.		0', 'Becky A.', '1e', '4');
INSERT INTO `employees` VALUES ('Engineer', 'Dan B.', '1e', '2');
INSERT INTO `employees` VALUES ('Engineer', 'Sharon F.', '1e', '6');
INSERT INTO `employees` VALUES ('Engineer', 'Dan M.', '1e', '4');
INSERT INTO `employees` VALUES ('Engineer', 'Malcom S.', '1e', '1');
INSERT INTO `employees` VALUES ('Artist', 'Tylar S.', '2w', '2');
INSERT INTO `employees` VALUES ('Artist', 'Sherman D.', '2w', '8');
INSERT INTO `employees` VALUES ('Artist', 'Jakob J.', '2w', '6');
INSERT INTO `employees` VALUES ('Artist', 'Lillia A.', '2w', '7');
INSERT INTO `employees` VALUES ('Artist', 'Brandon J.', '2w', '7');
INSERT INTO `employees` VALUES ('Manager', 'Scott K.', '1e', '9');
INSERT INTO `employees` VALUES ('Manager', 'Shirlee M.', '1e', '3');
INSERT INTO `employees` VALUES ('Manager', 'Daria O.', '2w', '6');
INSERT INTO `employees` VALUES ('Engineer', 'Yancy I.', NULL, '	0');
INSERT INTO `employees` VALUES ('Artist', 'Oliver P.', NULL, '0');

-- ----------------------------
-- Table structure for movies
-- ----------------------------
DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `Director` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '导演',
  `Year` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Length_minutes` double NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movies
-- ----------------------------
INSERT INTO `movies` VALUES (1, 'Toy Story', 'John Lasseter', '1995', 81);
INSERT INTO `movies` VALUES (2, 'A Bug\'s Life', 'John Lasseter', '1998', 95);
INSERT INTO `movies` VALUES (3, 'Toy Story 2', 'John Lasseter', '1999', 93);
INSERT INTO `movies` VALUES (4, 'Monsters, Inc.', 'Pete Docter', '2001', 92);
INSERT INTO `movies` VALUES (5, 'Finding Nemo', 'Andrew Stanton', '2003', 107);
INSERT INTO `movies` VALUES (6, 'The Incredibles', 'Brad Bird', '2004', 116);
INSERT INTO `movies` VALUES (7, 'Cars', 'John Lasseter', '2006', 117);
INSERT INTO `movies` VALUES (8, 'Ratatouille', 'Brad Bird', '2007', 115);
INSERT INTO `movies` VALUES (9, 'WALL-E', 'Andrew Stanton', '2008', 104);
INSERT INTO `movies` VALUES (10, 'Up', 'Pete Docter', '2009', 101);
INSERT INTO `movies` VALUES (11, 'Toy Story 3', 'Lee Unkrich', '2010', 103);
INSERT INTO `movies` VALUES (12, 'Cars 2', 'John Lasseter', '2011', 120);
INSERT INTO `movies` VALUES (13, 'Brave', 'Brenda Chapman', '2012', 102);
INSERT INTO `movies` VALUES (14, 'Monsters University', 'Dan Scanlon', '2013', 110);
INSERT INTO `movies` VALUES (87, 'WALL-G', 'Brenda Chapman', '2042', 97);
INSERT INTO `movies` VALUES (88, 'Toy Story 4', 'Lance Lafontaine', '2021', 168);
INSERT INTO `movies` VALUES (89, 'Toy Story 4', 'Lance Lafontaine', '2021', 168);

-- ----------------------------
-- Table structure for north_american_cities
-- ----------------------------
DROP TABLE IF EXISTS `north_american_cities`;
CREATE TABLE `north_american_cities`  (
  `City` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Country` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Population` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of north_american_cities
-- ----------------------------
INSERT INTO `north_american_cities` VALUES ('Guadalajara', 'Mexico', '1500800', '20.659699', '-103.349609');
INSERT INTO `north_american_cities` VALUES ('Toronto', 'Canada', '2795060', '43.653226', '-79.383184');
INSERT INTO `north_american_cities` VALUES ('Houston', 'United States', '2195914', '29.760427', '-95.369803');
INSERT INTO `north_american_cities` VALUES ('New York', 'United States', '8405837', '40.712784', '-74.005941');
INSERT INTO `north_american_cities` VALUES ('Philadelphia', 'United States', '1553165', '39.952584', '-75.165222');
INSERT INTO `north_american_cities` VALUES ('Havana', 'Cuba', '2106146', '23.05407', '-82.345189');
INSERT INTO `north_american_cities` VALUES ('Mexico City', 'Mexico', '8555500', '19.432608', '-99.133208');
INSERT INTO `north_american_cities` VALUES ('Phoenix', 'United States', '1513367', '33.448377', '-112.074037');
INSERT INTO `north_american_cities` VALUES ('Los Angeles', 'United States', '3884307', '34.052234', '-118.243685');
INSERT INTO `north_american_cities` VALUES ('Ecatepec de Morelos', 'Mexico', '1742000', '19.601841', '-99.050674');
INSERT INTO `north_american_cities` VALUES ('Montreal', 'Canada', '1717767', '45.501689', '-73.567256');
INSERT INTO `north_american_cities` VALUES ('Chicago', 'United States', '2718782', '41.878114', '-87.629798');

SET FOREIGN_KEY_CHECKS = 1;
