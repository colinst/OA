/*
Navicat MySQL Data Transfer

Source Server         : mysql80
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2018-05-21 01:17:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for assessment
-- ----------------------------
DROP TABLE IF EXISTS `assessment`;
CREATE TABLE `assessment` (
  `assessmentid` int(255) NOT NULL,
  `assessmentname` varchar(255) NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`assessmentid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assessment
-- ----------------------------

-- ----------------------------
-- Table structure for column
-- ----------------------------
DROP TABLE IF EXISTS `column`;
CREATE TABLE `column` (
  `columnid` int(255) NOT NULL AUTO_INCREMENT,
  `columnname` varchar(255) NOT NULL,
  PRIMARY KEY (`columnid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of column
-- ----------------------------

-- ----------------------------
-- Table structure for count
-- ----------------------------
DROP TABLE IF EXISTS `count`;
CREATE TABLE `count` (
  `assessmentid` int(255) NOT NULL,
  `userid` int(255) NOT NULL,
  `columnid` int(255) NOT NULL,
  `count` int(255) DEFAULT NULL,
  PRIMARY KEY (`assessmentid`,`userid`,`columnid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of count
-- ----------------------------

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `model_Id` int(20) NOT NULL AUTO_INCREMENT,
  `model_Name` varchar(20) DEFAULT NULL,
  `create_User_Id` int(20) DEFAULT NULL,
  `createtime` varchar(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`model_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('8', '高通订单统计', '1', '2018-05-21 00:12:49', null);

-- ----------------------------
-- Table structure for model_column
-- ----------------------------
DROP TABLE IF EXISTS `model_column`;
CREATE TABLE `model_column` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `column_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of model_column
-- ----------------------------
INSERT INTO `model_column` VALUES ('8', '1');

-- ----------------------------
-- Table structure for model_column_name
-- ----------------------------
DROP TABLE IF EXISTS `model_column_name`;
CREATE TABLE `model_column_name` (
  `column_Id` int(11) NOT NULL AUTO_INCREMENT,
  `column_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`column_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of model_column_name
-- ----------------------------
INSERT INTO `model_column_name` VALUES ('1', '魅族');

-- ----------------------------
-- Table structure for stat
-- ----------------------------
DROP TABLE IF EXISTS `stat`;
CREATE TABLE `stat` (
  `stat_id` int(20) NOT NULL AUTO_INCREMENT,
  `stat_name` varchar(20) DEFAULT NULL,
  `user_id` int(20) DEFAULT NULL,
  `create_user_id` int(20) DEFAULT NULL,
  `createtime` varchar(20) DEFAULT NULL,
  `type` int(20) DEFAULT NULL,
  PRIMARY KEY (`stat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of stat
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `account` varchar(20) DEFAULT '',
  `password` varchar(20) DEFAULT '',
  `user_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT '',
  `dep` varchar(20) DEFAULT '',
  `role` int(20) DEFAULT NULL,
  `number` varchar(20) DEFAULT '',
  `group_id` int(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('colin', '123123', '1', '郭', 'admin', '0', '', null, null);
INSERT INTO `sys_user` VALUES ('ac1001', '123', '3', '陈', 'admin', '0', '12345678900', null, 'ac1001@qq.com');
INSERT INTO `sys_user` VALUES ('ac1002', '123', '1000', '方', 'admin', '0', '', null, null);

-- ----------------------------
-- Table structure for tablemodel
-- ----------------------------
DROP TABLE IF EXISTS `tablemodel`;
CREATE TABLE `tablemodel` (
  `assessmentid` int(255) NOT NULL,
  `columnid` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tablemodel
-- ----------------------------

-- ----------------------------
-- Table structure for tableusermodel
-- ----------------------------
DROP TABLE IF EXISTS `tableusermodel`;
CREATE TABLE `tableusermodel` (
  `assessmentid` int(255) NOT NULL,
  `userid` int(255) NOT NULL,
  `type` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tableusermodel
-- ----------------------------

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `col2` varchar(20) DEFAULT NULL,
  `col3` float DEFAULT NULL,
  `col4` timestamp NULL DEFAULT NULL,
  `col5` varchar(200) DEFAULT NULL,
  `col6` varchar(200) DEFAULT NULL,
  `col7` varchar(200) DEFAULT NULL,
  `col8` varchar(200) DEFAULT NULL,
  `col9` varchar(200) DEFAULT NULL,
  `col10` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(255) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dep` varchar(255) NOT NULL,
  `role` int(3) NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for 高通订单一期
-- ----------------------------
DROP TABLE IF EXISTS `高通订单一期`;
CREATE TABLE `高通订单一期` (
  `厂家编号` int(11) DEFAULT NULL,
  `厂家名称` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of 高通订单一期
-- ----------------------------
DROP TRIGGER IF EXISTS `user_insert_774684005`;
DELIMITER ;;
CREATE TRIGGER `user_insert_774684005` AFTER INSERT ON `user` FOR EACH ROW BEGIN declare ti_serviceid varchar(100);declare ti_typeid varchar(100);set ti_serviceid='1dabf069-a1b4-46f7-9320-fcbed9be4959';select MsgTypeId into ti_typeid from BCG_MsgType where MsgTypeName = 'GOODS_1dabf069-a1b4-46f7-9320-fcbed9be4959_insert';select MsgServiceId into ti_serviceid from BCG_MsgService where MsgServiceName = 'GOODS_1dabf069-a1b4-46f7-9320-fcbed9be4959';insert BCG_Msg (MsgServiceId, MsgTypeId,MsgQueuedAt, MsgStatus,MsgDeliveredAt, MsgFailedText,OperationType, MsgParam1)values (ti_serviceid, ti_typeid, CURRENT_TIMESTAMP, 'NEW', NULL, NULL,'insert',NEW.userid);set ti_serviceid='1dabf069-a1b4-46f7-9320-fcbed9be4959';end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `user_update_835089582`;
DELIMITER ;;
CREATE TRIGGER `user_update_835089582` AFTER UPDATE ON `user` FOR EACH ROW BEGIN declare ti_serviceid varchar(100);declare ti_typeid varchar(100);set ti_serviceid='1dabf069-a1b4-46f7-9320-fcbed9be4959';select MsgTypeId into ti_typeid from BCG_MsgType where MsgTypeName = 'GOODS_1dabf069-a1b4-46f7-9320-fcbed9be4959_update';select MsgServiceId into ti_serviceid from BCG_MsgService where MsgServiceName = 'GOODS_1dabf069-a1b4-46f7-9320-fcbed9be4959';insert BCG_Msg (MsgServiceId, MsgTypeId,MsgQueuedAt, MsgStatus,MsgDeliveredAt, MsgFailedText,OperationType, MsgParam1)values (ti_serviceid, ti_typeid, CURRENT_TIMESTAMP, 'NEW', NULL, NULL,'update',NEW.userid);set ti_serviceid='1dabf069-a1b4-46f7-9320-fcbed9be4959';end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `user_delete_691001119`;
DELIMITER ;;
CREATE TRIGGER `user_delete_691001119` AFTER DELETE ON `user` FOR EACH ROW BEGIN declare ti_serviceid varchar(100);declare ti_typeid varchar(100);set ti_serviceid='1dabf069-a1b4-46f7-9320-fcbed9be4959';select MsgTypeId into ti_typeid from BCG_MsgType where MsgTypeName = 'GOODS_1dabf069-a1b4-46f7-9320-fcbed9be4959_delete';select MsgServiceId into ti_serviceid from BCG_MsgService where MsgServiceName = 'GOODS_1dabf069-a1b4-46f7-9320-fcbed9be4959';insert BCG_Msg (MsgServiceId, MsgTypeId,MsgQueuedAt, MsgStatus,MsgDeliveredAt, MsgFailedText,OperationType, MsgParam1)values (ti_serviceid, ti_typeid, CURRENT_TIMESTAMP, 'NEW', NULL, NULL,'delete',OLD.userid);set ti_serviceid='1dabf069-a1b4-46f7-9320-fcbed9be4959';end
;;
DELIMITER ;
