/*
Navicat MySQL Data Transfer

Source Server         : 本地mysal
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : wxchat

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2020-07-26 22:12:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `account` varchar(100) NOT NULL COMMENT '账号',
  `pwd` varchar(100) NOT NULL COMMENT '密码',
  `nickname` varchar(100) NOT NULL COMMENT '昵称',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `sex` int(1) DEFAULT NULL COMMENT '性别 1 男 0 女',
  `birth` date DEFAULT NULL COMMENT '出生日期',
  `online` varchar(20) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`account`),
  KEY `index_user` (`account`,`pwd`,`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

