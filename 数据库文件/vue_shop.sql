/*
Navicat MySQL Data Transfer

Source Server         : shop
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : vue_shop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2022-01-09 21:32:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for finance
-- ----------------------------
DROP TABLE IF EXISTS `finance`;
CREATE TABLE `finance` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sales` int(11) NOT NULL COMMENT '销售额',
  `date` varchar(50) NOT NULL COMMENT '日期',
  `PhoneNumber` varchar(20) DEFAULT '0' COMMENT '会员号',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of finance
-- ----------------------------
INSERT INTO `finance` VALUES ('1', '10', '2022-01-01', '0');
INSERT INTO `finance` VALUES ('2', '10', '2022-02-01', '0');
INSERT INTO `finance` VALUES ('3', '10', '2022-02-11', '0');
INSERT INTO `finance` VALUES ('4', '1', '2022-01-09 18:04:39', '18279256100');
INSERT INTO `finance` VALUES ('5', '1', '2022-01-09 18:08:48', '0');
INSERT INTO `finance` VALUES ('6', '50', '2022-01-09 18:09:36', '18279256100');
INSERT INTO `finance` VALUES ('7', '50', '2022-01-09 18:09:36', '0');
INSERT INTO `finance` VALUES ('8', '1', '2022-01-09 18:10:55', '18279256100');
INSERT INTO `finance` VALUES ('9', '1', '2022-01-09 18:10:55', '0');
INSERT INTO `finance` VALUES ('10', '1', '2022-01-09 18:11:11', '0');
INSERT INTO `finance` VALUES ('11', '1', '2022-01-09 18:15:23', '18279256100');
INSERT INTO `finance` VALUES ('12', '1', '2022-01-09 18:15:48', '0');
INSERT INTO `finance` VALUES ('13', '21240', '2022-01-01', '0');
INSERT INTO `finance` VALUES ('14', '18380', '2022-02-01', '0');
INSERT INTO `finance` VALUES ('15', '19520', '2022-03-01', '0');
INSERT INTO `finance` VALUES ('16', '18650', '2022-04-01', '0');
INSERT INTO `finance` VALUES ('17', '17320', '2022-05-01', '0');
INSERT INTO `finance` VALUES ('18', '16170', '2022-06-01', '0');
INSERT INTO `finance` VALUES ('19', '13300', '2022-07-01', '0');
INSERT INTO `finance` VALUES ('20', '19500', '2022-08-01', '0');
INSERT INTO `finance` VALUES ('21', '19900', '2022-09-01', '0');
INSERT INTO `finance` VALUES ('22', '17300', '2022-10-01', '0');
INSERT INTO `finance` VALUES ('23', '13570', '2022-11-01', '0');
INSERT INTO `finance` VALUES ('24', '13700', '2022-12-01', '0');
INSERT INTO `finance` VALUES ('25', '1', '2022-01-09 20:36:38', '18279256100');
INSERT INTO `finance` VALUES ('26', '1', '2022-01-09 20:37:35', '18279256100');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `MemberID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员ID',
  `MemberName` varchar(10) NOT NULL COMMENT '会员姓名',
  `Sex` varchar(5) NOT NULL COMMENT '会员性别',
  `Address` varchar(50) NOT NULL COMMENT '会员地址',
  `PhoneNumber` varchar(20) NOT NULL COMMENT '会员电话，会员号',
  `MenberGrade` varchar(10) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `Integral` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `Consumption` int(11) NOT NULL DEFAULT '0' COMMENT '消费金额',
  `RecordDate` varchar(50) NOT NULL DEFAULT '0' COMMENT '注册日期',
  PRIMARY KEY (`MemberID`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('18', '张三', '男', '江西省南昌市', '18279256100', '5', '117920', '11792', '2022-01-07 15:00:25');
INSERT INTO `member` VALUES ('19', '李四', '男', '江西省南昌市', '18279256101', '1', '1000', '100', '2022-01-07 15:00:52');
INSERT INTO `member` VALUES ('20', '王五', '男', '江西省南昌市', '18279256102', '0', '0', '0', '2022-01-07 15:00:55');
INSERT INTO `member` VALUES ('21', '赵六', '男', '江西省南昌市', '18279256103', '0', '0', '0', '2022-01-07 15:00:57');
INSERT INTO `member` VALUES ('22', '麻子', '男', '江西省南昌市', '18279256104', '0', '0', '0', '2022-01-07 15:01:00');
INSERT INTO `member` VALUES ('23', '张三', '男', '江西省南昌市', '18279256105', '0', '0', '0', '2022-01-07 15:01:04');
INSERT INTO `member` VALUES ('24', '张三', '男', '江西省南昌市', '18279256106', '0', '0', '0', '2022-01-07 15:01:07');
INSERT INTO `member` VALUES ('25', '张三', '男', '江西省南昌市', '18279256107', '0', '0', '0', '2022-01-07 15:01:09');
INSERT INTO `member` VALUES ('26', '张三', '男', '江西省南昌市', '18279256108', '0', '0', '0', '2022-01-07 15:01:12');
INSERT INTO `member` VALUES ('27', '张三', '男', '江西省南昌市', '18279256109', '0', '0', '0', '2022-01-07 15:01:14');
INSERT INTO `member` VALUES ('28', '张三', '男', '江西省南昌市', '18279256110', '0', '0', '0', '2022-01-07 15:01:19');
INSERT INTO `member` VALUES ('29', '张三', '男', '江西省南昌市', '18279256111', '0', '0', '0', '2022-01-07 15:01:22');
INSERT INTO `member` VALUES ('30', '张三', '男', '江西省南昌市', '18279256112', '0', '0', '0', '2022-01-07 15:01:24');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ProductID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `ProductName` varchar(30) NOT NULL COMMENT '商品名称',
  `Brand` varchar(20) NOT NULL COMMENT '商品品牌',
  `Class` varchar(20) NOT NULL COMMENT '商品类别',
  `Specification` varchar(50) NOT NULL COMMENT '商品规格',
  `ShelfLife` varchar(10) NOT NULL COMMENT '保质期',
  `ExpiryDate` varchar(50) NOT NULL DEFAULT '0' COMMENT '过期日期',
  `PurchasingPrice` decimal(10,2) NOT NULL COMMENT '进价',
  `SellingPrice` decimal(10,2) NOT NULL COMMENT '售价',
  `Inventory` int(10) unsigned NOT NULL COMMENT '库存',
  `Selling` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '出售数量',
  PRIMARY KEY (`ProductID`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('10', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '110570', '82');
INSERT INTO `product` VALUES ('11', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '100450', '54');
INSERT INTO `product` VALUES ('12', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '100370', '30');
INSERT INTO `product` VALUES ('13', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '695110', '1030');
INSERT INTO `product` VALUES ('14', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '80', '120');
INSERT INTO `product` VALUES ('15', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-01-01', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('16', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-02-01', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('17', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-04-01', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('18', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('19', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('20', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('21', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('22', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('23', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('24', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('25', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('26', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('27', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('28', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('29', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('30', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('31', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('32', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('33', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('34', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('35', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('36', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('37', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('38', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('39', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('40', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('41', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('42', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('43', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('44', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('45', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('46', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('47', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('48', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('49', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('50', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('51', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('52', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('53', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('54', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('55', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('56', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('57', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('58', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('59', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('60', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('61', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('62', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('63', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('64', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('65', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('66', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('67', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('68', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('69', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('70', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('71', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('72', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('73', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('74', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('75', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('76', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('77', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('78', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('79', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('80', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('81', '心相印面巾纸', '心相印', '生活用品', '132mm x 190mm', '24个月', '2022-11-11', '1.00', '5.00', '400', '0');
INSERT INTO `product` VALUES ('82', '益达口香糖', '益达', '食品', '56g', '12个月', '2022-11-11', '3.00', '5.00', '300', '0');
INSERT INTO `product` VALUES ('83', '好丽友派', '好丽友', '食品', '204g', '8个月', '2022-09-09', '5.00', '10.00', '200', '0');
INSERT INTO `product` VALUES ('84', '小苏打牙膏', '纳美', '生活用品', '120g', '24个月', '2023-10-10', '6.00', '15.00', '200', '0');
INSERT INTO `product` VALUES ('85', '今麦郎矿泉水\'\'', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('86', '\'今麦郎矿泉水\'', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('87', '魔方', '奇艺', '文娱', '三阶', '5', '0000-00-00', '9.00', '20.00', '100', '0');
INSERT INTO `product` VALUES ('88', '魔方', '奇艺', '文娱', '三阶', '5', '2027-01-01', '9.00', '20.00', '100', '0');
INSERT INTO `product` VALUES ('89', '魔方', '奇艺', '文娱', '三阶', '5', '2027-01-01', '9.00', '20.00', '100', '0');
INSERT INTO `product` VALUES ('90', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '100', '0');
INSERT INTO `product` VALUES ('91', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('92', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('93', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '100', '0');
INSERT INTO `product` VALUES ('94', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '30', '0');
INSERT INTO `product` VALUES ('100', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');
INSERT INTO `product` VALUES ('101', '今麦郎矿泉水', '今麦郎', '食品', '500ml', '12个月', '2022-12-12', '0.50', '1.00', '500', '0');

-- ----------------------------
-- Table structure for proffer
-- ----------------------------
DROP TABLE IF EXISTS `proffer`;
CREATE TABLE `proffer` (
  `ProfferID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '供货商ID',
  `ProfferName` varchar(20) NOT NULL COMMENT '供货商名称',
  `Address` varchar(50) NOT NULL COMMENT '供货商地址',
  `Attn` varchar(10) NOT NULL COMMENT '联系人',
  `AttnTel` varchar(15) NOT NULL COMMENT '联系人电话',
  PRIMARY KEY (`ProfferID`),
  KEY `ProfferName` (`ProfferName`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proffer
-- ----------------------------
INSERT INTO `proffer` VALUES ('1', '今麦郎', '江西省南昌市南昌县', '张三', '18279256100');
INSERT INTO `proffer` VALUES ('2', '今麦郎', '江西省南昌市南昌县', '张三', '18279256100');
INSERT INTO `proffer` VALUES ('3', '心相印', '江西省南昌市新建区', '李四', '18279256101');
INSERT INTO `proffer` VALUES ('4', '今麦郎', '江西省南昌市南昌县', '张三', '18279256100');
INSERT INTO `proffer` VALUES ('5', '心相印', '江西省南昌市新建区', '李四', '18279256101');
INSERT INTO `proffer` VALUES ('6', '益达', '江西省南昌市青山湖区', '王五', '18279256102');
INSERT INTO `proffer` VALUES ('7', '好丽友', '江西省南昌市红谷滩区', '赵六', '18279256103');
INSERT INTO `proffer` VALUES ('8', '纳美', '江西省南昌市东湖区', '麻子', '18279256104');
INSERT INTO `proffer` VALUES ('9', '今麦郎', '江西省南昌市南昌县', '张三', '18279256100');
INSERT INTO `proffer` VALUES ('10', '心相印', '江西省南昌市新建区', '李四', '18279256101');
INSERT INTO `proffer` VALUES ('11', '益达', '江西省南昌市青山湖区', '王五', '18279256102');
INSERT INTO `proffer` VALUES ('12', '好丽友', '江西省南昌市红谷滩区', '赵六', '18279256103');
INSERT INTO `proffer` VALUES ('13', '纳美', '江西省南昌市东湖区', '麻子', '18279256104');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `StaffID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `StaffName` varchar(10) NOT NULL COMMENT '员工姓名',
  `Sex` varchar(5) NOT NULL COMMENT '员工性别',
  `Age` int(10) unsigned NOT NULL COMMENT '员工年龄',
  `IDNumber` varchar(20) NOT NULL COMMENT '员工身份证号',
  `Address` varchar(50) NOT NULL COMMENT '员工地址',
  `PhoneNumber` varchar(20) NOT NULL COMMENT '员工电话',
  `Duty` varchar(20) NOT NULL COMMENT '职务',
  `Wage` decimal(10,2) NOT NULL COMMENT '工资',
  PRIMARY KEY (`StaffID`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('21', '张三', '男', '35', '360424198512124563', '江西省南昌市南昌县', '18279255100', '仓管', '10000.00');
INSERT INTO `staff` VALUES ('22', '李四', '女', '45', '360424198512127635', '江西省南昌市青云谱区', '18279255100', '保洁员', '8000.00');
INSERT INTO `staff` VALUES ('23', '王五', '男', '34', '360424198512129642', '江西省南昌市西湖区', '18279255100', '保洁员', '8000.00');
INSERT INTO `staff` VALUES ('24', '赵六', '女', '39', '360424198512126831', '江西省南昌市青山湖区', '18279255100', '收银员', '8000.00');
INSERT INTO `staff` VALUES ('25', '麻子', '男', '48', '360424198512126891', '江西省南昌市新建区', '18279255100', '收银员', '8000.00');
INSERT INTO `staff` VALUES ('37', '张三', '男', '35', '360424198512124566', '江西省南昌市', '18279255100', '收银', '8000.00');
INSERT INTO `staff` VALUES ('27', '李四', '女', '45', '360424198512127635', '江西省南昌市青云谱区', '18279255100', '保洁员', '8000.00');
INSERT INTO `staff` VALUES ('28', '王五', '男', '34', '360424198512129642', '江西省南昌市西湖区', '18279255100', '保洁员', '8000.00');
INSERT INTO `staff` VALUES ('29', '赵六', '女', '39', '360424198512126831', '江西省南昌市青山湖区', '18279255100', '收银员', '8000.00');
INSERT INTO `staff` VALUES ('30', '麻子', '男', '48', '360424198512126891', '江西省南昌市新建区', '18279255100', '收银员', '8000.00');
INSERT INTO `staff` VALUES ('36', '张三', '男', '35', '360424198512124567', '江西省南昌市', '18279255100', '收银', '8000.00');
INSERT INTO `staff` VALUES ('32', '李四', '女', '45', '360424198512127635', '江西省南昌市青云谱区', '18279255100', '保洁员', '8000.00');
INSERT INTO `staff` VALUES ('33', '王五', '男', '34', '360424198512129642', '江西省南昌市西湖区', '18279255100', '保洁员', '8000.00');
INSERT INTO `staff` VALUES ('34', '赵六', '女', '39', '360424198512126831', '江西省南昌市青山湖区', '18279255100', '收银员', '8000.00');
INSERT INTO `staff` VALUES ('35', '麻子', '男', '48', '360424198512126891', '江西省南昌市新建区', '18279255100', '收银员', '8000.00');
INSERT INTO `staff` VALUES ('38', '张三', '男', '35', '360424198512124565', '江西省南昌市', '18279255100', '收银', '8000.00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `UserName` varchar(20) NOT NULL COMMENT '用户账号',
  `PassWord` varchar(100) NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456');
INSERT INTO `user` VALUES ('2', 'admin1', '123456');
INSERT INTO `user` VALUES ('3', 'admin', '123456');
INSERT INTO `user` VALUES ('4', 'admin', '123456');
INSERT INTO `user` VALUES ('5', 'admin12', '123456');
INSERT INTO `user` VALUES ('6', 'admin11', '123456');
