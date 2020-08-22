/*
Navicat MySQL Data Transfer

Source Server         : 本地mysal
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : wxchat

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2020-07-26 22:12:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_msgcache`
-- ----------------------------
DROP TABLE IF EXISTS `t_msgcache`;
CREATE TABLE `t_msgcache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_account` varchar(100) NOT NULL,
  `receive_account` varchar(100) NOT NULL,
  `message` varchar(200) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_msgcache` (`send_account`,`receive_account`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
