/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.53 : Database - basetp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`basetp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `basetp`;

/*Table structure for table `bt_admin` */

DROP TABLE IF EXISTS `bt_admin`;

CREATE TABLE `bt_admin` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `account` varchar(15) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `pas_salt` varchar(6) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `department_id` mediumint(4) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `last_login_time` int(10) DEFAULT NULL,
  `last_login_ip` varchar(16) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT '0',
  `status` tinyint(2) DEFAULT '10',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `bt_admin` */

insert  into `bt_admin`(`id`,`name`,`account`,`passwd`,`pas_salt`,`phone`,`department_id`,`email`,`last_login_time`,`last_login_ip`,`isAdmin`,`status`) values (1,'admin','admin','af274a028f454ccd231a93a8d06e3137','OORc80','13612929081',1,NULL,1521770491,'127.0.0.1',1,10),(2,'cs','cs','b4b56071285f36c20bcbedd14b674e85','C3PGHr','13612929081',2,NULL,NULL,NULL,0,10);

/*Table structure for table `bt_admin_role` */

DROP TABLE IF EXISTS `bt_admin_role`;

CREATE TABLE `bt_admin_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_id` mediumint(8) NOT NULL,
  `role_id` mediumint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `bt_admin_role` */

insert  into `bt_admin_role`(`id`,`admin_id`,`role_id`) values (1,1,1),(2,70,2),(3,71,3);

/*Table structure for table `bt_config` */

DROP TABLE IF EXISTS `bt_config`;

CREATE TABLE `bt_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `value` varchar(90) NOT NULL,
  `info` varchar(90) NOT NULL,
  `module` varchar(15) NOT NULL,
  `module_name` varchar(90) NOT NULL,
  `extend_value` varchar(90) DEFAULT NULL,
  `use_for` varchar(150) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '5',
  `sort` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `module_status` (`module`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `bt_config` */

insert  into `bt_config`(`id`,`name`,`value`,`info`,`module`,`module_name`,`extend_value`,`use_for`,`status`,`sort`) values (1,'company','测试','公司名称','index','','web',NULL,5,1),(2,'web_keyword','测试','网站keyword','index','','web',NULL,5,1),(3,'web_description','测试测试','网站description','index','','web',NULL,5,1);

/*Table structure for table `bt_department` */

DROP TABLE IF EXISTS `bt_department`;

CREATE TABLE `bt_department` (
  `id` mediumint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `bt_department` */

insert  into `bt_department`(`id`,`name`,`status`) values (1,'技术部',5),(2,'业务部',5),(3,'管理部',5);

/*Table structure for table `bt_district` */

DROP TABLE IF EXISTS `bt_district`;

CREATE TABLE `bt_district` (
  `id` mediumint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL,
  `type` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

/*Data for the table `bt_district` */

insert  into `bt_district`(`id`,`name`,`type`) values (1,'江浙沪',1),(2,'珠三角',1),(3,'港奥台',1),(4,'海外',1),(5,'北京',2),(6,'上海',2),(7,'广州',2),(8,'深圳',2),(9,'杭州',2),(10,'温州',2),(11,'宁波',2),(12,'南京',2),(13,'苏州',2),(14,'济南',2),(15,'青岛',2),(16,'大连',2),(17,'无锡',2),(18,'合肥',2),(19,'天津',2),(20,'长沙',2),(21,'武汉',2),(22,'郑州',2),(23,'石家庄',2),(24,'成都',2),(25,'重庆',2),(26,'西安',2),(27,'昆明',2),(28,'南宁',2),(29,'福州',2),(30,'厦门',2),(31,'南昌',2),(32,'东莞',2),(33,'沈阳',2),(34,'长春',2),(35,'哈尔滨',2),(36,'安徽',3),(37,'福建',3),(38,'甘肃',3),(39,'广东',3),(40,'广西',3),(41,'贵州',3),(42,'海南',3),(43,'河北',3),(44,'河南',3),(45,'湖北',3),(46,'湖南',3),(47,'江苏',3),(48,'黑龙江',3),(49,'江西',3),(50,'吉林',3),(51,'辽宁',3),(52,'内蒙古',3),(53,'宁夏',3),(54,'青海',3),(55,'山东',3),(56,'山西',3),(57,'陕西',3),(58,'四川',3),(59,'西藏',3),(60,'新疆',3),(61,'云南',3),(62,'浙江',3),(63,'香港',3),(64,'澳门',3),(65,'台湾',3);

/*Table structure for table `bt_menu` */

DROP TABLE IF EXISTS `bt_menu`;

CREATE TABLE `bt_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(20) NOT NULL,
  `module_id` mediumint(6) NOT NULL,
  `module_name` varchar(30) NOT NULL,
  `module` varchar(20) DEFAULT NULL,
  `controller` varchar(30) NOT NULL,
  `action` varchar(30) NOT NULL,
  `sort` tinyint(2) DEFAULT '1',
  `startTime` int(10) NOT NULL,
  `admin_id` mediumint(6) NOT NULL,
  `status` tinyint(2) DEFAULT '5',
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `bt_menu` */

insert  into `bt_menu`(`id`,`menu_name`,`module_id`,`module_name`,`module`,`controller`,`action`,`sort`,`startTime`,`admin_id`,`status`) values (2,'员工列表',2,'员工管理','admin','Admin','index',23,1514201077,1,10),(3,'菜单列表',1,'系统管理','admin','Menu','index',99,0,1,10),(7,'模块管理',1,'系统管理','admin','Module','index',85,1496212220,1,10),(9,'添加菜单',1,'系统管理','admin','Menu','add',1,1496217854,1,5),(10,'角色管理',1,'系统管理','admin','Role','index',2,1496224732,1,10),(11,'角色权限',1,'系统管理','admin','Privilege','index',1,1496280210,1,10),(12,'添加员工',2,'员工管理','admin','Admin','add',1,1496367636,1,5),(13,'员工修改',2,'员工管理','admin','Admin','edit',1,1496367697,1,5),(14,'员工删除',2,'员工管理','admin','Admin','delete',1,1496367755,1,5),(24,'员工角色',2,'员工管理','admin','Admin','adminrole',1,1496367755,1,10),(25,'部门管理',2,'员工管理','admin','Department','index',1,0,0,10);

/*Table structure for table `bt_module` */

DROP TABLE IF EXISTS `bt_module`;

CREATE TABLE `bt_module` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `sort` tinyint(2) DEFAULT '1',
  `status` tinyint(2) DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32;

/*Data for the table `bt_module` */

insert  into `bt_module`(`id`,`name`,`sort`,`status`) values (1,'系统管理',1,5),(2,'员工管理',15,5);

/*Table structure for table `bt_privilege` */

DROP TABLE IF EXISTS `bt_privilege`;

CREATE TABLE `bt_privilege` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` mediumint(6) DEFAULT NULL,
  `menu_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `bt_privilege` */

insert  into `bt_privilege`(`id`,`role_id`,`menu_id`) values (25,2,2),(26,2,12),(27,2,14),(28,2,13),(32,2,24),(33,2,25),(34,3,26),(35,3,27),(36,3,29),(37,3,28);

/*Table structure for table `bt_role` */

DROP TABLE IF EXISTS `bt_role`;

CREATE TABLE `bt_role` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `sort` tinyint(2) DEFAULT '1',
  `status` tinyint(2) DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `bt_role` */

insert  into `bt_role`(`id`,`name`,`sort`,`status`) values (2,'管理员',20,5),(3,'员工',20,5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
