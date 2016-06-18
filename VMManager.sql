/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : vmmanager

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2012-04-18 10:40:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('8', 'echo', '1106');
INSERT INTO `admin` VALUES ('10', 'root', 'root');
INSERT INTO `admin` VALUES ('11', 'joshua', '145612');
INSERT INTO `admin` VALUES ('12', 'admin', 'admin');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `COMPANY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMPANY_NAME` varchar(255) NOT NULL,
  `COMPANY_SIZE` int(11) DEFAULT NULL,
  `COMPANY_LOCATION` varchar(255) DEFAULT NULL,
  `COMPANY_POSTCODE` varchar(255) DEFAULT NULL,
  `COMPANY_TELPHONE` varchar(255) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) DEFAULT NULL,
  `CONTACT_TELPHONE` varchar(255) DEFAULT NULL,
  `CONTACT_EMAIL` varchar(255) DEFAULT NULL,
  `CONTACT_DEPARTMENT` varchar(255) DEFAULT NULL,
  `CONTACT_TITLE` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `FLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`COMPANY_ID`),
  KEY `FK24217FDE8B22E5C3` (`COMPANY_SIZE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '绿蒙科技有限公司', '1', '北京市海淀区', '100083', '010-6239-9482', '汪正康', '13401174165', 'zhengkang504@126.com', '研发', '职员', 'joshua', '145612', '0');
INSERT INTO `customer` VALUES ('2', '巨人网络', '2', '北京市朝阳区', '100190', '010-6239-9437', '张三', '13401165994', 'han200608@126.com', '销售', '职员', 'echo', '1106', '0');
INSERT INTO `customer` VALUES ('3', '盛世科技有限公司', '3', '上海市浦东去', '242073', '053-9834-8732', '李四', '13801134567', 'lisi@gmail.com', '技术支持', '经理', 'lisi', '123456', '0');

-- ----------------------------
-- Table structure for `instance`
-- ----------------------------
DROP TABLE IF EXISTS `instance`;
CREATE TABLE `instance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `HOST_SIZE` varchar(255) DEFAULT NULL,
  `HOST_OS` varchar(255) DEFAULT NULL,
  `PAY_METHOD` varchar(255) DEFAULT NULL,
  `TIME_USED` varchar(255) DEFAULT NULL,
  `INSTANCE_IP` varchar(255) DEFAULT NULL,
  `INSTANCE_ID` varchar(255) DEFAULT NULL,
  `INSTANCE_STATE` varchar(255) DEFAULT NULL,
  `FLAG` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `COMPANY_ID` (`CUSTOMER_ID`),
  CONSTRAINT `COMPANY_ID` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`COMPANY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instance
-- ----------------------------
INSERT INTO `instance` VALUES ('36', '2', 'Large', 'CenterOS', '按月计费', '2012-05-18', null, null, '待审核', '0');
INSERT INTO `instance` VALUES ('37', '2', 'Medium', 'Ubuntu', '按季度计费', '2012-07-18', null, null, '待审核', '0');

-- ----------------------------
-- Table structure for `instance_log`
-- ----------------------------
DROP TABLE IF EXISTS `instance_log`;
CREATE TABLE `instance_log` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `INSTANCE_ID` varchar(255) NOT NULL,
  `OP_TYPE` int(10) NOT NULL,
  `OP_TIME` datetime NOT NULL,
  `AUTHOR_TYPE` int(2) NOT NULL,
  `AUTHOR_ID` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instance_log
-- ----------------------------
