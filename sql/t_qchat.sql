/*
Navicat MySQL Data Transfer

Source Server         : 本地mysal
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : wxchat

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2020-07-26 22:12:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_qchat`
-- ----------------------------
DROP TABLE IF EXISTS `t_qchat`;
CREATE TABLE `t_qchat` (
  `qname` varchar(50) NOT NULL COMMENT '群名',
  `qaccount` varchar(50) NOT NULL COMMENT '群成员账号',
  `qnote` varchar(50) DEFAULT NULL,
  `qflag` int(2) NOT NULL COMMENT '群成员标识 0 群主 1 群成员',
  `qnickname` varchar(50) DEFAULT NULL COMMENT '成员昵称',
  PRIMARY KEY (`qaccount`,`qname`),
  KEY `index_qchat` (`qname`,`qaccount`,`qnickname`),
  CONSTRAINT `qacc` FOREIGN KEY (`qaccount`) REFERENCES `t_user` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
