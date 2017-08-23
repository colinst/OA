/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : oa

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 23/08/2017 17:16:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id`   INT(255)                   NOT NULL,
  `account`   VARCHAR(255)
              CHARACTER SET utf8mb4
              COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` VARCHAR(255)
              CHARACTER SET utf8mb4
              COLLATE utf8mb4_general_ci NOT NULL,
  `password`  VARCHAR(255)
              CHARACTER SET utf8mb4
              COLLATE utf8mb4_general_ci NOT NULL,
  `dep`       VARCHAR(255)
              CHARACTER SET utf8mb4
              COLLATE utf8mb4_general_ci NOT NULL,
  `role`      INT(3)                     NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
