/*
Navicat MySQL Data Transfer

Source Server         : 123
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : reservation

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-01-05 12:53:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_provence` varchar(32) NOT NULL,
  `address_city` varchar(32) NOT NULL,
  `address_district` varchar(32) NOT NULL,
  `address_street` varchar(32) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '四川省', '成都', '武侯区', '龙腾中路');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_password` varchar(32) NOT NULL,
  `system_time` datetime DEFAULT NULL,
  `admin_name` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `advertisement`
-- ----------------------------
DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement` (
  `advertisement_id` int(11) NOT NULL,
  `advertisement_title` varchar(255) NOT NULL,
  `advertisement_imag` varchar(255) DEFAULT NULL,
  `advertisement_content` varchar(2000) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `advertisement_state` int(11) NOT NULL,
  PRIMARY KEY (`advertisement_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `advertisement_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advertisement
-- ----------------------------

-- ----------------------------
-- Table structure for `evaluation`
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `evaluation_id` int(11) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  `evaluation_content` varchar(255) DEFAULT NULL,
  `evaluation_start` int(11) DEFAULT NULL,
  `evaluation_data` datetime DEFAULT NULL,
  PRIMARY KEY (`evaluation_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for `food`
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `food_price` double(11,0) NOT NULL,
  `food_name` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `describe` varchar(2500) DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `food_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `food_category` (`food_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('1', '1', '89', '黑胡椒牛排', '1', '黑胡椒牛排是以牛里脊肉为主要食材的大众菜，口味咸鲜', '2');
INSERT INTO `food` VALUES ('2', '2', '30', '烤芝士沙拉', '2', '烤芝士配上蔬菜沙拉,口味新颖，很别样的感觉! ', '3');

-- ----------------------------
-- Table structure for `food_category`
-- ----------------------------
DROP TABLE IF EXISTS `food_category`;
CREATE TABLE `food_category` (
  `food_category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`food_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_category
-- ----------------------------
INSERT INTO `food_category` VALUES ('1', '牛排');
INSERT INTO `food_category` VALUES ('2', '沙拉');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `notice_title` varchar(255) DEFAULT NULL,
  `notice_content` varchar(2000) DEFAULT NULL,
  `notice_data` datetime DEFAULT NULL,
  PRIMARY KEY (`notice_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` varchar(32) NOT NULL,
  `order_user` int(11) NOT NULL,
  `order_restaurant` int(11) NOT NULL,
  `order_price` int(11) NOT NULL,
  `order_time` datetime DEFAULT NULL,
  `order_food` varchar(255) DEFAULT NULL,
  `order_state` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_user` (`order_user`),
  KEY `order_restaurant` (`order_restaurant`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`order_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`order_restaurant`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for `restaurant`
-- ----------------------------
DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `restaurant_id` int(11) NOT NULL,
  `restaurant_password` varchar(32) NOT NULL,
  `restaurant_address` int(11) DEFAULT NULL,
  `restaurant_phone` varchar(32) NOT NULL,
  `restaurant_name` varchar(255) NOT NULL,
  `restaurant_state` int(11) NOT NULL,
  PRIMARY KEY (`restaurant_id`),
  KEY `restaurant_address` (`restaurant_address`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`restaurant_address`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of restaurant
-- ----------------------------
INSERT INTO `restaurant` VALUES ('1', '123', '1', '15249875321', '森林牛排', '1');
INSERT INTO `restaurant` VALUES ('2', '123', '1', '16332854759', '美味沙拉店', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_phone` varchar(32) NOT NULL,
  `user_address` int(11) DEFAULT NULL,
  `user_sex` varchar(32) DEFAULT NULL,
  `user_imag` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_state` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_address` (`user_address`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_address`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123', '12341234112', '1', '1', '1', '杉', '1');
