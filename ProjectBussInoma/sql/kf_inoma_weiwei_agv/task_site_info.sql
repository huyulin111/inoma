-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- Server version:               10.3.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL 版本:                  10.1.0.5492
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table kf_inoma_weiwei_agv.task_site_info
DROP TABLE IF EXISTS `task_site_info`;
CREATE TABLE IF NOT EXISTS `task_site_info` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sitename` varchar(50) NOT NULL COMMENT '站点名称',
  `sitecode` varchar(50) NOT NULL COMMENT '站点在终端的编码',
  `line` int(1) NOT NULL COMMENT '站点如果是货位站点，在第几行',
  `updatetime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改时间',
  `sitetype` varchar(50) DEFAULT '1',
  `keyid` int(2) DEFAULT NULL COMMENT '当sitetype不为货位时，站点对应的key',
  `json` varchar(500) DEFAULT NULL COMMENT '站点所在楼层',
  `createtime` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `delflag` int(1) DEFAULT 0 COMMENT '删除标志（DELFLAG）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sitename` (`sitename`),
  UNIQUE KEY `sitecode` (`sitecode`)
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8 COMMENT='任务站点信息表';

-- Dumping data for table kf_inoma_weiwei_agv.task_site_info: ~72 rows (approximately)
DELETE FROM `task_site_info`;
/*!40000 ALTER TABLE `task_site_info` DISABLE KEYS */;
INSERT INTO `task_site_info` (`id`, `sitename`, `sitecode`, `line`, `updatetime`, `sitetype`, `keyid`, `json`, `createtime`, `delflag`) VALUES
	(28, '28号站点', '1c00', 0, '2019-02-14 16:40:29', 'E', NULL, '{"layer":3}', '2018-10-25 11:34:20', 0),
	(29, '29号站点', '1d00', 0, '2019-01-28 15:24:25', '0', NULL, '{"layer":3}', '2018-10-25 11:34:20', 0),
	(31, '31号站点', '1f00', 0, '2019-01-28 15:24:26', '0', NULL, '{"layer":3}', '2018-10-25 11:34:20', 0),
	(32, '32号站点', '2000', 0, '2019-01-28 15:24:27', '0', NULL, '{"layer":3}', '2018-10-25 11:34:20', 0),
	(34, '34号站点', '2200', 0, '2019-01-28 15:24:28', '0', NULL, '{"layer":3}', '2018-10-25 11:34:20', 0),
	(35, '35号站点', '2300', 0, '2019-01-28 15:24:29', '0', NULL, '{"layer":3}', '2018-10-25 11:34:20', 0),
	(36, '36号站点', '2400', 0, '2019-01-28 15:24:30', '0', NULL, '{"layer":3}', '2018-10-25 11:34:20', 0),
	(37, '37号站点', '2500', 0, '2019-02-22 15:57:09', '0', 201, '{"layer":3}', '2018-10-25 11:34:20', 0),
	(38, '38号站点', '2600', 0, '2019-01-28 15:24:32', '0', NULL, '{"layer":3}', '2018-10-25 11:34:20', 0),
	(39, '39号站点', '2700', 0, '2019-01-28 15:24:33', '0', NULL, '{"layer":3}', '2019-01-27 16:27:30', 0),
	(40, '40号站点', '2800', 0, '2019-01-28 15:24:36', '0', NULL, '{"layer":3}', '2019-01-27 16:28:35', 0),
	(41, '41号站点', '2900', 0, '2019-01-28 15:24:37', '0', NULL, '{"layer":3}', '2019-01-27 16:29:57', 0),
	(42, '42号站点', '2a00', 0, '2019-01-28 15:24:38', '0', NULL, '{"layer":3}', '2019-01-27 16:30:19', 0),
	(43, '43号站点', '2b00', 0, '2019-01-28 15:24:39', '0', NULL, '{"layer":3}', '2019-01-27 16:30:42', 0),
	(44, '44号站点', '2c00', 0, '2019-01-28 15:24:40', '0', NULL, '{"layer":3}', '2019-01-27 16:31:09', 0),
	(45, '45号站点', '2d00', 0, '2019-01-28 15:24:41', '0', NULL, '{"layer":3}', '2019-01-27 16:31:26', 0),
	(46, '46号站点', '2e00', 0, '2019-01-28 15:24:41', '0', NULL, '{"layer":3}', '2019-01-27 17:10:41', 0),
	(47, '47号站点', '2f00', 0, '2019-01-28 15:24:42', '0', NULL, '{"layer":3}', '2019-01-27 16:31:41', 0),
	(49, '49号站点', '3100', 0, '2019-01-28 15:24:43', '0', NULL, '{"layer":3}', '2019-01-27 16:32:26', 0),
	(50, '50号站点', '3200', 0, '2019-01-28 15:24:44', '0', NULL, '{"layer":3}', '2019-01-27 16:34:56', 0),
	(53, '53号站点', '3500', 0, '2019-02-14 16:42:33', 'F', NULL, '{"layer":1}', '2019-01-28 14:52:49', 0),
	(54, '54号站点', '3600', 0, '2019-01-28 15:24:46', '0', NULL, '{"layer":3}', '2019-01-27 16:36:38', 0),
	(55, '55号站点', '3700', 0, '2019-01-28 15:24:53', '0', NULL, '{"layer":3}', '2019-01-27 16:37:47', 0),
	(56, '56号站点', '3800', 0, '2019-02-14 16:42:30', 'E', NULL, '{"layer":1}', '2019-01-28 14:53:55', 0),
	(57, '57号站点', '3900', 0, '2019-01-28 15:24:59', '0', NULL, '{"layer":3}', '2019-01-27 16:38:03', 0),
	(58, '58号站点', '3a00', 0, '2019-01-28 15:25:00', '0', NULL, '{"layer":3}', '2019-01-27 16:38:20', 0),
	(59, '59号站点', '3b00', 0, '2019-01-28 15:25:00', 'B', 202, '{"layer":3}', '2019-01-27 16:38:38', 0),
	(60, '60号站点', '3c00', 0, '2019-01-28 15:25:01', 'B', 203, '{"layer":3}', '2019-01-27 16:39:00', 0),
	(61, '61号站点', '3d00', 0, '2019-01-31 09:00:45', 'C', 301, '{"layer":1}', '2019-01-27 16:39:15', 0),
	(62, '62号站点', '3e00', 0, '2019-02-14 16:43:24', 'F', NULL, '{"layer":3}', '2019-01-27 16:39:31', 0),
	(63, '63号站点', '3f00', 0, '2019-02-14 16:43:36', 'E', NULL, '{"layer":3}', '2019-01-27 16:39:47', 0),
	(64, '64号站点', '4000', 0, '2019-01-28 15:25:11', 'B', 203, '{"layer":3}', '2019-01-27 16:40:02', 0),
	(65, '65号站点', '4100', 0, '2019-01-28 15:25:11', '0', NULL, '{"layer":3}', '2019-01-27 16:40:20', 0),
	(66, '66号站点', '4200', 0, '2019-01-28 15:25:13', '0', NULL, '{"layer":3}', '2019-01-27 16:42:37', 0),
	(67, '67号站点', '4300', 0, '2019-01-31 09:00:41', 'C', 301, '{"layer":0}', '2019-01-27 16:42:50', 0),
	(68, '68号站点', '4400', 0, '2019-01-28 15:25:16', 'C', 301, '{"layer":3}', '2019-01-27 16:43:08', 0),
	(70, '70号站点', '4600', 0, '2019-01-28 15:25:17', '0', NULL, '{"layer":3}', '2019-01-27 16:43:43', 0),
	(71, '71号站点', '4700', 0, '2019-01-28 15:25:19', '0', NULL, '{"layer":3}', '2019-01-28 11:20:50', 0),
	(72, '72号站点', '4800', 0, '2019-01-28 15:25:18', '0', NULL, '{"layer":3}', '2019-01-27 16:43:59', 0),
	(73, '73号站点', '4900', 0, '2019-01-28 15:25:20', '0', NULL, '{"layer":3}', '2019-01-27 16:44:14', 0),
	(74, '74号站点', '4a00', 0, '2019-01-28 15:25:21', '0', NULL, '{"layer":3}', '2019-01-27 16:44:42', 0),
	(75, '75号站点', '4b00', 0, '2019-01-28 15:25:22', '0', NULL, '{"layer":3}', '2019-01-27 16:44:54', 0),
	(76, '76号站点', '4c00', 0, '2019-01-28 15:25:22', '0', NULL, '{"layer":3}', '2019-01-27 16:45:15', 0),
	(77, '77号站点', '4d00', 0, '2019-01-28 15:25:23', '0', NULL, '{"layer":3}', '2019-01-27 16:45:35', 0),
	(78, '78号站点', '4e00', 0, '2019-01-28 15:25:24', '0', NULL, '{"layer":3}', '2019-01-27 16:45:48', 0),
	(79, '79号站点', '4f00', 0, '2019-02-22 15:27:47', '0', 201, '{"layer":3}', '2019-01-27 16:46:01', 0),
	(80, '80号站点', '5000', 0, '2019-01-28 15:25:25', '0', NULL, '{"layer":3}', '2019-01-27 16:46:24', 0),
	(81, '81号站点', '5100', 0, '2019-01-28 15:25:26', '0', NULL, '{"layer":3}', '2019-01-27 16:46:41', 0),
	(82, '82号站点', '5200', 0, '2019-01-28 15:25:27', '0', NULL, '{"layer":3}', '2019-01-27 16:46:54', 0),
	(83, '83号站点', '5300', 0, '2019-01-28 15:25:28', '0', NULL, '{"layer":3}', '2019-01-27 16:47:05', 0),
	(84, '84号站点', '5400', 0, '2019-01-28 15:25:31', '0', NULL, '{"layer":3}', '2019-01-27 16:47:24', 0),
	(85, '85号站点', '5500', 0, '2019-01-28 15:25:29', '0', NULL, '{"layer":3}', '2019-01-27 16:47:40', 0),
	(86, '86号站点', '5600', 0, '2019-01-28 15:25:32', '0', NULL, '{"layer":3}', '2019-01-27 16:47:53', 0),
	(87, '87号站点', '5700', 0, '2019-02-14 16:41:52', 'F', NULL, '{"layer":3}', '2019-01-27 16:48:07', 0),
	(88, '88号站点', '5800', 0, '2019-02-14 14:03:10', '0', NULL, '{"layer":2}', '2019-01-28 11:11:19', 0),
	(89, '89号站点', '5900', 0, '2019-02-14 16:43:03', 'E', NULL, '{"layer":2}', '2019-01-28 11:12:16', 0),
	(90, '90号站点', '5a00', 0, '2019-02-14 16:43:06', 'F', NULL, '{"layer":2}', '2019-01-28 11:12:54', 0),
	(91, '91号站点', '5b00', 0, '2019-01-28 15:25:54', '0', NULL, '{"layer":3}', '2019-01-28 11:13:16', 0),
	(92, '92号站点', '5c00', 0, '2019-01-31 09:00:25', 'B', 202, '{"layer":3}', '2019-01-28 11:13:36', 0),
	(93, '93号站点', '5d00', 0, '2019-01-31 09:51:15', 'C', 301, '{"layer":2}', '2019-01-31 09:50:57', 0),
	(94, '94号站点', '5e00', 0, '2019-02-14 13:50:30', '0', NULL, '{"layer":3}', '2019-02-14 13:50:26', 0),
	(95, '95号站点', '5f00', 0, '2019-02-14 13:51:02', '0', NULL, '{"layer":3}', '2019-02-14 13:51:02', 0),
	(96, '96号站点', '6000', 0, '2019-02-14 13:51:43', '0', NULL, '{"layer":3}', '2019-02-14 13:51:43', 0),
	(97, '97号站点', '6100', 0, '2019-02-14 13:52:19', '0', NULL, '{"layer":3}', '2019-02-14 13:52:19', 0),
	(98, '98号站点', '6200', 0, '2019-02-14 13:52:40', '0', NULL, '{"layer":3}', '2019-02-14 13:52:40', 0),
	(99, '99号站点', '6300', 0, '2019-02-14 13:53:05', '0', NULL, '{"layer":3}', '2019-02-14 13:53:05', 0),
	(102, '100号站点', '6600', 0, '2019-02-25 16:51:11', '0', NULL, '{"layer":3}', '2019-02-14 13:53:27', 0),
	(103, '101号站点', '6700', 0, '2019-02-25 16:51:19', '0', NULL, '{"layer":3}', '2019-02-14 13:53:46', 0),
	(104, '104号站点', '6800', 0, '2019-02-25 16:51:49', '0', NULL, '{"layer":3}', '2019-02-25 16:51:46', 0),
	(105, '105号站点', '6900', 0, '2019-02-25 16:56:33', 'F', NULL, '{"layer":3}', '2019-02-25 16:52:12', 0),
	(106, '106号站点', '6a00', 0, '2019-02-25 16:56:36', 'E', NULL, '{"layer":3}', '2019-02-25 16:52:56', 0),
	(107, '107号站点', '6b00', 0, '2019-02-25 16:53:25', '0', NULL, '{"layer":3}', '2019-02-25 16:53:25', 0);
/*!40000 ALTER TABLE `task_site_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
