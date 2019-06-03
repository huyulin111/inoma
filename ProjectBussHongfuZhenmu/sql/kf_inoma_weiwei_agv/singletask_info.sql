-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.3.7-MariaDB - mariadb.org binary distribution
-- 服务器OS:                        Win64
-- HeidiSQL 版本:                  10.1.0.5577
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table kf_inoma_weiwei_agv.singletask_info
DROP TABLE IF EXISTS `singletask_info`;
CREATE TABLE IF NOT EXISTS `singletask_info` (
  `environment` int(11) NOT NULL DEFAULT 1 COMMENT '环境编号',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskName` varchar(50) NOT NULL COMMENT '对应客户端任务文件名',
  `taskText` varchar(50) NOT NULL COMMENT '服务端显示名称',
  `taskType` varchar(50) NOT NULL DEFAULT '-1' COMMENT '1、楼下任务  2 楼上送空托盘，并取货',
  `allocOpType` varchar(50) DEFAULT '1' COMMENT '操作目标货位的类型：1为向目标货位放货；2为从目标货位取货；3为与其它任务一道的组合任务；',
  `allocid` int(11) DEFAULT NULL COMMENT '目标货位',
  `environmentId` int(11) DEFAULT 0 COMMENT '针对沧州项目多控制台，0代表不属于哪个控制台',
  `agvId` int(11) DEFAULT 0 COMMENT '指定的agv才能执行此任务，0代表都可以执行',
  `lapId` int(11) DEFAULT NULL COMMENT '对应取货点ID（维维为机械手）',
  `isSendToAGV` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否发送到AGV执行',
  `delflag` smallint(1) DEFAULT 0 COMMENT '删除标志',
  `orderby` int(11) DEFAULT 0 COMMENT '排序依据',
  `createtime` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskName` (`taskName`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8 COMMENT='任务信息表';

-- Dumping data for table kf_inoma_weiwei_agv.singletask_info: ~0 rows (大约)
DELETE FROM `singletask_info`;
/*!40000 ALTER TABLE `singletask_info` DISABLE KEYS */;
INSERT INTO `singletask_info` (`environment`, `id`, `taskName`, `taskText`, `taskType`, `allocOpType`, `allocid`, `environmentId`, `agvId`, `lapId`, `isSendToAGV`, `delflag`, `orderby`, `createtime`) VALUES
	(1, 1, '1车1取货点A-0-1存货', '1-Q1-A-0-1.xml', 'RECEIPT', '1', 1, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 2, '1车1取货点A-0-2存货', '1-Q1-A-0-2.xml', 'RECEIPT', '1', 2, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 3, '1车1取货点A-0-3存货', '1-Q1-A-0-3.xml', 'RECEIPT', '1', 3, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 4, '1车1取货点A-0-4存货', '1-Q1-A-0-4.xml', 'RECEIPT', '1', 4, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 5, '1车1取货点A-0-5存货', '1-Q1-A-0-5.xml', 'RECEIPT', '1', 5, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 6, '1车1取货点A-0-6存货', '1-Q1-A-0-6.xml', 'RECEIPT', '1', 6, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 7, '1车1取货点A-0-7存货', '1-Q1-A-0-7.xml', 'RECEIPT', '1', 7, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 8, '1车1取货点A-0-8存货', '1-Q1-A-0-8.xml', 'RECEIPT', '1', 8, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 9, '1车1取货点A-0-9存货', '1-Q1-A-0-9.xml', 'RECEIPT', '1', 9, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 10, '1车1取货点A-0-10存货', '1-Q1-A-0-10.xml', 'RECEIPT', '1', 10, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 11, '1车1取货点A-1-1存货', '1-Q1-A-1-1.xml', 'RECEIPT', '1', 11, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 12, '1车1取货点A-1-2存货', '1-Q1-A-1-2.xml', 'RECEIPT', '1', 12, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 13, '1车1取货点A-1-3存货', '1-Q1-A-1-3.xml', 'RECEIPT', '1', 13, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 14, '1车1取货点A-1-4存货', '1-Q1-A-1-4.xml', 'RECEIPT', '1', 14, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 15, '1车1取货点A-1-5存货', '1-Q1-A-1-5.xml', 'RECEIPT', '1', 15, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 16, '1车1取货点A-1-6存货', '1-Q1-A-1-6.xml', 'RECEIPT', '1', 16, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 17, '1车1取货点A-1-7存货', '1-Q1-A-1-7.xml', 'RECEIPT', '1', 17, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 18, '1车1取货点A-1-8存货', '1-Q1-A-1-8.xml', 'RECEIPT', '1', 18, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 19, '1车1取货点A-1-9存货', '1-Q1-A-1-9.xml', 'RECEIPT', '1', 19, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 20, '1车1取货点A-1-10存货', '1-Q1-A-1-10.xml', 'RECEIPT', '1', 20, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 21, '1车1取货点B-0-1存货', '1-Q1-B-0-1.xml', 'RECEIPT', '1', 21, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 22, '1车1取货点B-0-2存货', '1-Q1-B-0-2.xml', 'RECEIPT', '1', 22, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 23, '1车1取货点B-0-3存货', '1-Q1-B-0-3.xml', 'RECEIPT', '1', 23, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 24, '1车1取货点B-0-4存货', '1-Q1-B-0-4.xml', 'RECEIPT', '1', 24, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 25, '1车1取货点B-0-5存货', '1-Q1-B-0-5.xml', 'RECEIPT', '1', 25, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 26, '1车1取货点B-0-6存货', '1-Q1-B-0-6.xml', 'RECEIPT', '1', 26, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 27, '1车1取货点B-0-7存货', '1-Q1-B-0-7.xml', 'RECEIPT', '1', 27, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 28, '1车1取货点B-0-8存货', '1-Q1-B-0-8.xml', 'RECEIPT', '1', 28, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 29, '1车1取货点B-0-9存货', '1-Q1-B-0-9.xml', 'RECEIPT', '1', 29, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 30, '1车1取货点B-0-10存货', '1-Q1-B-0-10.xml', 'RECEIPT', '1', 30, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 31, '1车1取货点B-1-1存货', '1-Q1-B-1-1.xml', 'RECEIPT', '1', 31, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 32, '1车1取货点B-1-2存货', '1-Q1-B-1-2.xml', 'RECEIPT', '1', 32, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 33, '1车1取货点B-1-3存货', '1-Q1-B-1-3.xml', 'RECEIPT', '1', 33, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 34, '1车1取货点B-1-4存货', '1-Q1-B-1-4.xml', 'RECEIPT', '1', 34, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 35, '1车1取货点B-1-5存货', '1-Q1-B-1-5.xml', 'RECEIPT', '1', 35, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 36, '1车1取货点B-1-6存货', '1-Q1-B-1-6.xml', 'RECEIPT', '1', 36, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 37, '1车1取货点B-1-7存货', '1-Q1-B-1-7.xml', 'RECEIPT', '1', 37, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 38, '1车1取货点B-1-8存货', '1-Q1-B-1-8.xml', 'RECEIPT', '1', 38, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 39, '1车1取货点B-1-9存货', '1-Q1-B-1-9.xml', 'RECEIPT', '1', 39, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 40, '1车1取货点B-1-10存货', '1-Q1-B-1-10.xml', 'RECEIPT', '1', 40, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 64, '1车2取货点A-0-1存货', '1-Q2-A-0-1.xml', 'RECEIPT', '1', 1, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 65, '1车2取货点A-0-2存货', '1-Q2-A-0-2.xml', 'RECEIPT', '1', 2, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 66, '1车2取货点A-0-3存货', '1-Q2-A-0-3.xml', 'RECEIPT', '1', 3, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 67, '1车2取货点A-0-4存货', '1-Q2-A-0-4.xml', 'RECEIPT', '1', 4, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 68, '1车2取货点A-0-5存货', '1-Q2-A-0-5.xml', 'RECEIPT', '1', 5, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 69, '1车2取货点A-0-6存货', '1-Q2-A-0-6.xml', 'RECEIPT', '1', 6, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 70, '1车2取货点A-0-7存货', '1-Q2-A-0-7.xml', 'RECEIPT', '1', 7, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 71, '1车2取货点A-0-8存货', '1-Q2-A-0-8.xml', 'RECEIPT', '1', 8, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 72, '1车2取货点A-0-9存货', '1-Q2-A-0-9.xml', 'RECEIPT', '1', 9, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 73, '1车2取货点A-0-10存货', '1-Q2-A-0-10.xml', 'RECEIPT', '1', 10, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 74, '1车2取货点A-1-1存货', '1-Q2-A-1-1.xml', 'RECEIPT', '1', 11, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 75, '1车2取货点A-1-2存货', '1-Q2-A-1-2.xml', 'RECEIPT', '1', 12, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 76, '1车2取货点A-1-3存货', '1-Q2-A-1-3.xml', 'RECEIPT', '1', 13, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 77, '1车2取货点A-1-4存货', '1-Q2-A-1-4.xml', 'RECEIPT', '1', 14, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 78, '1车2取货点A-1-5存货', '1-Q2-A-1-5.xml', 'RECEIPT', '1', 15, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 79, '1车2取货点A-1-6存货', '1-Q2-A-1-6.xml', 'RECEIPT', '1', 16, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 80, '1车2取货点A-1-7存货', '1-Q2-A-1-7.xml', 'RECEIPT', '1', 17, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 81, '1车2取货点A-1-8存货', '1-Q2-A-1-8.xml', 'RECEIPT', '1', 18, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 82, '1车2取货点A-1-9存货', '1-Q2-A-1-9.xml', 'RECEIPT', '1', 19, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 83, '1车2取货点A-1-10存货', '1-Q2-A-1-10.xml', 'RECEIPT', '1', 20, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 84, '1车2取货点B-0-1存货', '1-Q2-B-0-1.xml', 'RECEIPT', '1', 21, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 85, '1车2取货点B-0-2存货', '1-Q2-B-0-2.xml', 'RECEIPT', '1', 22, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 86, '1车2取货点B-0-3存货', '1-Q2-B-0-3.xml', 'RECEIPT', '1', 23, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 87, '1车2取货点B-0-4存货', '1-Q2-B-0-4.xml', 'RECEIPT', '1', 24, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 88, '1车2取货点B-0-5存货', '1-Q2-B-0-5.xml', 'RECEIPT', '1', 25, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 89, '1车2取货点B-0-6存货', '1-Q2-B-0-6.xml', 'RECEIPT', '1', 26, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 90, '1车2取货点B-0-7存货', '1-Q2-B-0-7.xml', 'RECEIPT', '1', 27, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 91, '1车2取货点B-0-8存货', '1-Q2-B-0-8.xml', 'RECEIPT', '1', 28, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 92, '1车2取货点B-0-9存货', '1-Q2-B-0-9.xml', 'RECEIPT', '1', 29, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 93, '1车2取货点B-0-10存货', '1-Q2-B-0-10.xml', 'RECEIPT', '1', 30, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 94, '1车2取货点B-1-1存货', '1-Q2-B-1-1.xml', 'RECEIPT', '1', 31, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 95, '1车2取货点B-1-2存货', '1-Q2-B-1-2.xml', 'RECEIPT', '1', 32, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 96, '1车2取货点B-1-3存货', '1-Q2-B-1-3.xml', 'RECEIPT', '1', 33, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 97, '1车2取货点B-1-4存货', '1-Q2-B-1-4.xml', 'RECEIPT', '1', 34, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 98, '1车2取货点B-1-5存货', '1-Q2-B-1-5.xml', 'RECEIPT', '1', 35, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 99, '1车2取货点B-1-6存货', '1-Q2-B-1-6.xml', 'RECEIPT', '1', 36, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 100, '1车2取货点B-1-7存货', '1-Q2-B-1-7.xml', 'RECEIPT', '1', 37, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 101, '1车2取货点B-1-8存货', '1-Q2-B-1-8.xml', 'RECEIPT', '1', 38, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 102, '1车2取货点B-1-9存货', '1-Q2-B-1-9.xml', 'RECEIPT', '1', 39, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 103, '1车2取货点B-1-10存货', '1-Q2-B-1-10.xml', 'RECEIPT', '1', 40, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:56'),
	(1, 127, '1车1取货点A-0-1取货', '1-F1-A-0-1.xml', 'SHIPMENT', '1', 1, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 128, '1车1取货点A-0-2取货', '1-F1-A-0-2.xml', 'SHIPMENT', '1', 2, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 129, '1车1取货点A-0-3取货', '1-F1-A-0-3.xml', 'SHIPMENT', '1', 3, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 130, '1车1取货点A-0-4取货', '1-F1-A-0-4.xml', 'SHIPMENT', '1', 4, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 131, '1车1取货点A-0-5取货', '1-F1-A-0-5.xml', 'SHIPMENT', '1', 5, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 132, '1车1取货点A-0-6取货', '1-F1-A-0-6.xml', 'SHIPMENT', '1', 6, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 133, '1车1取货点A-0-7取货', '1-F1-A-0-7.xml', 'SHIPMENT', '1', 7, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 134, '1车1取货点A-0-8取货', '1-F1-A-0-8.xml', 'SHIPMENT', '1', 8, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 135, '1车1取货点A-0-9取货', '1-F1-A-0-9.xml', 'SHIPMENT', '1', 9, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 136, '1车1取货点A-0-10取货', '1-F1-A-0-10.xml', 'SHIPMENT', '1', 10, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 137, '1车1取货点A-1-1取货', '1-F1-A-1-1.xml', 'SHIPMENT', '1', 11, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 138, '1车1取货点A-1-2取货', '1-F1-A-1-2.xml', 'SHIPMENT', '1', 12, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 139, '1车1取货点A-1-3取货', '1-F1-A-1-3.xml', 'SHIPMENT', '1', 13, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 140, '1车1取货点A-1-4取货', '1-F1-A-1-4.xml', 'SHIPMENT', '1', 14, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 141, '1车1取货点A-1-5取货', '1-F1-A-1-5.xml', 'SHIPMENT', '1', 15, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 142, '1车1取货点A-1-6取货', '1-F1-A-1-6.xml', 'SHIPMENT', '1', 16, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 143, '1车1取货点A-1-7取货', '1-F1-A-1-7.xml', 'SHIPMENT', '1', 17, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 144, '1车1取货点A-1-8取货', '1-F1-A-1-8.xml', 'SHIPMENT', '1', 18, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 145, '1车1取货点A-1-9取货', '1-F1-A-1-9.xml', 'SHIPMENT', '1', 19, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 146, '1车1取货点A-1-10取货', '1-F1-A-1-10.xml', 'SHIPMENT', '1', 20, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 147, '1车1取货点B-0-1取货', '1-F1-B-0-1.xml', 'SHIPMENT', '1', 21, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 148, '1车1取货点B-0-2取货', '1-F1-B-0-2.xml', 'SHIPMENT', '1', 22, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 149, '1车1取货点B-0-3取货', '1-F1-B-0-3.xml', 'SHIPMENT', '1', 23, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 150, '1车1取货点B-0-4取货', '1-F1-B-0-4.xml', 'SHIPMENT', '1', 24, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 151, '1车1取货点B-0-5取货', '1-F1-B-0-5.xml', 'SHIPMENT', '1', 25, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 152, '1车1取货点B-0-6取货', '1-F1-B-0-6.xml', 'SHIPMENT', '1', 26, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 153, '1车1取货点B-0-7取货', '1-F1-B-0-7.xml', 'SHIPMENT', '1', 27, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 154, '1车1取货点B-0-8取货', '1-F1-B-0-8.xml', 'SHIPMENT', '1', 28, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 155, '1车1取货点B-0-9取货', '1-F1-B-0-9.xml', 'SHIPMENT', '1', 29, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 156, '1车1取货点B-0-10取货', '1-F1-B-0-10.xml', 'SHIPMENT', '1', 30, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 157, '1车1取货点B-1-1取货', '1-F1-B-1-1.xml', 'SHIPMENT', '1', 31, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 158, '1车1取货点B-1-2取货', '1-F1-B-1-2.xml', 'SHIPMENT', '1', 32, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 159, '1车1取货点B-1-3取货', '1-F1-B-1-3.xml', 'SHIPMENT', '1', 33, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 160, '1车1取货点B-1-4取货', '1-F1-B-1-4.xml', 'SHIPMENT', '1', 34, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 161, '1车1取货点B-1-5取货', '1-F1-B-1-5.xml', 'SHIPMENT', '1', 35, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 162, '1车1取货点B-1-6取货', '1-F1-B-1-6.xml', 'SHIPMENT', '1', 36, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 163, '1车1取货点B-1-7取货', '1-F1-B-1-7.xml', 'SHIPMENT', '1', 37, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 164, '1车1取货点B-1-8取货', '1-F1-B-1-8.xml', 'SHIPMENT', '1', 38, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 165, '1车1取货点B-1-9取货', '1-F1-B-1-9.xml', 'SHIPMENT', '1', 39, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 166, '1车1取货点B-1-10取货', '1-F1-B-1-10.xml', 'SHIPMENT', '1', 40, 1, 1, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 190, '1车2取货点A-0-1取货', '1-F2-A-0-1.xml', 'SHIPMENT', '1', 1, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 191, '1车2取货点A-0-2取货', '1-F2-A-0-2.xml', 'SHIPMENT', '1', 2, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 192, '1车2取货点A-0-3取货', '1-F2-A-0-3.xml', 'SHIPMENT', '1', 3, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 193, '1车2取货点A-0-4取货', '1-F2-A-0-4.xml', 'SHIPMENT', '1', 4, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 194, '1车2取货点A-0-5取货', '1-F2-A-0-5.xml', 'SHIPMENT', '1', 5, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 195, '1车2取货点A-0-6取货', '1-F2-A-0-6.xml', 'SHIPMENT', '1', 6, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 196, '1车2取货点A-0-7取货', '1-F2-A-0-7.xml', 'SHIPMENT', '1', 7, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 197, '1车2取货点A-0-8取货', '1-F2-A-0-8.xml', 'SHIPMENT', '1', 8, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 198, '1车2取货点A-0-9取货', '1-F2-A-0-9.xml', 'SHIPMENT', '1', 9, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 199, '1车2取货点A-0-10取货', '1-F2-A-0-10.xml', 'SHIPMENT', '1', 10, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 200, '1车2取货点A-1-1取货', '1-F2-A-1-1.xml', 'SHIPMENT', '1', 11, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 201, '1车2取货点A-1-2取货', '1-F2-A-1-2.xml', 'SHIPMENT', '1', 12, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 202, '1车2取货点A-1-3取货', '1-F2-A-1-3.xml', 'SHIPMENT', '1', 13, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 203, '1车2取货点A-1-4取货', '1-F2-A-1-4.xml', 'SHIPMENT', '1', 14, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 204, '1车2取货点A-1-5取货', '1-F2-A-1-5.xml', 'SHIPMENT', '1', 15, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 205, '1车2取货点A-1-6取货', '1-F2-A-1-6.xml', 'SHIPMENT', '1', 16, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 206, '1车2取货点A-1-7取货', '1-F2-A-1-7.xml', 'SHIPMENT', '1', 17, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 207, '1车2取货点A-1-8取货', '1-F2-A-1-8.xml', 'SHIPMENT', '1', 18, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 208, '1车2取货点A-1-9取货', '1-F2-A-1-9.xml', 'SHIPMENT', '1', 19, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 209, '1车2取货点A-1-10取货', '1-F2-A-1-10.xml', 'SHIPMENT', '1', 20, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 210, '1车2取货点B-0-1取货', '1-F2-B-0-1.xml', 'SHIPMENT', '1', 21, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 211, '1车2取货点B-0-2取货', '1-F2-B-0-2.xml', 'SHIPMENT', '1', 22, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 212, '1车2取货点B-0-3取货', '1-F2-B-0-3.xml', 'SHIPMENT', '1', 23, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 213, '1车2取货点B-0-4取货', '1-F2-B-0-4.xml', 'SHIPMENT', '1', 24, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 214, '1车2取货点B-0-5取货', '1-F2-B-0-5.xml', 'SHIPMENT', '1', 25, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 215, '1车2取货点B-0-6取货', '1-F2-B-0-6.xml', 'SHIPMENT', '1', 26, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 216, '1车2取货点B-0-7取货', '1-F2-B-0-7.xml', 'SHIPMENT', '1', 27, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 217, '1车2取货点B-0-8取货', '1-F2-B-0-8.xml', 'SHIPMENT', '1', 28, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 218, '1车2取货点B-0-9取货', '1-F2-B-0-9.xml', 'SHIPMENT', '1', 29, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 219, '1车2取货点B-0-10取货', '1-F2-B-0-10.xml', 'SHIPMENT', '1', 30, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 220, '1车2取货点B-1-1取货', '1-F2-B-1-1.xml', 'SHIPMENT', '1', 31, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 221, '1车2取货点B-1-2取货', '1-F2-B-1-2.xml', 'SHIPMENT', '1', 32, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 222, '1车2取货点B-1-3取货', '1-F2-B-1-3.xml', 'SHIPMENT', '1', 33, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 223, '1车2取货点B-1-4取货', '1-F2-B-1-4.xml', 'SHIPMENT', '1', 34, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 224, '1车2取货点B-1-5取货', '1-F2-B-1-5.xml', 'SHIPMENT', '1', 35, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 225, '1车2取货点B-1-6取货', '1-F2-B-1-6.xml', 'SHIPMENT', '1', 36, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 226, '1车2取货点B-1-7取货', '1-F2-B-1-7.xml', 'SHIPMENT', '1', 37, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 227, '1车2取货点B-1-8取货', '1-F2-B-1-8.xml', 'SHIPMENT', '1', 38, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 228, '1车2取货点B-1-9取货', '1-F2-B-1-9.xml', 'SHIPMENT', '1', 39, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 229, '1车2取货点B-1-10取货', '1-F2-B-1-10.xml', 'SHIPMENT', '1', 40, 1, 1, 2, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 253, '2车1取货点A-0-1存货', '2-Q1-A-0-1.xml', 'RECEIPT', '1', 1, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 254, '2车1取货点A-0-2存货', '2-Q1-A-0-2.xml', 'RECEIPT', '1', 2, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 255, '2车1取货点A-0-3存货', '2-Q1-A-0-3.xml', 'RECEIPT', '1', 3, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 256, '2车1取货点A-0-4存货', '2-Q1-A-0-4.xml', 'RECEIPT', '1', 4, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 257, '2车1取货点A-0-5存货', '2-Q1-A-0-5.xml', 'RECEIPT', '1', 5, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 258, '2车1取货点A-0-6存货', '2-Q1-A-0-6.xml', 'RECEIPT', '1', 6, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 259, '2车1取货点A-0-7存货', '2-Q1-A-0-7.xml', 'RECEIPT', '1', 7, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 260, '2车1取货点A-0-8存货', '2-Q1-A-0-8.xml', 'RECEIPT', '1', 8, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 261, '2车1取货点A-0-9存货', '2-Q1-A-0-9.xml', 'RECEIPT', '1', 9, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 262, '2车1取货点A-0-10存货', '2-Q1-A-0-10.xml', 'RECEIPT', '1', 10, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 263, '2车1取货点A-1-1存货', '2-Q1-A-1-1.xml', 'RECEIPT', '1', 11, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 264, '2车1取货点A-1-2存货', '2-Q1-A-1-2.xml', 'RECEIPT', '1', 12, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 265, '2车1取货点A-1-3存货', '2-Q1-A-1-3.xml', 'RECEIPT', '1', 13, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 266, '2车1取货点A-1-4存货', '2-Q1-A-1-4.xml', 'RECEIPT', '1', 14, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 267, '2车1取货点A-1-5存货', '2-Q1-A-1-5.xml', 'RECEIPT', '1', 15, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 268, '2车1取货点A-1-6存货', '2-Q1-A-1-6.xml', 'RECEIPT', '1', 16, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 269, '2车1取货点A-1-7存货', '2-Q1-A-1-7.xml', 'RECEIPT', '1', 17, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 270, '2车1取货点A-1-8存货', '2-Q1-A-1-8.xml', 'RECEIPT', '1', 18, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 271, '2车1取货点A-1-9存货', '2-Q1-A-1-9.xml', 'RECEIPT', '1', 19, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 272, '2车1取货点A-1-10存货', '2-Q1-A-1-10.xml', 'RECEIPT', '1', 20, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 273, '2车1取货点B-0-1存货', '2-Q1-B-0-1.xml', 'RECEIPT', '1', 21, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 274, '2车1取货点B-0-2存货', '2-Q1-B-0-2.xml', 'RECEIPT', '1', 22, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 275, '2车1取货点B-0-3存货', '2-Q1-B-0-3.xml', 'RECEIPT', '1', 23, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 276, '2车1取货点B-0-4存货', '2-Q1-B-0-4.xml', 'RECEIPT', '1', 24, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 277, '2车1取货点B-0-5存货', '2-Q1-B-0-5.xml', 'RECEIPT', '1', 25, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 278, '2车1取货点B-0-6存货', '2-Q1-B-0-6.xml', 'RECEIPT', '1', 26, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 279, '2车1取货点B-0-7存货', '2-Q1-B-0-7.xml', 'RECEIPT', '1', 27, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 280, '2车1取货点B-0-8存货', '2-Q1-B-0-8.xml', 'RECEIPT', '1', 28, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 281, '2车1取货点B-0-9存货', '2-Q1-B-0-9.xml', 'RECEIPT', '1', 29, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 282, '2车1取货点B-0-10存货', '2-Q1-B-0-10.xml', 'RECEIPT', '1', 30, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 283, '2车1取货点B-1-1存货', '2-Q1-B-1-1.xml', 'RECEIPT', '1', 31, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 284, '2车1取货点B-1-2存货', '2-Q1-B-1-2.xml', 'RECEIPT', '1', 32, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 285, '2车1取货点B-1-3存货', '2-Q1-B-1-3.xml', 'RECEIPT', '1', 33, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 286, '2车1取货点B-1-4存货', '2-Q1-B-1-4.xml', 'RECEIPT', '1', 34, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 287, '2车1取货点B-1-5存货', '2-Q1-B-1-5.xml', 'RECEIPT', '1', 35, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 288, '2车1取货点B-1-6存货', '2-Q1-B-1-6.xml', 'RECEIPT', '1', 36, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 289, '2车1取货点B-1-7存货', '2-Q1-B-1-7.xml', 'RECEIPT', '1', 37, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 290, '2车1取货点B-1-8存货', '2-Q1-B-1-8.xml', 'RECEIPT', '1', 38, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 291, '2车1取货点B-1-9存货', '2-Q1-B-1-9.xml', 'RECEIPT', '1', 39, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 292, '2车1取货点B-1-10存货', '2-Q1-B-1-10.xml', 'RECEIPT', '1', 40, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:57'),
	(1, 316, '2车2取货点A-0-1存货', '2-Q2-A-0-1.xml', 'RECEIPT', '1', 1, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 317, '2车2取货点A-0-2存货', '2-Q2-A-0-2.xml', 'RECEIPT', '1', 2, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 318, '2车2取货点A-0-3存货', '2-Q2-A-0-3.xml', 'RECEIPT', '1', 3, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 319, '2车2取货点A-0-4存货', '2-Q2-A-0-4.xml', 'RECEIPT', '1', 4, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 320, '2车2取货点A-0-5存货', '2-Q2-A-0-5.xml', 'RECEIPT', '1', 5, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 321, '2车2取货点A-0-6存货', '2-Q2-A-0-6.xml', 'RECEIPT', '1', 6, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 322, '2车2取货点A-0-7存货', '2-Q2-A-0-7.xml', 'RECEIPT', '1', 7, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 323, '2车2取货点A-0-8存货', '2-Q2-A-0-8.xml', 'RECEIPT', '1', 8, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 324, '2车2取货点A-0-9存货', '2-Q2-A-0-9.xml', 'RECEIPT', '1', 9, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 325, '2车2取货点A-0-10存货', '2-Q2-A-0-10.xml', 'RECEIPT', '1', 10, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 326, '2车2取货点A-1-1存货', '2-Q2-A-1-1.xml', 'RECEIPT', '1', 11, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 327, '2车2取货点A-1-2存货', '2-Q2-A-1-2.xml', 'RECEIPT', '1', 12, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 328, '2车2取货点A-1-3存货', '2-Q2-A-1-3.xml', 'RECEIPT', '1', 13, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 329, '2车2取货点A-1-4存货', '2-Q2-A-1-4.xml', 'RECEIPT', '1', 14, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 330, '2车2取货点A-1-5存货', '2-Q2-A-1-5.xml', 'RECEIPT', '1', 15, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 331, '2车2取货点A-1-6存货', '2-Q2-A-1-6.xml', 'RECEIPT', '1', 16, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 332, '2车2取货点A-1-7存货', '2-Q2-A-1-7.xml', 'RECEIPT', '1', 17, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 333, '2车2取货点A-1-8存货', '2-Q2-A-1-8.xml', 'RECEIPT', '1', 18, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 334, '2车2取货点A-1-9存货', '2-Q2-A-1-9.xml', 'RECEIPT', '1', 19, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 335, '2车2取货点A-1-10存货', '2-Q2-A-1-10.xml', 'RECEIPT', '1', 20, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 336, '2车2取货点B-0-1存货', '2-Q2-B-0-1.xml', 'RECEIPT', '1', 21, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 337, '2车2取货点B-0-2存货', '2-Q2-B-0-2.xml', 'RECEIPT', '1', 22, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 338, '2车2取货点B-0-3存货', '2-Q2-B-0-3.xml', 'RECEIPT', '1', 23, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 339, '2车2取货点B-0-4存货', '2-Q2-B-0-4.xml', 'RECEIPT', '1', 24, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 340, '2车2取货点B-0-5存货', '2-Q2-B-0-5.xml', 'RECEIPT', '1', 25, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 341, '2车2取货点B-0-6存货', '2-Q2-B-0-6.xml', 'RECEIPT', '1', 26, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 342, '2车2取货点B-0-7存货', '2-Q2-B-0-7.xml', 'RECEIPT', '1', 27, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 343, '2车2取货点B-0-8存货', '2-Q2-B-0-8.xml', 'RECEIPT', '1', 28, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 344, '2车2取货点B-0-9存货', '2-Q2-B-0-9.xml', 'RECEIPT', '1', 29, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 345, '2车2取货点B-0-10存货', '2-Q2-B-0-10.xml', 'RECEIPT', '1', 30, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 346, '2车2取货点B-1-1存货', '2-Q2-B-1-1.xml', 'RECEIPT', '1', 31, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 347, '2车2取货点B-1-2存货', '2-Q2-B-1-2.xml', 'RECEIPT', '1', 32, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 348, '2车2取货点B-1-3存货', '2-Q2-B-1-3.xml', 'RECEIPT', '1', 33, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 349, '2车2取货点B-1-4存货', '2-Q2-B-1-4.xml', 'RECEIPT', '1', 34, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 350, '2车2取货点B-1-5存货', '2-Q2-B-1-5.xml', 'RECEIPT', '1', 35, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 351, '2车2取货点B-1-6存货', '2-Q2-B-1-6.xml', 'RECEIPT', '1', 36, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 352, '2车2取货点B-1-7存货', '2-Q2-B-1-7.xml', 'RECEIPT', '1', 37, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 353, '2车2取货点B-1-8存货', '2-Q2-B-1-8.xml', 'RECEIPT', '1', 38, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 354, '2车2取货点B-1-9存货', '2-Q2-B-1-9.xml', 'RECEIPT', '1', 39, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 355, '2车2取货点B-1-10存货', '2-Q2-B-1-10.xml', 'RECEIPT', '1', 40, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 379, '2车1取货点A-0-1取货', '2-F1-A-0-1.xml', 'SHIPMENT', '1', 1, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 380, '2车1取货点A-0-2取货', '2-F1-A-0-2.xml', 'SHIPMENT', '1', 2, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 381, '2车1取货点A-0-3取货', '2-F1-A-0-3.xml', 'SHIPMENT', '1', 3, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 382, '2车1取货点A-0-4取货', '2-F1-A-0-4.xml', 'SHIPMENT', '1', 4, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 383, '2车1取货点A-0-5取货', '2-F1-A-0-5.xml', 'SHIPMENT', '1', 5, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 384, '2车1取货点A-0-6取货', '2-F1-A-0-6.xml', 'SHIPMENT', '1', 6, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 385, '2车1取货点A-0-7取货', '2-F1-A-0-7.xml', 'SHIPMENT', '1', 7, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 386, '2车1取货点A-0-8取货', '2-F1-A-0-8.xml', 'SHIPMENT', '1', 8, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 387, '2车1取货点A-0-9取货', '2-F1-A-0-9.xml', 'SHIPMENT', '1', 9, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 388, '2车1取货点A-0-10取货', '2-F1-A-0-10.xml', 'SHIPMENT', '1', 10, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 389, '2车1取货点A-1-1取货', '2-F1-A-1-1.xml', 'SHIPMENT', '1', 11, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 390, '2车1取货点A-1-2取货', '2-F1-A-1-2.xml', 'SHIPMENT', '1', 12, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 391, '2车1取货点A-1-3取货', '2-F1-A-1-3.xml', 'SHIPMENT', '1', 13, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 392, '2车1取货点A-1-4取货', '2-F1-A-1-4.xml', 'SHIPMENT', '1', 14, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 393, '2车1取货点A-1-5取货', '2-F1-A-1-5.xml', 'SHIPMENT', '1', 15, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 394, '2车1取货点A-1-6取货', '2-F1-A-1-6.xml', 'SHIPMENT', '1', 16, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 395, '2车1取货点A-1-7取货', '2-F1-A-1-7.xml', 'SHIPMENT', '1', 17, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 396, '2车1取货点A-1-8取货', '2-F1-A-1-8.xml', 'SHIPMENT', '1', 18, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 397, '2车1取货点A-1-9取货', '2-F1-A-1-9.xml', 'SHIPMENT', '1', 19, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 398, '2车1取货点A-1-10取货', '2-F1-A-1-10.xml', 'SHIPMENT', '1', 20, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 399, '2车1取货点B-0-1取货', '2-F1-B-0-1.xml', 'SHIPMENT', '1', 21, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 400, '2车1取货点B-0-2取货', '2-F1-B-0-2.xml', 'SHIPMENT', '1', 22, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 401, '2车1取货点B-0-3取货', '2-F1-B-0-3.xml', 'SHIPMENT', '1', 23, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 402, '2车1取货点B-0-4取货', '2-F1-B-0-4.xml', 'SHIPMENT', '1', 24, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 403, '2车1取货点B-0-5取货', '2-F1-B-0-5.xml', 'SHIPMENT', '1', 25, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 404, '2车1取货点B-0-6取货', '2-F1-B-0-6.xml', 'SHIPMENT', '1', 26, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 405, '2车1取货点B-0-7取货', '2-F1-B-0-7.xml', 'SHIPMENT', '1', 27, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 406, '2车1取货点B-0-8取货', '2-F1-B-0-8.xml', 'SHIPMENT', '1', 28, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 407, '2车1取货点B-0-9取货', '2-F1-B-0-9.xml', 'SHIPMENT', '1', 29, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 408, '2车1取货点B-0-10取货', '2-F1-B-0-10.xml', 'SHIPMENT', '1', 30, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 409, '2车1取货点B-1-1取货', '2-F1-B-1-1.xml', 'SHIPMENT', '1', 31, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 410, '2车1取货点B-1-2取货', '2-F1-B-1-2.xml', 'SHIPMENT', '1', 32, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 411, '2车1取货点B-1-3取货', '2-F1-B-1-3.xml', 'SHIPMENT', '1', 33, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 412, '2车1取货点B-1-4取货', '2-F1-B-1-4.xml', 'SHIPMENT', '1', 34, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 413, '2车1取货点B-1-5取货', '2-F1-B-1-5.xml', 'SHIPMENT', '1', 35, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 414, '2车1取货点B-1-6取货', '2-F1-B-1-6.xml', 'SHIPMENT', '1', 36, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 415, '2车1取货点B-1-7取货', '2-F1-B-1-7.xml', 'SHIPMENT', '1', 37, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 416, '2车1取货点B-1-8取货', '2-F1-B-1-8.xml', 'SHIPMENT', '1', 38, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 417, '2车1取货点B-1-9取货', '2-F1-B-1-9.xml', 'SHIPMENT', '1', 39, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 418, '2车1取货点B-1-10取货', '2-F1-B-1-10.xml', 'SHIPMENT', '1', 40, 1, 2, 1, 1, 0, 0, '2019-06-03 12:27:58'),
	(1, 442, '2车2取货点A-0-1取货', '2-F2-A-0-1.xml', 'SHIPMENT', '1', 1, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 443, '2车2取货点A-0-2取货', '2-F2-A-0-2.xml', 'SHIPMENT', '1', 2, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 444, '2车2取货点A-0-3取货', '2-F2-A-0-3.xml', 'SHIPMENT', '1', 3, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 445, '2车2取货点A-0-4取货', '2-F2-A-0-4.xml', 'SHIPMENT', '1', 4, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 446, '2车2取货点A-0-5取货', '2-F2-A-0-5.xml', 'SHIPMENT', '1', 5, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 447, '2车2取货点A-0-6取货', '2-F2-A-0-6.xml', 'SHIPMENT', '1', 6, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 448, '2车2取货点A-0-7取货', '2-F2-A-0-7.xml', 'SHIPMENT', '1', 7, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 449, '2车2取货点A-0-8取货', '2-F2-A-0-8.xml', 'SHIPMENT', '1', 8, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 450, '2车2取货点A-0-9取货', '2-F2-A-0-9.xml', 'SHIPMENT', '1', 9, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 451, '2车2取货点A-0-10取货', '2-F2-A-0-10.xml', 'SHIPMENT', '1', 10, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 452, '2车2取货点A-1-1取货', '2-F2-A-1-1.xml', 'SHIPMENT', '1', 11, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 453, '2车2取货点A-1-2取货', '2-F2-A-1-2.xml', 'SHIPMENT', '1', 12, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 454, '2车2取货点A-1-3取货', '2-F2-A-1-3.xml', 'SHIPMENT', '1', 13, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 455, '2车2取货点A-1-4取货', '2-F2-A-1-4.xml', 'SHIPMENT', '1', 14, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 456, '2车2取货点A-1-5取货', '2-F2-A-1-5.xml', 'SHIPMENT', '1', 15, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 457, '2车2取货点A-1-6取货', '2-F2-A-1-6.xml', 'SHIPMENT', '1', 16, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 458, '2车2取货点A-1-7取货', '2-F2-A-1-7.xml', 'SHIPMENT', '1', 17, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 459, '2车2取货点A-1-8取货', '2-F2-A-1-8.xml', 'SHIPMENT', '1', 18, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 460, '2车2取货点A-1-9取货', '2-F2-A-1-9.xml', 'SHIPMENT', '1', 19, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 461, '2车2取货点A-1-10取货', '2-F2-A-1-10.xml', 'SHIPMENT', '1', 20, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 462, '2车2取货点B-0-1取货', '2-F2-B-0-1.xml', 'SHIPMENT', '1', 21, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 463, '2车2取货点B-0-2取货', '2-F2-B-0-2.xml', 'SHIPMENT', '1', 22, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 464, '2车2取货点B-0-3取货', '2-F2-B-0-3.xml', 'SHIPMENT', '1', 23, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 465, '2车2取货点B-0-4取货', '2-F2-B-0-4.xml', 'SHIPMENT', '1', 24, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 466, '2车2取货点B-0-5取货', '2-F2-B-0-5.xml', 'SHIPMENT', '1', 25, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 467, '2车2取货点B-0-6取货', '2-F2-B-0-6.xml', 'SHIPMENT', '1', 26, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 468, '2车2取货点B-0-7取货', '2-F2-B-0-7.xml', 'SHIPMENT', '1', 27, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 469, '2车2取货点B-0-8取货', '2-F2-B-0-8.xml', 'SHIPMENT', '1', 28, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 470, '2车2取货点B-0-9取货', '2-F2-B-0-9.xml', 'SHIPMENT', '1', 29, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 471, '2车2取货点B-0-10取货', '2-F2-B-0-10.xml', 'SHIPMENT', '1', 30, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 472, '2车2取货点B-1-1取货', '2-F2-B-1-1.xml', 'SHIPMENT', '1', 31, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 473, '2车2取货点B-1-2取货', '2-F2-B-1-2.xml', 'SHIPMENT', '1', 32, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 474, '2车2取货点B-1-3取货', '2-F2-B-1-3.xml', 'SHIPMENT', '1', 33, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 475, '2车2取货点B-1-4取货', '2-F2-B-1-4.xml', 'SHIPMENT', '1', 34, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 476, '2车2取货点B-1-5取货', '2-F2-B-1-5.xml', 'SHIPMENT', '1', 35, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 477, '2车2取货点B-1-6取货', '2-F2-B-1-6.xml', 'SHIPMENT', '1', 36, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 478, '2车2取货点B-1-7取货', '2-F2-B-1-7.xml', 'SHIPMENT', '1', 37, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 479, '2车2取货点B-1-8取货', '2-F2-B-1-8.xml', 'SHIPMENT', '1', 38, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 480, '2车2取货点B-1-9取货', '2-F2-B-1-9.xml', 'SHIPMENT', '1', 39, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59'),
	(1, 481, '2车2取货点B-1-10取货', '2-F2-B-1-10.xml', 'SHIPMENT', '1', 40, 1, 2, 2, 1, 0, 0, '2019-06-03 12:27:59');
/*!40000 ALTER TABLE `singletask_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
