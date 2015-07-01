/*
SQLyog Trial v11.27 (64 bit)
MySQL - 5.6.21 : Database - film
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`film` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `film`;

/*Table structure for table `tb_bankaccountinfo` */

DROP TABLE IF EXISTS `tb_bankaccountinfo`;

CREATE TABLE `tb_bankaccountinfo` (
  `bankAccountId` int(11) NOT NULL,
  `password` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT '1',
  PRIMARY KEY (`bankAccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_bankaccountinfo` */

insert  into `tb_bankaccountinfo`(`bankAccountId`,`password`,`money`,`version`) values (123,123,2147483647,1);

/*Table structure for table `tb_book` */

DROP TABLE IF EXISTS `tb_book`;

CREATE TABLE `tb_book` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `soldRow` varchar(100) DEFAULT NULL,
  `soldColumn` varchar(100) DEFAULT NULL,
  `version` int(11) DEFAULT '1',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `tb_book` */

insert  into `tb_book`(`bookId`,`userId`,`planId`,`price`,`amount`,`state`,`soldRow`,`soldColumn`,`version`,`createTime`) values (22,1000001,58,280,4,0,'0,0,0,0','4,5,7,6',0,'2015-03-25 23:34:11'),(23,1000001,58,210,3,0,'0,0,0','5,6,7',0,'2015-03-25 23:35:22'),(24,1000001,61,350,5,0,'0,0,0,2,2','5,6,7,5,6',0,'2015-03-25 23:49:07'),(25,1000001,61,70,1,0,'2','7',0,'2015-03-25 23:49:23'),(26,1000001,61,140,2,0,'2,2','7,8',0,'2015-03-25 23:49:28'),(27,1000061,67,140,2,0,'0,0','8,7',0,'2015-03-26 23:32:34'),(28,1000061,67,224,4,0,'0,0,0,0','5,6,7,8',0,'2015-03-26 23:43:10'),(29,1000064,67,126,2,0,'0,0','9,10',0,'2015-03-26 23:45:09'),(30,1000064,67,189,3,0,'1,1,1','8,9,10',0,'2015-03-26 23:50:41'),(31,1000064,67,63,1,0,'1','7',0,'2015-03-26 23:57:16'),(32,1000064,67,126,2,0,'1,1','9,10',0,'2015-03-27 00:02:02'),(33,1000064,67,126,2,0,'1,1','9,10',0,'2015-03-27 00:02:13'),(34,1000064,67,126,2,0,'1,2','9,9',0,'2015-03-27 00:04:45'),(35,1000064,67,63,1,0,'2','7',0,'2015-03-27 00:04:54'),(36,1000066,79,126,2,0,'1,1','2,3',0,'2015-04-03 09:20:24'),(37,1000067,82,126,2,0,'0,0','4,5',0,'2015-04-03 10:48:38'),(38,1000068,110,189,3,0,'0,0,3','6,7,8',0,'2015-05-28 22:35:48');

/*Table structure for table `tb_consumerecord` */

DROP TABLE IF EXISTS `tb_consumerecord`;

CREATE TABLE `tb_consumerecord` (
  `consumeRecordId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL,
  `consumeMoney` int(11) DEFAULT NULL,
  `payType` varchar(50) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `version` int(11) DEFAULT '1',
  PRIMARY KEY (`consumeRecordId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `tb_consumerecord` */

insert  into `tb_consumerecord`(`consumeRecordId`,`userId`,`planId`,`consumeMoney`,`payType`,`balance`,`createTime`,`version`) values (4,1000001,58,140,'余额支付',720,'2015-03-25 22:39:40',0),(5,1000001,58,280,'余额支付',440,'2015-03-25 23:34:45',0),(6,1000001,61,350,'余额支付',90,'2015-03-25 23:49:09',0),(7,1000001,61,140,'银行支付',90,'2015-03-25 23:49:36',0),(8,1000061,67,224,'余额支付',376,'2015-03-26 23:43:12',0),(9,1000064,67,63,'余额支付',137,'2015-03-27 00:01:16',0),(10,1000064,67,126,'余额支付',11,'2015-03-27 00:04:47',0),(11,1000064,67,63,'银行支付',11,'2015-03-27 00:04:59',0),(12,1000066,79,126,'余额支付',74,'2015-04-03 09:20:26',0),(13,1000067,82,126,'余额支付',74,'2015-04-03 10:48:43',0);

/*Table structure for table `tb_film` */

DROP TABLE IF EXISTS `tb_film`;

CREATE TABLE `tb_film` (
  `filmId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `director` varchar(30) DEFAULT NULL,
  `actor` varchar(30) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `version` int(11) DEFAULT '1',
  PRIMARY KEY (`filmId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tb_film` */

insert  into `tb_film`(`filmId`,`name`,`photo`,`director`,`actor`,`price`,`type`,`time`,`state`,`description`,`createTime`,`version`) values (1,'灰姑娘','images/film/1.jpg','肯尼思·布拉纳','莉莉·詹姆斯',70,'喜剧',112,1,'母亲离世后，瑞拉的父亲再娶了一位后母。为了支持深爱的父亲，瑞拉热情欢迎后母和她的两位女儿进入自己的家庭。然而当父亲也意外去世后，她才发现自己身陷嫉妒和折磨。','2015-03-18 14:28:58',1),(2,'超能陆战队','images/film/2.jpg','克里斯·威廉姆斯','瑞恩·波特',100,'冒险',102,1,'影片故事聚焦于一名精通机器人的天才神童小宏与充气机器人大白之间的深厚情谊，在他们无意间发现自己生活的城市旧金山遭遇犯罪危机后，小宏必须联合大白向好友\"超疾快递\"神行御姐、\"飞刀厨神\"芥末无疆、\"化学女巫\"哈妮柠檬以及\"怪兽宅男\"弗雷德寻求帮助。','2015-03-19 13:44:40',1),(3,'狼图腾','images/film/3.jpg','让-雅克·阿诺','冯绍峰',70,'伦理',121,1,'1967年，北京知青陈阵（冯绍峰 饰）和杨克（窦骁 饰）响应上山下乡号召来到了内蒙古额仑大草原插队，结识了蒙古族牧民毕利格（巴森 饰）、噶斯迈（昂哈尼玛 饰）一家，也见识了草原上最令人敬畏的动物：狼。','2015-03-19 13:46:57',1),(4,'封门诡影','images/film/4.jpg','王孟圆','张铎',80,'恐怖',90,1,'一段寻找终极之门的视频影像，促使张扬（小张铎饰演）带领准嫂子笑笑前往封门村寻找神秘失踪的哥哥张默，途中遇到驴友文凯、小彤搭车，四人结伴同行夜宿山头破庙，结识迷路的栏目主持人于曼（葛天饰演）和摄像师老杜，一行六人步步惊魂','2015-03-19 13:48:17',1),(5,'帕丁顿熊','images/film/5.jpg','保罗·金','本·威士肖',70,'家庭',95,1,'本片的故事围绕一只年轻的秘鲁小熊展开，这只小熊在伦敦的的帕丁顿站迷路了，然后被一个善良的家庭收养，当时它呆在失物招领处外。因为小熊的秘鲁名字没人能明白，所以善良的人类家庭就根据车站的名字给这只小熊起名叫帕丁顿。','2015-03-19 13:49:26',1);

/*Table structure for table `tb_manager` */

DROP TABLE IF EXISTS `tb_manager`;

CREATE TABLE `tb_manager` (
  `managerId` int(11) NOT NULL AUTO_INCREMENT,
  `password` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`managerId`)
) ENGINE=InnoDB AUTO_INCREMENT=12346 DEFAULT CHARSET=utf8;

/*Data for the table `tb_manager` */

insert  into `tb_manager`(`managerId`,`password`,`name`,`version`) values (12345,12345,'经理',NULL);

/*Table structure for table `tb_plan` */

DROP TABLE IF EXISTS `tb_plan`;

CREATE TABLE `tb_plan` (
  `planId` int(11) NOT NULL AUTO_INCREMENT,
  `filmId` int(11) DEFAULT NULL,
  `timeId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `end` int(11) DEFAULT NULL,
  `playTime` varchar(20) DEFAULT NULL,
  `roomId` int(11) DEFAULT NULL,
  `sold` varchar(500) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`planId`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

/*Data for the table `tb_plan` */

insert  into `tb_plan`(`planId`,`filmId`,`timeId`,`state`,`end`,`playTime`,`roomId`,`sold`,`version`,`createTime`) values (53,1,1,1,0,'2015-03-19',1,NULL,0,'2015-03-19 22:18:52'),(54,1,2,1,0,'2015-03-19',2,NULL,0,'2015-03-19 22:18:55'),(56,1,4,0,0,'2015-03-19',3,NULL,0,'2015-03-19 22:18:58'),(57,1,3,1,0,'2015-03-19',3,NULL,0,'2015-03-19 22:23:13'),(58,1,2,1,0,'2015-03-25',1,'0000111100,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000',0,'2015-03-24 18:29:46'),(59,1,3,1,0,'2015-03-25',2,NULL,0,'2015-03-24 18:29:47'),(60,1,3,1,0,'2015-03-25',4,NULL,0,'2015-03-24 18:29:49'),(61,1,2,1,0,'2015-03-25',3,'0000011100,0000000000,0000011110,0000000000,0000000000,0000000000,0000000000,0000000000',0,'2015-03-24 18:29:50'),(62,1,4,1,0,'2015-03-25',3,NULL,0,'2015-03-24 18:29:51'),(64,5,3,0,0,'2015-03-25',1,NULL,0,'2015-03-25 11:52:00'),(65,3,1,0,0,'2015-03-25',1,NULL,0,'2015-03-25 11:52:11'),(66,4,1,0,0,'2015-03-25',2,NULL,0,'2015-03-25 11:52:14'),(67,3,1,1,0,'2015-03-27',1,'0000011110,0000000101,0000000101,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000',0,'2015-03-26 22:17:02'),(68,3,2,1,0,'2015-03-27',2,NULL,0,'2015-03-26 22:17:05'),(69,3,3,1,0,'2015-03-27',3,NULL,0,'2015-03-26 22:17:08'),(70,3,4,1,0,'2015-03-27',4,NULL,0,'2015-03-26 22:17:10'),(71,3,5,1,0,'2015-03-27',5,NULL,0,'2015-03-26 22:17:12'),(72,2,1,0,0,'2015-04-01',1,NULL,0,'2015-04-01 15:26:46'),(73,3,2,0,0,'2015-04-01',2,NULL,0,'2015-04-01 15:26:49'),(74,4,3,0,0,'2015-04-01',2,NULL,0,'2015-04-01 15:26:52'),(76,5,2,1,0,'2015-04-03',2,NULL,0,'2015-04-03 08:52:49'),(77,1,4,1,0,'2015-04-03',1,NULL,0,'2015-04-03 08:52:51'),(78,2,3,1,0,'2015-04-03',2,NULL,0,'2015-04-03 08:52:54'),(79,1,2,1,0,'2015-04-03',3,'0000111111,0011101111,0000100000,0000100000,0000000000,0000000000,0000000000,0000000000',0,'2015-04-03 08:52:56'),(80,4,3,1,0,'2015-04-03',1,NULL,0,'2015-04-03 08:53:06'),(82,1,2,1,0,'2015-04-03',1,'0000110110,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000',0,'2015-04-03 10:46:49'),(83,2,1,1,0,'2015-05-29',1,NULL,0,'2015-05-28 22:32:55'),(84,1,2,1,0,'2015-05-29',1,NULL,0,'2015-05-28 22:32:56'),(85,3,3,1,0,'2015-05-29',1,NULL,0,'2015-05-28 22:32:59'),(86,4,3,1,0,'2015-05-29',2,NULL,0,'2015-05-28 22:33:01'),(87,5,2,1,0,'2015-05-29',2,NULL,0,'2015-05-28 22:33:03'),(88,1,4,1,0,'2015-05-29',1,NULL,0,'2015-05-28 22:33:04'),(89,1,5,1,0,'2015-05-29',1,NULL,0,'2015-05-28 22:33:05'),(90,5,4,1,0,'2015-05-29',2,NULL,0,'2015-05-28 22:33:07'),(91,1,5,1,0,'2015-05-29',2,NULL,0,'2015-05-28 22:33:08'),(92,4,4,1,0,'2015-05-29',3,NULL,0,'2015-05-28 22:33:11'),(93,4,5,1,0,'2015-05-29',3,NULL,0,'2015-05-28 22:33:13'),(94,4,3,1,0,'2015-05-29',3,NULL,0,'2015-05-28 22:33:15'),(95,2,2,1,0,'2015-05-29',3,NULL,0,'2015-05-28 22:33:17'),(96,1,2,1,0,'2015-05-29',4,NULL,0,'2015-05-28 22:33:18'),(97,5,3,1,0,'2015-05-29',4,NULL,0,'2015-05-28 22:33:21'),(98,3,1,1,0,'2015-05-29',2,NULL,0,'2015-05-28 22:33:22'),(99,4,1,1,0,'2015-05-29',3,NULL,0,'2015-05-28 22:33:24'),(100,5,4,1,0,'2015-05-29',5,NULL,0,'2015-05-28 22:33:26'),(101,1,2,1,0,'2015-05-30',1,NULL,0,'2015-05-28 22:33:30'),(102,1,3,1,0,'2015-05-30',1,NULL,0,'2015-05-28 22:33:31'),(103,4,3,1,0,'2015-05-30',2,NULL,0,'2015-05-28 22:33:35'),(104,4,4,1,0,'2015-05-30',3,NULL,0,'2015-05-28 22:33:37'),(105,5,2,1,0,'2015-05-30',3,NULL,0,'2015-05-28 22:33:39'),(106,4,2,1,0,'2015-05-30',4,NULL,0,'2015-05-28 22:33:42'),(107,3,3,1,0,'2015-05-30',4,NULL,0,'2015-05-28 22:33:44'),(108,4,5,1,0,'2015-05-30',5,NULL,0,'2015-05-28 22:33:46'),(109,3,4,1,0,'2015-05-30',5,NULL,0,'2015-05-28 22:33:48'),(110,1,2,1,0,'2015-05-28',1,NULL,0,'2015-05-28 22:34:11'),(111,1,3,1,0,'2015-05-28',2,NULL,0,'2015-05-28 22:34:12'),(112,4,4,1,0,'2015-05-28',3,NULL,0,'2015-05-28 22:34:15'),(113,4,4,1,0,'2015-05-28',4,NULL,0,'2015-05-28 22:34:18'),(114,2,2,1,0,'2015-05-28',3,NULL,0,'2015-05-28 22:34:20'),(115,3,3,1,0,'2015-05-28',3,NULL,0,'2015-05-28 22:34:23'),(116,4,4,1,0,'2015-05-28',1,NULL,0,'2015-05-28 22:34:25'),(117,1,5,1,0,'2015-05-28',1,NULL,0,'2015-05-28 22:34:26'),(118,4,2,1,0,'2015-05-28',4,NULL,0,'2015-05-28 22:34:29'),(119,2,3,1,0,'2015-05-28',5,NULL,0,'2015-05-28 22:34:31');

/*Table structure for table `tb_planwithquestion` */

DROP TABLE IF EXISTS `tb_planwithquestion`;

CREATE TABLE `tb_planwithquestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filmId` int(11) DEFAULT NULL,
  `qId` int(11) DEFAULT NULL,
  `aNum` int(11) DEFAULT NULL,
  `bNum` int(11) DEFAULT NULL,
  `cNum` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT '1',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_planwithquestion` */

insert  into `tb_planwithquestion`(`id`,`filmId`,`qId`,`aNum`,`bNum`,`cNum`,`version`,`createTime`) values (2,1,7,0,0,0,0,'2015-03-19 19:10:20'),(3,1,8,0,0,0,0,'2015-04-03 10:47:15');

/*Table structure for table `tb_question` */

DROP TABLE IF EXISTS `tb_question`;

CREATE TABLE `tb_question` (
  `qId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `a` varchar(100) DEFAULT NULL,
  `b` varchar(100) DEFAULT NULL,
  `c` varchar(100) DEFAULT NULL,
  `version` int(11) DEFAULT '1',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`qId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tb_question` */

insert  into `tb_question`(`qId`,`title`,`a`,`b`,`c`,`version`,`createTime`) values (7,'女主漂亮吗？','漂亮','不漂亮','我不知道',0,'2015-03-19 19:10:20'),(8,'问题1','1','2','3',0,'2015-04-03 10:47:15');

/*Table structure for table `tb_recharge` */

DROP TABLE IF EXISTS `tb_recharge`;

CREATE TABLE `tb_recharge` (
  `rechargeId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `rechargeNum` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  PRIMARY KEY (`rechargeId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `tb_recharge` */

insert  into `tb_recharge`(`rechargeId`,`userId`,`rechargeNum`,`balance`,`createTime`,`version`) values (1,1000063,200,200,'2015-03-26 21:17:30',0),(2,1000063,300,500,'2015-03-26 21:25:32',0),(3,1000063,500,1000,'2015-03-26 21:25:51',0),(4,1000062,1000,1000,'2015-03-26 21:52:51',0),(5,1000061,500,500,'2015-03-26 23:18:59',0),(6,1000061,100,600,'2015-03-26 23:20:36',0),(7,1000064,200,200,'2015-03-26 23:45:00',0),(8,1000065,200,200,'2015-03-27 00:16:54',0),(9,1000066,200,200,'2015-04-03 09:20:13',0),(10,1000067,200,200,'2015-04-03 10:48:01',0),(11,1000068,200,200,'2015-05-28 22:31:48',0);

/*Table structure for table `tb_room` */

DROP TABLE IF EXISTS `tb_room`;

CREATE TABLE `tb_room` (
  `roomId` int(11) NOT NULL,
  `row` int(11) DEFAULT NULL,
  `column` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT '1',
  PRIMARY KEY (`roomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_room` */

insert  into `tb_room`(`roomId`,`row`,`column`,`version`) values (1,10,10,1),(2,8,9,1),(3,8,10,1),(4,8,10,1),(5,8,6,1);

/*Table structure for table `tb_timequantum` */

DROP TABLE IF EXISTS `tb_timequantum`;

CREATE TABLE `tb_timequantum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `begin` int(11) DEFAULT NULL,
  `end` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tb_timequantum` */

insert  into `tb_timequantum`(`id`,`begin`,`end`,`version`) values (1,9,12,1),(2,13,15,1),(3,16,18,1),(4,19,21,1),(5,22,24,1);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `sumPay` int(11) DEFAULT NULL,
  `timeCount` varchar(50) DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `level` varchar(20) DEFAULT NULL,
  `money` int(11) DEFAULT '0',
  `discount` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT '1',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1000069 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`userId`,`name`,`sex`,`password`,`status`,`sumPay`,`timeCount`,`score`,`level`,`money`,`discount`,`createTime`,`place`,`age`,`version`) values (1000001,'张三','男','123','未激活',0,'2016-03-26',0,'白银',90,9,NULL,'北京',32,0),(1000002,'张三','女','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'南京',55,0),(1000003,'张三','女','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'北京',21,0),(1000004,'张三','男','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'南京',31,0),(1000005,'张三','女','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'上海',54,0),(1000006,'张三','女','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'北京',12,0),(1000007,'张三','女','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'广州',34,0),(1000008,'张三','男','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'上海',45,0),(1000009,'张三','女','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'南京',45,0),(1000010,'伯约志继','男','123','停止',0,'2016-03-26',0,'白银',860,9,NULL,'上海',85,0),(1000011,'伯约志继','女','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'北京',35,0),(1000012,'伯约志继','女','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'广州',43,0),(1000013,'伯约志继','男','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'上海',40,0),(1000014,'伯约志继','女','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'北京',50,0),(1000015,'伯约志继','女','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'南京',40,0),(1000016,'伯约志继','男','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'广州',30,0),(1000017,'伯约志继','女','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'北京',20,0),(1000018,'伯约志继','男','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'南京',32,0),(1000019,'伯约志继','女','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'上海',50,0),(1000020,'伯约志继','男','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'广州',32,0),(1000021,'伯约志继','女','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'北京',52,0),(1000022,'伯约志继','男','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'广州',31,0),(1000023,'伯约志继','男','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'上海',52,0),(1000024,'伯约志继','女','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'南京',45,0),(1000025,'伯约志继','男','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'北京',23,0),(1000026,'伯约志继','女','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'广州',21,0),(1000027,'伯约志继','男','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'上海',50,0),(1000028,'伯约志继','女','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'广州',45,0),(1000029,'伯约志继','男','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'北京',61,0),(1000030,'伯约志继','女','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'南京',54,0),(1000031,'伯约志继','男','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'上海',21,0),(1000032,'张俊','女','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'北京',50,0),(1000033,'张俊','男','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'台湾',54,0),(1000034,'张俊','女','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'南京',60,0),(1000035,'德','男','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'北京',30,0),(1000036,'杨过','男','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'台湾',34,0),(1000037,'杨过','男','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'上海',34,0),(1000038,'杨过','男','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'北京',31,0),(1000039,'杨过','男','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'台湾',34,0),(1000040,'杨过','男','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'南京',30,0),(1000041,'杨过','女','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'北京',32,0),(1000042,'杨过','男','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'台湾',50,0),(1000043,'杨过','女','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'上海',14,0),(1000044,'似懂非懂','女','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'北京',15,0),(1000045,'似懂非懂','男','123','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'台湾',16,0),(1000046,'似懂非懂','女','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'南京',18,0),(1000047,'d','男','we','未激活',0,'2016-03-26',0,'白银',0,9,NULL,'北京',25,0),(1000048,'123','男','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'台湾',19,0),(1000049,'123','女','123','停止',0,'2016-03-26',0,'白银',0,9,NULL,'上海',24,0),(1000050,'伯约志继','女','23','未激活',0,'2016-03-26',0,'白银',0,0,NULL,'北京',23,0),(1000051,'伯约志继','男','23','停止',0,'2016-03-26',0,'白银',0,0,NULL,'台湾',26,0),(1000052,'伯约志继','女','23','未激活',0,'2016-03-26',0,'白银',0,0,NULL,'北京',24,0),(1000053,'薛',NULL,'12345','停止',0,'2016-03-26',0,'白银',0,0,NULL,NULL,0,0),(1000054,'薛',NULL,'12345','未激活',0,'2016-03-26',0,'白银',0,0,NULL,NULL,0,0),(1000055,'测试注册',NULL,'12345','停止',0,'2016-03-26',0,'白银',0,0,NULL,NULL,0,0),(1000056,'测试注册','女','12345','未激活',0,'2016-03-26',0,'白银',0,0,NULL,NULL,0,0),(1000057,'123','女','12345','未激活',0,'2016-03-26',0,'白银',0,0,NULL,'台湾',0,0),(1000058,'臧晓杰','男','12345','停止',0,'2016-03-26',0,'白银',0,10,NULL,'',0,0),(1000061,'测试','男','12345','暂停',600,'2016-03-26',0,'白金',376,8,'2015-03-26 16:19:46','',0,0),(1000062,'测试','男','12345','停止',1000,'2015-03-26',0,'钻石',1000,7,'2015-03-26 16:22:20','',0,0),(1000063,'测试修改数据','男','12345','停止',1000,'2015-03-26',1000,'钻石',1000,7,'2015-03-26 16:23:02','上海',111,0),(1000064,'12312312','未选择','12345','停止',200,'2015-03-26',200,'黄金',11,9,'2015-03-26 23:44:41','',0,0),(1000065,'圣达菲','男','12345','停止',200,'2015-03-27',0,'黄金',200,9,'2015-03-27 00:16:25','北京',20,0),(1000066,'薛笑雨','未选择','12345','已激活',200,'2016-04-03',200,'黄金',74,9,'2015-04-03 09:19:52','',0,0),(1000067,'上东方健康','未选择','12345','已激活',200,'2016-04-03',200,'黄金',74,9,'2015-04-03 10:47:44','',0,0),(1000068,'薛晓宇','未选择','123456','已激活',200,'2016-05-28',200,'黄金',200,9,'2015-05-28 22:31:38','',0,0);

/*Table structure for table `tb_waiter` */

DROP TABLE IF EXISTS `tb_waiter`;

CREATE TABLE `tb_waiter` (
  `waiterId` int(11) NOT NULL AUTO_INCREMENT,
  `password` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`waiterId`)
) ENGINE=InnoDB AUTO_INCREMENT=12346 DEFAULT CHARSET=utf8;

/*Data for the table `tb_waiter` */

insert  into `tb_waiter`(`waiterId`,`password`,`name`,`version`) values (12345,12345,'服务员',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
