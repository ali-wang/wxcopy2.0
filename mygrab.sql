/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mygrab

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-11-16 17:26:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `allshow`
-- ----------------------------
DROP TABLE IF EXISTS `allshow`;
CREATE TABLE `allshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `souword` varchar(255) DEFAULT NULL,
  `copy_content` varchar(255) DEFAULT NULL,
  `sourceType` varchar(255) DEFAULT NULL,
  `equipment` varchar(255) DEFAULT NULL COMMENT '设备',
  `user_type` tinyint(4) DEFAULT NULL,
  `user_ip` varchar(100) DEFAULT NULL,
  `utm_medium` varchar(255) DEFAULT NULL,
  `utm_content` varchar(255) DEFAULT NULL,
  `utm_term` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `sign_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1766 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allshow
-- ----------------------------

-- ----------------------------
-- Table structure for `wxshow`
-- ----------------------------
DROP TABLE IF EXISTS `wxshow`;
CREATE TABLE `wxshow` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `wsouword` varchar(255) DEFAULT NULL,
  `wsign_id` varchar(255) DEFAULT NULL,
  `wlocation` varchar(255) DEFAULT NULL,
  `wtime` varchar(255) DEFAULT NULL,
  `wutm_medium` varchar(255) DEFAULT NULL,
  `wutm_content` varchar(255) DEFAULT NULL,
  `wutm_term` varchar(255) DEFAULT NULL,
  `wuser_ip` varchar(20) NOT NULL COMMENT '用户ip',
  PRIMARY KEY (`wid`)
) ENGINE=MyISAM AUTO_INCREMENT=18298 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wxshow
-- ----------------------------
INSERT INTO `wxshow` VALUES ('18296', '', '2', 'http://ther68.tyjiahe.cn/indexbak.html', '1572402498', '', '', '', '123.139.161.232');
INSERT INTO `wxshow` VALUES ('18297', '', '2', 'http://ther68.tyjiahe.cn/indexbak.html', '1572402701', '', '', '', '14.205.78.36');
