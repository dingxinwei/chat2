/*
Navicat MySQL Data Transfer

Source Server         : 本地mysal
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : wxchat

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2020-07-26 22:12:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_friend`
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend` (
  `account` varchar(50) NOT NULL COMMENT '用户账号',
  `faccount` varchar(50) NOT NULL COMMENT '好友账号',
  `notes` varchar(50) DEFAULT NULL COMMENT '好友备注',
  PRIMARY KEY (`account`,`faccount`),
  KEY `faccount` (`faccount`),
  KEY `index_friends` (`account`,`faccount`),
  CONSTRAINT `t_friend_ibfk_1` FOREIGN KEY (`faccount`) REFERENCES `t_user` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

