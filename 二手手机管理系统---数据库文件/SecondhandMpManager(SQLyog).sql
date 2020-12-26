/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.0.22-community-nt : Database - secondhandmpmanager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`secondhandmpmanager` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `secondhandmpmanager`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL auto_increment,
  `account_nickname` varchar(255) default NULL,
  `account_username` varchar(255) default NULL,
  `account_password` varchar(255) default NULL,
  `account_email` varchar(255) default NULL,
  `account_address` varchar(255) default NULL,
  `account_status` int(255) default NULL,
  `account_code` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`account_id`),
  KEY `account_status` USING BTREE (`account_status`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`account_status`) REFERENCES `accstatus` (`accstatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 7168 kB; (`account_status`) REFER `secondhandmp';

/*Data for the table `account` */

insert  into `account`(`account_id`,`account_nickname`,`account_username`,`account_password`,`account_email`,`account_address`,`account_status`,`account_code`) values (1,'梦伴','DreamofOriginal','wushang816','2662252561@qq.com','河北唐山诚安友谊天地',1,'TSCZ'),(2,'小明','xiaoming','xiaoming123','1541421241@qq.com','北京昌平北七家镇',1,'GAX9'),(3,'小红','xiaohong','xiaohong123','5155141512@qq.com','河南光明顶友谊路',2,'FASD'),(4,'小李','xiaoli','xiaoli123','5315593451@qq.com','南京南京路夫子庙',1,'RQ9X'),(5,'小黑','xiaohei','xiaohei','1325623242@qq.com','河北唐山路南区福乐园',1,'FSAC'),(6,'小白','xiaobai','xiaobai123','254016841@qq.com','河北保定莲池区河北软件',1,'GSDF'),(7,'小紫','xiaozi','xiaozi','13224242@qq.com','河北廊坊河北工业大学',1,'QQGX'),(8,'小绿','xiaolv','xiaolv','2016841@qq.com','河北保定莲池区河北软件',1,'XOQ1'),(9,'铭起','mingqi','mingqi123','412222@qq.com','河南平顶山建设路',2,'2S1X'),(10,'梦雪','mengxue','mengxue123','19562892@qq.com','山东青岛卫国路22号',1,'Q23P'),(11,'付清','fuqing','fuqing123','mengahos@gmail.com','山东济南济南东站',1,'124A');

/*Table structure for table `accstatus` */

DROP TABLE IF EXISTS `accstatus`;

CREATE TABLE `accstatus` (
  `accstatus_id` int(11) NOT NULL auto_increment,
  `accstatus_name` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`accstatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `accstatus` */

insert  into `accstatus`(`accstatus_id`,`accstatus_name`) values (1,'已激活'),(2,'未激活');

/*Table structure for table `ad` */

DROP TABLE IF EXISTS `ad`;

CREATE TABLE `ad` (
  `ad_id` int(11) NOT NULL auto_increment,
  `ad_name` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `ad` */

insert  into `ad`(`ad_id`,`ad_name`) values (1,'双十一购物节 全场九折');

/*Table structure for table `blockword` */

DROP TABLE IF EXISTS `blockword`;

CREATE TABLE `blockword` (
  `blockword_id` int(11) NOT NULL auto_increment,
  `blockword_name` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`blockword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `blockword` */

insert  into `blockword`(`blockword_id`,`blockword_name`) values (1,'傻'),(2,'逼'),(3,'癌'),(4,'狗'),(5,'妈'),(6,'垃'),(7,'圾');

/*Table structure for table `brand` */

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `brand_id` int(255) NOT NULL auto_increment,
  `brand_name` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `brand` */

insert  into `brand`(`brand_id`,`brand_name`) values (1,'苹果'),(2,'华为'),(3,'小米'),(4,'三星'),(5,'魅族'),(6,'OPPO'),(7,'锤子'),(8,'VIVO'),(9,'OnePlus');

/*Table structure for table `buyhistory` */

DROP TABLE IF EXISTS `buyhistory`;

CREATE TABLE `buyhistory` (
  `buyhistory_id` int(11) NOT NULL auto_increment,
  `buyhistory_mpinfoid` int(11) default NULL,
  `buyhistory_status` int(255) default NULL,
  `buyhistory_belongaccid` int(255) default NULL,
  `buyhistory_buyTime` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`buyhistory_id`),
  KEY `buyhistory_mpinfoid` USING BTREE (`buyhistory_mpinfoid`),
  KEY `buyhistory_belongaccid` USING BTREE (`buyhistory_belongaccid`),
  KEY `buyhistory_status` USING BTREE (`buyhistory_status`),
  CONSTRAINT `buyhistory_ibfk_1` FOREIGN KEY (`buyhistory_mpinfoid`) REFERENCES `mpinfo` (`MpInfo_id`),
  CONSTRAINT `buyhistory_ibfk_2` FOREIGN KEY (`buyhistory_belongaccid`) REFERENCES `account` (`account_id`),
  CONSTRAINT `buyhistory_ibfk_3` FOREIGN KEY (`buyhistory_status`) REFERENCES `buystatus` (`buystatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 7168 kB; (`buyhistory_status`) REFER `secondhan';

/*Data for the table `buyhistory` */

insert  into `buyhistory`(`buyhistory_id`,`buyhistory_mpinfoid`,`buyhistory_status`,`buyhistory_belongaccid`,`buyhistory_buyTime`) values (1,1,4,1,'2020年11月10号'),(2,4,1,1,'2020年12月7日'),(3,8,2,5,'2020年10月2日'),(4,17,4,3,'2020年10月9日'),(5,11,4,3,'2020年9月23日');

/*Table structure for table `buystatus` */

DROP TABLE IF EXISTS `buystatus`;

CREATE TABLE `buystatus` (
  `buystatus_id` int(11) NOT NULL auto_increment,
  `buystatus_name` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`buystatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `buystatus` */

insert  into `buystatus`(`buystatus_id`,`buystatus_name`) values (1,'未派送'),(2,'运输中'),(3,'派送中'),(4,'签收完');

/*Table structure for table `color` */

DROP TABLE IF EXISTS `color`;

CREATE TABLE `color` (
  `color_id` int(11) NOT NULL auto_increment,
  `color_name` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `color` */

insert  into `color`(`color_id`,`color_name`) values (1,'红色'),(2,'绿色'),(3,'蓝色'),(4,'紫色'),(5,'黑色'),(6,'银色'),(7,'黄色'),(8,'橙色');

/*Table structure for table `condition` */

DROP TABLE IF EXISTS `condition`;

CREATE TABLE `condition` (
  `condition_id` int(11) NOT NULL auto_increment,
  `condition_name` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `condition` */

insert  into `condition`(`condition_id`,`condition_name`) values (1,'九九新'),(2,'九五新'),(3,'九成新'),(4,'八五新'),(5,'八成新'),(6,'七五新'),(7,'七成新'),(8,'六成新');

/*Table structure for table `infostatus` */

DROP TABLE IF EXISTS `infostatus`;

CREATE TABLE `infostatus` (
  `infostatus_id` int(255) NOT NULL auto_increment,
  `infostatus_name` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`infostatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `infostatus` */

insert  into `infostatus`(`infostatus_id`,`infostatus_name`) values (1,'正在出售'),(2,'已经出售');

/*Table structure for table `losephone` */

DROP TABLE IF EXISTS `losephone`;

CREATE TABLE `losephone` (
  `losephone_id` int(11) NOT NULL auto_increment,
  `losephone_MIME` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`losephone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `losephone` */

insert  into `losephone`(`losephone_id`,`losephone_MIME`) values (1,'355637051875045'),(2,'355637052788650'),(3,'355637052238805'),(4,'355637053986139'),(5,'355637051954873');

/*Table structure for table `losephonecount` */

DROP TABLE IF EXISTS `losephonecount`;

CREATE TABLE `losephonecount` (
  `countNum` int(11) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `losephonecount` */

insert  into `losephonecount`(`countNum`) values (4);

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `manager_id` int(11) NOT NULL auto_increment,
  `manager_nickname` varchar(255) default NULL,
  `manager_username` varchar(255) default NULL,
  `manager_password` varchar(255) default NULL,
  `manager_email` varchar(255) default NULL,
  `manager_status` int(255) default NULL,
  `manager_code` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`manager_id`),
  KEY `manager_status` USING BTREE (`manager_status`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`manager_status`) REFERENCES `accstatus` (`accstatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 8192 kB; (`manager_status`) REFER `secondhandmp';

/*Data for the table `manager` */

insert  into `manager`(`manager_id`,`manager_nickname`,`manager_username`,`manager_password`,`manager_email`,`manager_status`,`manager_code`) values (1,'梦伴如初','mengban','wushang816','1576776108@qq.com',1,'QQQQ'),(2,'test1','test1','test123','2662252562@qq.com',1,'F4HP'),(3,'test2','test2','test123','2662252222@qq.com',1,'8VNY'),(4,'test3','test3','test123','26621231312@qq.com',2,'OUYX'),(5,'test4','test4','test123','2662252561@qq.com',1,'JXMF'),(6,'admin','admin123','admin123','mengban1110@gmail.com',1,'SFA1');

/*Table structure for table `mpinfo` */

DROP TABLE IF EXISTS `mpinfo`;

CREATE TABLE `mpinfo` (
  `MpInfo_id` int(11) NOT NULL auto_increment,
  `MpInfo_title` varchar(255) default NULL,
  `MpInfo_brand` int(255) default NULL,
  `MpInfo_version` varchar(255) default NULL,
  `MpInfo_ram` int(255) default NULL,
  `MpInfo_color` int(255) default NULL,
  `MpInfo_condition` int(255) default NULL,
  `MpInfo_price` decimal(10,2) default NULL,
  `MpInfo_buyTime` varchar(255) default NULL,
  `MpInfo_MIME` varchar(255) default NULL,
  `MpInfo_status` int(255) default NULL,
  `MpInfo_photo` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`MpInfo_id`),
  KEY `MpInfo_brand` USING BTREE (`MpInfo_brand`),
  KEY `MpInfo_color` USING BTREE (`MpInfo_color`),
  KEY `MpInfo_status` USING BTREE (`MpInfo_status`),
  KEY `MpInfo_ram` USING BTREE (`MpInfo_ram`),
  KEY `MpInfo_condition` USING BTREE (`MpInfo_condition`),
  CONSTRAINT `mpinfo_ibfk_1` FOREIGN KEY (`MpInfo_brand`) REFERENCES `brand` (`brand_id`),
  CONSTRAINT `mpinfo_ibfk_2` FOREIGN KEY (`MpInfo_color`) REFERENCES `color` (`color_id`),
  CONSTRAINT `mpinfo_ibfk_3` FOREIGN KEY (`MpInfo_status`) REFERENCES `infostatus` (`infostatus_id`),
  CONSTRAINT `mpinfo_ibfk_4` FOREIGN KEY (`MpInfo_ram`) REFERENCES `ram` (`ram_id`),
  CONSTRAINT `mpinfo_ibfk_5` FOREIGN KEY (`MpInfo_condition`) REFERENCES `condition` (`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 7168 kB; (`MpInfo_brand`) REFER `secondhandmpma';

/*Data for the table `mpinfo` */

insert  into `mpinfo`(`MpInfo_id`,`MpInfo_title`,`MpInfo_brand`,`MpInfo_version`,`MpInfo_ram`,`MpInfo_color`,`MpInfo_condition`,`MpInfo_price`,`MpInfo_buyTime`,`MpInfo_MIME`,`MpInfo_status`,`MpInfo_photo`) values (1,'九五新-银色-苹果-IphoneX-64GB',1,'IphoneX',4,6,2,'2500.00','2019年7月','355637051875045',2,NULL),(2,'九成新-紫色-华为-Mate30Pro5G-256GB',2,'Mate30Pro5G',6,4,3,'3800.00','2019年12月','355637052788650',1,NULL),(3,'九九新-黑色-小米-小米10Pro-128GB',3,'小米10Pro',5,5,1,'4700.00','2020年3月','355637057190372',1,NULL),(4,'八五新-绿色-三星-S10Edge-64GB',4,'S10Edge',4,2,4,'1200.00','2017年7月','323437051178650',2,NULL),(5,'九成新-橙色-魅族-魅族17pro-256GB',5,'魅族17pro',6,8,3,'3900.00','2020年5月','355637231635045',1,NULL),(6,'九九新-红色-OPPO-Reno5-128GB',6,'Reno5',5,1,7,'4300.00','2018年10月','355637021980372',1,NULL),(7,'九五新-黄色-锤子-坚果pro3-64GB',7,'坚果pro3',4,7,2,'4400.00','2019年1月','359349569392215',1,NULL),(8,'九九新-蓝色-VIVO-VIVOx60-128GB',8,'VIVOx60',5,3,1,'5999.00','2020年12月','395489734958231',2,NULL),(9,'九五新-红色-苹果-Iphone11-128GB',1,'Iphone11',5,1,2,'4231.00','2020年11月','323437515418650',1,NULL),(10,'七成新-银色-苹果-Iphone8-32GB',1,'Iphone8',3,6,7,'1900.00','2017年12月','515143242611333',1,NULL),(11,'六成新-黑色-小米-小米10Pro-256GB',3,'小米9',6,5,8,'1200.00','2018年2月','241794172492142',2,NULL),(12,'八成新-黄色-OPPO-Reno2-64GB',6,'Reno2',4,7,5,'1799.00','2016年9月','489120891401241',1,''),(13,'九五新-紫色-华为-P40Pro5G-256GB',2,'P40Pro5G',6,4,2,'5999.00','2020年11月','451563734724521',1,NULL),(14,'六成新-绿色-三星-S7edge-32GB',4,'S7edge',3,2,8,'2677.00','2015年8月','151798734214221',1,NULL),(15,'八五新-红色-OPPO-Reno3-16GB',6,'Reno3',2,1,4,'2399.00','2017年8月','524351416541231',1,NULL),(16,'九五新-黄色-锤子-坚果pro2-64GB',7,'坚果pro2',4,7,2,'4400.00','2019年1月','359349569392215',1,NULL),(17,'六成新-橙色-VIVO-VIVOx50-256GB',8,'VIVOx50',1,8,8,'999.00','2015年12月','124516423115415',2,NULL),(18,'八五新-银色-OnePlus-一加z-128GB',9,'一加z',5,6,4,'5132.00','2019年11月','151452362351412',1,NULL);

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL auto_increment,
  `notice_name` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `notice` */

insert  into `notice`(`notice_id`,`notice_name`) values (1,'本站将于明天进行系统维护 暂停运营一天');

/*Table structure for table `ram` */

DROP TABLE IF EXISTS `ram`;

CREATE TABLE `ram` (
  `ram_id` int(11) NOT NULL auto_increment,
  `ram_name` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`ram_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `ram` */

insert  into `ram`(`ram_id`,`ram_name`) values (1,'8GB'),(2,'16GB'),(3,'32GB'),(4,'64GB'),(5,'128GB'),(6,'256GB');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
