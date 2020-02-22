/*
 Navicat Premium Data Transfer

 Source Server         : DevEnvMariaDB
 Source Server Type    : MariaDB
 Source Server Version : 100411
 Source Host           : 192.168.56.102:3306
 Source Schema         : wmsdb

 Target Server Type    : MariaDB
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 22/02/2020 13:34:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for facilities
-- ----------------------------
DROP TABLE IF EXISTS `facilities`;
CREATE TABLE `facilities`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Status` bit(1) NULL DEFAULT b'1',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of facilities
-- ----------------------------
INSERT INTO `facilities` VALUES (1, 'CAV 2', b'1');
INSERT INTO `facilities` VALUES (2, 'CAV 3', b'1');
INSERT INTO `facilities` VALUES (3, 'IPAI 2', b'1');
INSERT INTO `facilities` VALUES (4, 'IPAI 3', b'1');

-- ----------------------------
-- Table structure for spm_hub_inventory
-- ----------------------------
DROP TABLE IF EXISTS `spm_hub_inventory`;
CREATE TABLE `spm_hub_inventory`  (
  `ItemId` int(11) NOT NULL AUTO_INCREMENT,
  `PartNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `StockOnHand` int(10) NOT NULL,
  `LastUpdate` datetime(0) NOT NULL,
  PRIMARY KEY (`ItemId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spm_hub_inventory
-- ----------------------------
INSERT INTO `spm_hub_inventory` VALUES (1, '871-0128A', 150, '2020-02-21 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (2, '871-0253', 180, '2020-02-22 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (3, '871-0284', 160, '2020-02-22 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (4, '871-0368B', 170, '2020-02-20 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (5, '871-0489B', 35, '2020-02-19 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (6, '871-0716B', 100, '2020-02-19 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (7, '871-100024B-BASE', 30, '2020-02-03 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (8, '871-100024B-COVER', 30, '2020-02-03 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (9, '871-100068', 520, '2020-02-03 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (10, '871-100069', 30, '2020-02-03 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (11, '871-100677A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (12, '871-100089', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (13, '871-100090', 100, '2020-01-27 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (14, '871-100092', 200, '2020-01-27 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (15, '871-100093', 150, '2020-01-27 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (16, '871-100099A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (17, '871-100103', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (18, '871-100240A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (19, '871-100241', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (20, '871-1023A-001', 50, '2020-02-04 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (21, '871-100678A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (22, '871-100727', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (23, '871-100779', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (24, '871-100954', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (25, '871-100956 SET', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (26, '871-100982A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (27, '871-101096', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (28, '871-101364', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (29, '871-101365', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (30, '871-101366', 500, '2020-01-29 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (31, '871-101462A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (32, '871-101858', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (33, '871-101860A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (34, '871-1028', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (35, '871-1093', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (36, '871-102762', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (37, '871-1304A-002', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (38, '871-1304B-001', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (39, '871-1605A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (40, '871-1731A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (41, '871-1778B', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (42, '871-1842A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (43, '871-1842A-002', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (44, '871-1944B', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (45, '871-1944B-004', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (46, '871-1944B-005', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (47, '871-1944B-006', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (48, '871-1936A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (49, '871-1946C', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (50, '871-1946C-003', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (51, '871-2099C', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (52, '871-2108B', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (53, '871-2109A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (54, '871-2128A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (55, '871-2162B', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (56, '871-2162B-001', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (57, '871-2194C', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (58, '871-2205B', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (59, '871-22150', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (60, '871-22151', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (61, '871-2241D-002', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (62, '871-2241D-006', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (63, '871-2386A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (64, '871-2387A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (65, '871-2426', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (66, '871-2466C', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (67, '871-2688A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (68, '871-2689A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (69, '871-2748A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (70, '871-2894B', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (71, '871-3092A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (72, '871-3186A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (73, '871-3294', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (74, '871-3297', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (75, '871-3326', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (76, '871-3393', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (77, '871-3578', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (78, '871-3737', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (79, '871-3775', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (80, '871-3776', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (81, '871-3777', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (82, '871-3781A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (83, '871-3781', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (84, '871-3781A-002', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (85, '871-3782A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (86, '871-3784', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (87, '871-3816B-002', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (88, '871-3816B-003', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (89, '871-3816B-009', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (90, '871-3816B-010', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (91, '871-3816B-014', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (92, '871-3816B-016', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (93, '871-3816B-017', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (94, '871-3936A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (95, '871-3937A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (96, '871-3942A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (97, '871-4095', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (98, '871-4322B', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (99, '871-4334A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (100, '871-4335A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (101, '871-4347A', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (102, '871-4460 CAP', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (103, '871-4460 PAD', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (104, '871-4460 SLEEVE', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (105, '871-4473B', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (106, '871-4479B', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (107, '871-4592', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (108, '871-4606', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (109, '871-4659', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (110, '871-4666C', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (111, '871-4675C', 0, '2020-01-15 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (112, '871-7315', 0, '2020-02-01 00:00:00');
INSERT INTO `spm_hub_inventory` VALUES (113, '871-9584', 0, '2020-02-04 00:00:00');

-- ----------------------------
-- Table structure for spm_inbound_inventory
-- ----------------------------
DROP TABLE IF EXISTS `spm_inbound_inventory`;
CREATE TABLE `spm_inbound_inventory`  (
  `InboundId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ArNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DateIn` datetime(0) NOT NULL,
  `LogDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`InboundId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spm_inbound_inventory
-- ----------------------------
INSERT INTO `spm_inbound_inventory` VALUES ('1', '874512', '2020-01-14 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('10', '999999', '2020-01-22 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('11', '754861', '2020-01-27 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('12', '8745146', '2020-01-29 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('13', '7541246', '2020-01-29 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('14', '896541', '2020-02-01 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('15', '874512', '2020-02-03 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('16', '745842', '2020-02-03 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('17', '845974', '2020-02-03 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('18', '978454', '2020-02-03 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('19', '879546', '2020-02-03 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('2', '896512', '2020-01-14 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('20', '879548', '2020-02-03 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('21', '896548', '2020-02-03 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('22', '895468', '2020-02-03 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('23', '798545', '2020-02-04 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('24', '1235459', '2020-02-21 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('3', '987451', '2020-01-14 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('4', '985614', '2020-01-14 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('5', '123456', '2020-01-14 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('6', '654785', '2020-01-14 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('7', '147852', '2020-01-14 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('8', '547842', '2020-01-15 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('9', '965475', '2020-01-21 00:00:00', NULL);
INSERT INTO `spm_inbound_inventory` VALUES ('f325ef7a-52ef-11ea-8f27-080027d59683', '1542654', '2020-02-22 00:00:00', '2020-02-22 11:13:38');

-- ----------------------------
-- Table structure for spm_inbound_inventory_item
-- ----------------------------
DROP TABLE IF EXISTS `spm_inbound_inventory_item`;
CREATE TABLE `spm_inbound_inventory_item`  (
  `InboundItemId` int(11) NOT NULL AUTO_INCREMENT,
  `ItemID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `InboundId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`InboundItemId`) USING BTREE,
  INDEX `ItemId`(`ItemID`) USING BTREE,
  INDEX `InboundId`(`InboundId`) USING BTREE,
  CONSTRAINT `ItemId` FOREIGN KEY (`ItemID`) REFERENCES `spm_hub_inventory` (`ItemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spm_inbound_inventory_item
-- ----------------------------
INSERT INTO `spm_inbound_inventory_item` VALUES (1, 1, 10, '1');
INSERT INTO `spm_inbound_inventory_item` VALUES (2, 2, 20, '1');
INSERT INTO `spm_inbound_inventory_item` VALUES (3, 2, 50, '3');
INSERT INTO `spm_inbound_inventory_item` VALUES (4, 4, 100, '3');
INSERT INTO `spm_inbound_inventory_item` VALUES (5, 1, 50, '4');
INSERT INTO `spm_inbound_inventory_item` VALUES (6, 4, 100, '4');
INSERT INTO `spm_inbound_inventory_item` VALUES (7, 1, 10, '5');
INSERT INTO `spm_inbound_inventory_item` VALUES (8, 4, 55, '5');
INSERT INTO `spm_inbound_inventory_item` VALUES (9, 3, 50, '6');
INSERT INTO `spm_inbound_inventory_item` VALUES (10, 3, 30, '7');
INSERT INTO `spm_inbound_inventory_item` VALUES (11, 2, 50, '8');
INSERT INTO `spm_inbound_inventory_item` VALUES (12, 2, 20, '9');
INSERT INTO `spm_inbound_inventory_item` VALUES (13, 9, 200, '10');
INSERT INTO `spm_inbound_inventory_item` VALUES (14, 13, 100, '11');
INSERT INTO `spm_inbound_inventory_item` VALUES (15, 14, 200, '11');
INSERT INTO `spm_inbound_inventory_item` VALUES (16, 15, 150, '11');
INSERT INTO `spm_inbound_inventory_item` VALUES (17, 30, 500, '12');
INSERT INTO `spm_inbound_inventory_item` VALUES (18, 9, 300, '13');
INSERT INTO `spm_inbound_inventory_item` VALUES (19, 5, 50, '14');
INSERT INTO `spm_inbound_inventory_item` VALUES (20, 6, 100, '14');
INSERT INTO `spm_inbound_inventory_item` VALUES (21, 1, 20, '15');
INSERT INTO `spm_inbound_inventory_item` VALUES (22, 2, 50, '16');
INSERT INTO `spm_inbound_inventory_item` VALUES (23, 3, 20, '17');
INSERT INTO `spm_inbound_inventory_item` VALUES (24, 4, 50, '18');
INSERT INTO `spm_inbound_inventory_item` VALUES (25, 5, 10, '19');
INSERT INTO `spm_inbound_inventory_item` VALUES (26, 6, 20, '20');
INSERT INTO `spm_inbound_inventory_item` VALUES (27, 7, 30, '21');
INSERT INTO `spm_inbound_inventory_item` VALUES (28, 8, 30, '21');
INSERT INTO `spm_inbound_inventory_item` VALUES (29, 9, 20, '22');
INSERT INTO `spm_inbound_inventory_item` VALUES (30, 10, 30, '22');
INSERT INTO `spm_inbound_inventory_item` VALUES (31, 20, 50, '23');
INSERT INTO `spm_inbound_inventory_item` VALUES (32, 1, 100, '24');
INSERT INTO `spm_inbound_inventory_item` VALUES (33, 2, 100, 'f325ef7a-52ef-11ea-8f27-080027d59683');
INSERT INTO `spm_inbound_inventory_item` VALUES (34, 3, 100, 'f325ef7a-52ef-11ea-8f27-080027d59683');

-- ----------------------------
-- Table structure for spm_outbound_inventory
-- ----------------------------
DROP TABLE IF EXISTS `spm_outbound_inventory`;
CREATE TABLE `spm_outbound_inventory`  (
  `OutboundId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FacilityID` int(11) NOT NULL,
  `WmDrNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DateOut` date NOT NULL,
  `VehicleId` int(11) NOT NULL,
  `LogDate` datetime(0) NOT NULL,
  `ControlSeries` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Status` bit(1) NULL DEFAULT b'1',
  PRIMARY KEY (`OutboundId`) USING BTREE,
  INDEX `VehicleID`(`VehicleId`) USING BTREE,
  INDEX `FacilityID`(`FacilityID`) USING BTREE,
  CONSTRAINT `FacilityID` FOREIGN KEY (`FacilityID`) REFERENCES `facilities` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `VehicleID` FOREIGN KEY (`VehicleId`) REFERENCES `vehicles` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spm_outbound_inventory
-- ----------------------------
INSERT INTO `spm_outbound_inventory` VALUES ('07331093-511c-11ea-8f27-080027d59683', 1, '20', '2020-02-19', 1, '2020-02-19 20:23:20', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('07f4149d-510c-11ea-8f27-080027d59683', 3, '16', '2020-02-19', 2, '2020-02-19 18:28:49', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('0972743a-511f-11ea-8f27-080027d59683', 1, '27', '2020-02-19', 1, '2020-02-19 20:44:52', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('0a45f46f-51f2-11ea-8f27-080027d59683', 1, '3', '2020-02-20', 3, '2020-02-21 04:53:08', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('1f35f9e1-511c-11ea-8f27-080027d59683', 1, '21', '2020-02-19', 1, '2020-02-19 20:24:00', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('209dfbe4-510c-11ea-8f27-080027d59683', 1, '17', '2020-02-19', 1, '2020-02-19 18:29:30', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('311d54dc-511e-11ea-8f27-080027d59683', 1, '26', '2020-02-19', 1, '2020-02-19 20:38:49', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('42d96e6e-510c-11ea-8f27-080027d59683', 1, '18', '2020-02-19', 1, '2020-02-19 18:30:28', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('54b6a278-511c-11ea-8f27-080027d59683', 1, '22', '2020-02-19', 1, '2020-02-19 20:25:30', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('5f807542-44c7-11ea-ad56-b42e9914bd0f', 1, '14', '2020-02-01', 1, '2020-02-01 15:49:30', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('611a1bbc-51d5-11ea-8f27-080027d59683', 1, '2', '2020-02-20', 1, '2020-02-21 01:27:58', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('6c5e1933-511d-11ea-8f27-080027d59683', 1, '24', '2020-02-19', 1, '2020-02-19 20:33:19', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('741091bb-510b-11ea-8f27-080027d59683', 1, '15', '2020-02-19', 1, '2020-02-19 18:24:41', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('908face6-511d-11ea-8f27-080027d59683', 1, '25', '2020-02-19', 1, '2020-02-19 20:34:20', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('95f3e52d-511b-11ea-8f27-080027d59683', 1, '19', '2020-02-19', 1, '2020-02-19 20:20:10', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('d446e330-511c-11ea-8f27-080027d59683', 1, '23', '2020-02-19', 1, '2020-02-19 20:29:04', '2020-02', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('d50449c2-4317-11ea-8e61-b42e9914bd0f', 1, '12', '2020-01-30', 1, '2020-01-30 12:20:22', '2020-01', b'1');
INSERT INTO `spm_outbound_inventory` VALUES ('eb7c06ee-4318-11ea-8e61-b42e9914bd0f', 1, '13', '2020-01-30', 1, '2020-01-30 12:28:09', '2020-01', b'1');

-- ----------------------------
-- Table structure for spm_outbound_inventory_apcdr
-- ----------------------------
DROP TABLE IF EXISTS `spm_outbound_inventory_apcdr`;
CREATE TABLE `spm_outbound_inventory_apcdr`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ApcDrNo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OutboundId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `OutboundId_FK`(`OutboundId`) USING BTREE,
  CONSTRAINT `OutboundId_FK` FOREIGN KEY (`OutboundId`) REFERENCES `spm_outbound_inventory` (`OutboundId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spm_outbound_inventory_apcdr
-- ----------------------------
INSERT INTO `spm_outbound_inventory_apcdr` VALUES (1, '845167', '611a1bbc-51d5-11ea-8f27-080027d59683');
INSERT INTO `spm_outbound_inventory_apcdr` VALUES (2, '845168', '611a1bbc-51d5-11ea-8f27-080027d59683');
INSERT INTO `spm_outbound_inventory_apcdr` VALUES (3, '874569', '0a45f46f-51f2-11ea-8f27-080027d59683');

-- ----------------------------
-- Table structure for spm_outbound_inventory_item
-- ----------------------------
DROP TABLE IF EXISTS `spm_outbound_inventory_item`;
CREATE TABLE `spm_outbound_inventory_item`  (
  `OutboundItemId` int(11) NOT NULL AUTO_INCREMENT,
  `ItemID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `OutboundId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Remarks` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PoNumber` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`OutboundItemId`) USING BTREE,
  INDEX `ItemID`(`ItemID`) USING BTREE,
  INDEX `OutboundID`(`OutboundId`) USING BTREE,
  CONSTRAINT `outboundid` FOREIGN KEY (`OutboundId`) REFERENCES `spm_outbound_inventory` (`OutboundId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `spm_outbound_inventory_item_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `spm_hub_inventory` (`ItemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spm_outbound_inventory_item
-- ----------------------------
INSERT INTO `spm_outbound_inventory_item` VALUES (1, 1, 5, 'd50449c2-4317-11ea-8e61-b42e9914bd0f', NULL, NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (2, 2, 5, 'd50449c2-4317-11ea-8e61-b42e9914bd0f', NULL, NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (3, 3, 5, 'eb7c06ee-4318-11ea-8e61-b42e9914bd0f', NULL, NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (4, 4, 5, 'eb7c06ee-4318-11ea-8e61-b42e9914bd0f', NULL, NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (5, 5, 5, '5f807542-44c7-11ea-ad56-b42e9914bd0f', NULL, NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (6, 6, 5, '5f807542-44c7-11ea-ad56-b42e9914bd0f', NULL, NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (7, 1, 4, '741091bb-510b-11ea-8f27-080027d59683', '', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (8, 2, 20, '07f4149d-510c-11ea-8f27-080027d59683', '', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (9, 3, 23, '209dfbe4-510c-11ea-8f27-080027d59683', '', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (10, 3, 5, '42d96e6e-510c-11ea-8f27-080027d59683', '', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (11, 1, 10, '95f3e52d-511b-11ea-8f27-080027d59683', '', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (12, 4, 10, '07331093-511c-11ea-8f27-080027d59683', '', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (13, 5, 5, '1f35f9e1-511c-11ea-8f27-080027d59683', '', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (14, 4, 5, '54b6a278-511c-11ea-8f27-080027d59683', '', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (15, 2, 5, 'd446e330-511c-11ea-8f27-080027d59683', '', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (16, 6, 5, '6c5e1933-511d-11ea-8f27-080027d59683', '', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (17, 5, 10, '908face6-511d-11ea-8f27-080027d59683', '', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (18, 6, 10, '311d54dc-511e-11ea-8f27-080027d59683', '', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (19, 4, 5, '0972743a-511f-11ea-8f27-080027d59683', 'this remarks', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (20, 5, 5, '0972743a-511f-11ea-8f27-080027d59683', NULL, NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (21, 1, 10, '611a1bbc-51d5-11ea-8f27-080027d59683', NULL, NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (22, 2, 5, '611a1bbc-51d5-11ea-8f27-080027d59683', NULL, NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (23, 3, 7, '0a45f46f-51f2-11ea-8f27-080027d59683', 'Pickup', NULL);
INSERT INTO `spm_outbound_inventory_item` VALUES (24, 4, 10, '0a45f46f-51f2-11ea-8f27-080027d59683', NULL, NULL);

-- ----------------------------
-- Table structure for user_accounts
-- ----------------------------
DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE `user_accounts`  (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MiddleName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LastName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UserID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PlateNo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remarks` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Status` bit(1) NULL DEFAULT b'1',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vehicles
-- ----------------------------
INSERT INTO `vehicles` VALUES (1, 'Close Van', 'UCK923', NULL, b'1');
INSERT INTO `vehicles` VALUES (2, 'L300', 'AAN6066', NULL, b'1');
INSERT INTO `vehicles` VALUES (3, 'Others', 'Others', NULL, b'1');

-- ----------------------------
-- Table structure for wmdrcontrol
-- ----------------------------
DROP TABLE IF EXISTS `wmdrcontrol`;
CREATE TABLE `wmdrcontrol`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Value` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wmdrcontrol
-- ----------------------------
INSERT INTO `wmdrcontrol` VALUES (1, 'spmwmdr', 3);

-- ----------------------------
-- Procedure structure for AddSpmHubInventoryItem
-- ----------------------------
DROP PROCEDURE IF EXISTS `AddSpmHubInventoryItem`;
delimiter ;;
CREATE PROCEDURE `AddSpmHubInventoryItem`(IN `_partNo` VARCHAR(50), IN `_lastUpdate` DATETIME)
BEGIN

INSERT INTO spm_hub_inventory(PartNo, LastUpdate) VALUES (_partNo, _lastUpdate);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AddSpmInboundInventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `AddSpmInboundInventory`;
delimiter ;;
CREATE PROCEDURE `AddSpmInboundInventory`(IN `itemcode` VARCHAR(50), IN `itemqty` INT(11), IN `spmArNo` VARCHAR(50), IN `itemDateIn` DATE)
BEGIN
declare _itemId INT(11);
declare _inboundItemLastID INT(11);
declare _StockOnHand INT(10);

SELECT ItemId into _itemId from spm_hub_inventory WHERE PartNo = itemcode;

INSERT INTO spm_inbound_inventory_item(ItemID,Qty) VALUES (_itemId,itemqty);
SET _inboundItemLastID = last_insert_id();

INSERT INTO spm_inbound_inventory(ArNo, DateIn, InboundItemId) VALUES (spmArNo,itemDateIn,_inboundItemLastID);

SELECT StockOnHand into _StockOnHand from spm_hub_inventory WHERE PartNo = itemcode; 
SET _StockOnHand = _StockOnHand + itemqty;

UPDATE spm_hub_inventory SET StockOnHand = _StockOnHand WHERE ItemId = _itemId;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetAllPartNo
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetAllPartNo`;
delimiter ;;
CREATE PROCEDURE `GetAllPartNo`()
BEGIN
SELECT ItemId,PartNo FROM spm_hub_inventory;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetNextIdSpmInboundInventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetNextIdSpmInboundInventory`;
delimiter ;;
CREATE PROCEDURE `GetNextIdSpmInboundInventory`()
BEGIN

SELECT AUTO_INCREMENT 
FROM information_schema.tables
WHERE table_name = 'spm_inbound_inventory'
     and table_schema = database();

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetSpmHubInventoryItemCount
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetSpmHubInventoryItemCount`;
delimiter ;;
CREATE PROCEDURE `GetSpmHubInventoryItemCount`()
BEGIN

SELECT
Sum(spm_hub_inventory.StockOnHand) AS StockCount,
COUNT(spm_hub_inventory.ItemID) AS ItemCount
FROM
spm_hub_inventory;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetSpmHubInventoryRandomInventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetSpmHubInventoryRandomInventory`;
delimiter ;;
CREATE PROCEDURE `GetSpmHubInventoryRandomInventory`(IN `_limit` INT(10))
BEGIN
SELECT PartNo,StockOnHand FROM spm_hub_inventory WHERE StockOnHand > 0 ORDER BY RAND() LIMIT _limit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetSpmInboundInventoryCount
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetSpmInboundInventoryCount`;
delimiter ;;
CREATE PROCEDURE `GetSpmInboundInventoryCount`()
BEGIN

SELECT
COUNT(InboundId) as ItemCount
FROM spm_inbound_inventory;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetSpmInboundInventoryViewDetails
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetSpmInboundInventoryViewDetails`;
delimiter ;;
CREATE PROCEDURE `GetSpmInboundInventoryViewDetails`(IN `_Inboundid` INT(10))
BEGIN

SELECT
spm_inbound_inventory.InboundId,
spm_inbound_inventory.ArNo,
spm_inbound_inventory.DateIn,
spm_hub_inventory.PartNo,
spm_inbound_inventory_item.Qty
FROM
spm_inbound_inventory
INNER JOIN spm_inbound_inventory_item ON spm_inbound_inventory_item.InboundId = spm_inbound_inventory.InboundId
INNER JOIN spm_hub_inventory ON spm_inbound_inventory_item.ItemID = spm_hub_inventory.ItemId
WHERE
spm_inbound_inventory.InboundId = _Inboundid;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetSpmOutboundInventoryCount
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetSpmOutboundInventoryCount`;
delimiter ;;
CREATE PROCEDURE `GetSpmOutboundInventoryCount`()
BEGIN

SELECT
COUNT(spm_outbound_inventory.OutboundId) AS ItemCount
FROM
spm_outbound_inventory;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetSpmOutboundInventoryViewDetails
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetSpmOutboundInventoryViewDetails`;
delimiter ;;
CREATE PROCEDURE `GetSpmOutboundInventoryViewDetails`(IN `_outboundId` VARCHAR(36))
BEGIN

SELECT
spm_outbound_inventory.OutboundId,
spm_outbound_inventory.WmDrNo,
spm_outbound_inventory.DateOut,
spm_outbound_inventory.ControlSeries,
vehicles.PlateNo AS `Vehicle`,
facilities.`Name` AS `Facility`
FROM
spm_outbound_inventory
INNER JOIN vehicles ON spm_outbound_inventory.VehicleId = vehicles.Id
INNER JOIN facilities ON spm_outbound_inventory.FacilityID = facilities.Id
WHERE
spm_outbound_inventory.OutboundId = _outboundId;

SELECT
spm_outbound_inventory_item.Qty,
spm_outbound_inventory_item.PoNumber,
spm_outbound_inventory_item.Remarks,
spm_hub_inventory.PartNo
FROM
spm_outbound_inventory
INNER JOIN spm_outbound_inventory_item ON spm_outbound_inventory_item.OutboundId = spm_outbound_inventory.OutboundId
INNER JOIN spm_hub_inventory ON spm_outbound_inventory_item.ItemID = spm_hub_inventory.ItemId
WHERE
spm_outbound_inventory.OutboundId = _outboundId;

SELECT
spm_outbound_inventory_apcdr.ApcDrNo
FROM
spm_outbound_inventory
INNER JOIN spm_outbound_inventory_apcdr ON spm_outbound_inventory_apcdr.OutboundId = spm_outbound_inventory.OutboundId
WHERE
spm_outbound_inventory.OutboundId = _outboundId;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for new_procedure
-- ----------------------------
DROP PROCEDURE IF EXISTS `new_procedure`;
delimiter ;;
CREATE PROCEDURE `new_procedure`(IN _outboundId VARCHAR(36))
BEGIN

SELECT
spm_outbound_inventory.OutboundId,
spm_outbound_inventory.WmDrNo,
spm_outbound_inventory.DateOut,
spm_outbound_inventory.ControlSeries,
vehicles.PlateNo,
facilities.`Name`
FROM
spm_outbound_inventory
INNER JOIN vehicles ON spm_outbound_inventory.VehicleId = vehicles.Id
INNER JOIN facilities ON spm_outbound_inventory.FacilityID = facilities.Id
WHERE
spm_outbound_inventory.OutboundId = _outboundId;

SELECT
spm_outbound_inventory_item.Qty,
spm_outbound_inventory_item.PoNumber,
spm_outbound_inventory_item.Remarks,
spm_hub_inventory.PartNo
FROM
spm_outbound_inventory
INNER JOIN spm_outbound_inventory_item ON spm_outbound_inventory_item.OutboundId = spm_outbound_inventory.OutboundId
INNER JOIN spm_hub_inventory ON spm_outbound_inventory_item.ItemID = spm_hub_inventory.ItemId
WHERE
spm_outbound_inventory.OutboundId = _outboundId;

SELECT
spm_outbound_inventory_apcdr.ApcDrNo
FROM
spm_outbound_inventory
INNER JOIN spm_outbound_inventory_apcdr ON spm_outbound_inventory_apcdr.OutboundId = spm_outbound_inventory.OutboundId
WHERE
spm_outbound_inventory.OutboundId = _outboundId;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchSpmHubInventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchSpmHubInventory`;
delimiter ;;
CREATE PROCEDURE `SearchSpmHubInventory`(IN `searchItem` VARCHAR(50))
BEGIN

SELECT
*
FROM
spm_hub_inventory
WHERE
spm_hub_inventory.PartNo LIKE CONCAT('%',searchItem,'%');

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchSpmInboundInventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchSpmInboundInventory`;
delimiter ;;
CREATE PROCEDURE `SearchSpmInboundInventory`(IN `searchItem` VARCHAR(50))
BEGIN

SELECT
*
FROM
spm_inbound_inventory
WHERE
spm_inbound_inventory.ArNo LIKE CONCAT('%',searchItem,'%');

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchSpmOutboundInventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchSpmOutboundInventory`;
delimiter ;;
CREATE PROCEDURE `SearchSpmOutboundInventory`(IN `searchItem` VARCHAR(50))
BEGIN

SELECT
*
FROM
spm_outbound_inventory
WHERE
spm_outbound_inventory.ApcDrNo LIKE CONCAT('%',searchItem,'%');

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ViewAllSpmHubInventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `ViewAllSpmHubInventory`;
delimiter ;;
CREATE PROCEDURE `ViewAllSpmHubInventory`(IN `_offSet` INT(50), IN `_limit` INT(50))
BEGIN
	SELECT
	*
	FROM
	spm_hub_inventory
    LIMIT _offSet, _limit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ViewAllSpmInboundInventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `ViewAllSpmInboundInventory`;
delimiter ;;
CREATE PROCEDURE `ViewAllSpmInboundInventory`(IN `_offSet` INT(50), IN `_limit` INT(50))
BEGIN
	select
    *
    from spm_inbound_inventory
    order by InboundId desc
    limit _offSet, _limit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ViewAllSpmOutboundInventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `ViewAllSpmOutboundInventory`;
delimiter ;;
CREATE PROCEDURE `ViewAllSpmOutboundInventory`(IN `_offSet` INT(50), IN `_limit` INT(50))
BEGIN
	select
    *
    from spm_outbound_inventory
    order by LogDate desc
    limit _offSet, _limit;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
