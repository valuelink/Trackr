/*
 Navicat MySQL Data Transfer

 Source Server         : 123.57.240.11-root
 Source Server Type    : MySQL
 Source Server Version : 50542
 Source Host           : localhost
 Source Database       : trackr

 Target Server Type    : MySQL
 Target Server Version : 50542
 File Encoding         : utf-8

 Date: 07/24/2017 16:47:14 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tb_authority`
-- ----------------------------
DROP TABLE IF EXISTS `tb_authority`;
CREATE TABLE `tb_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL COMMENT '权限类型，用户或者角色',
  `type_id` bigint(20) NOT NULL COMMENT '所属用户或者角色ID',
  `authority` varchar(50) NOT NULL DEFAULT '' COMMENT '权限值',
  `creator_id` varchar(32) DEFAULT NULL COMMENT '创建者的ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tb_authority`
-- ----------------------------
BEGIN;
INSERT INTO `tb_authority` VALUES ('1', 'ROLE', '1', 'ROLE_USER', '1', '2017-06-06 16:36:37', '2017-06-06 16:36:37'), ('2', 'ROLE', '1', 'ROLE_USER', '1', '2017-06-06 16:49:54', '2017-06-06 16:49:54');
COMMIT;

-- ----------------------------
--  Table structure for `tb_code`
-- ----------------------------
DROP TABLE IF EXISTS `tb_code`;
CREATE TABLE `tb_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='字典管理';

-- ----------------------------
--  Records of `tb_code`
-- ----------------------------
BEGIN;
INSERT INTO `tb_code` VALUES ('1', '行业信息', '0', '1', '2017-06-10 11:51:42', '2017-06-10 11:51:42'), ('2', '评估类型', '0', '1', '2017-06-10 12:27:24', '2017-06-10 12:27:24');
COMMIT;

-- ----------------------------
--  Table structure for `tb_code_value`
-- ----------------------------
DROP TABLE IF EXISTS `tb_code_value`;
CREATE TABLE `tb_code_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_id` int(11) NOT NULL COMMENT 'code的id',
  `name` varchar(100) DEFAULT NULL COMMENT '字典实际内容',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='字典内容';

-- ----------------------------
--  Records of `tb_code_value`
-- ----------------------------
BEGIN;
INSERT INTO `tb_code_value` VALUES ('1', '1', '互联网', '互联网', '0', '0', '1', '2017-06-10 11:51:52', '2017-06-10 11:51:52');
COMMIT;

-- ----------------------------
--  Table structure for `tb_company`
-- ----------------------------
DROP TABLE IF EXISTS `tb_company`;
CREATE TABLE `tb_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `company_number` varchar(32) NOT NULL COMMENT '客户编号，客户号：C+客户编号_年份_行业属性，例如：C0002_2015_enery',
  `master` tinyint(1) NOT NULL COMMENT '是否是主公司，1：是 0：否\n0代表着为关联公司',
  `master_id` int(11) NOT NULL DEFAULT '0' COMMENT '如果是关联公司，则该字段为主公司id，如果是主公司，则该字段值为0',
  `associated_count` tinyint(4) NOT NULL DEFAULT '0' COMMENT '关联公司数，如果是关联公司，则该值为0',
  `company_name` varchar(64) NOT NULL COMMENT '公司名称（全称）',
  `abbr_name` varchar(32) DEFAULT NULL COMMENT '公司简称',
  `industry_id` int(11) NOT NULL COMMENT '所属行业id',
  `province_id` int(11) DEFAULT NULL COMMENT '省id',
  `city_id` int(11) DEFAULT NULL COMMENT '城市id',
  `address` varchar(128) DEFAULT NULL COMMENT '地址',
  `web_site` varchar(255) DEFAULT NULL COMMENT '网址',
  `telephone` varchar(16) DEFAULT NULL COMMENT '电话',
  `fax` varchar(16) DEFAULT NULL COMMENT '传真',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0: 删除，1: 有效',
  `creator_id` int(11) NOT NULL COMMENT '创建者id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  `email` varchar(255) DEFAULT NULL,
  `location_en_name` varchar(255) DEFAULT NULL,
  `sign_code` char(1) NOT NULL COMMENT '签约代号,主公司是A,关联公司从B顺序往下排列',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='客户/公司';

-- ----------------------------
--  Records of `tb_company`
-- ----------------------------
BEGIN;
INSERT INTO `tb_company` VALUES ('1', 'C0001_2016_internet', '1', '0', '1', '北京58同城有限公司', '58同城', '12', '101', '103', '北京市海淀区', 'http://www.58.com', '', '', '1', '1', '2016-07-26 18:56:05', '2016-07-26 18:56:44', 'james.chi@valuelink.cn', null, ''), ('2', 'C0002_2016_internet', '0', '1', '0', '58快递', '58快递', '12', '101', '102', '北京市海淀区', '', '', '', '1', '1', '2016-07-26 18:56:44', '2016-07-26 18:56:44', 'james.chi@valuelink.cn', null, ''), ('3', 'C1003-BJ', '1', '0', '1', '北京美团有限公司', '美团', '12', '101', '102', '北京市朝阳区望京鹏景阁大厦2层', 'http://www.baidu.com', '010-12345678', '010-12345678', '1', '1', '2016-10-09 19:28:29', '2016-10-09 19:29:11', 'james.chi@valuelink.cn', 'BJ', ''), ('4', 'C1004-SH', '0', '3', '0', '上海美团有限公司', '上海美团', '12', '101', '103', '北京市朝阳区望京鹏景阁大厦2层', 'http://www.baidu.com', '010-12345678', '010-12345678', '1', '1', '2016-10-09 19:29:11', '2016-10-09 19:29:11', 'james.chi@valuelink.cn', 'SH', ''), ('5', 'C1003-BJ', '1', '0', '0', '北京网秦天下科技有限公司', '网秦', '12', '101', '109', '', 'http://www.netqin.cn', '', '', '1', '11', '2016-10-21 16:15:21', '2016-10-21 16:15:21', 'project_netqin@valuelink.cn', 'BJ', 'A'), ('6', 'C1004-SH', '1', '0', '0', '联络互动有限公司', '联络互动', '13', '555', '556', '浙江省杭州市', 'http://dd.com', '', '', '1', '1', '2016-11-25 15:39:36', '2016-11-25 15:40:20', 'project_lihd@valuelink.cn', 'SH', 'A'), ('7', 'C1005-BJ', '1', '0', '1', '北京美团科技有限公司', '美团', '12', '101', '102', '', '', '', '', '1', '1', '2016-12-27 14:29:12', '2017-05-12 10:48:11', 'james.chi@valuelink.cn', 'BJ', 'A'), ('8', 'C1005-BJ', '0', '7', '0', '美团信息技术有限公司', '美团', '13', '101', '102', '', '', '', '', '1', '1', '2016-12-27 14:33:26', '2016-12-27 14:33:26', 'james.chi@valuelink.cn', 'SH', 'B'), ('9', 'C1006-BJ', '1', '0', '1', '好未来有限公司', '好未来', '12', '101', '102', '', '', '', '', '1', '1', '2017-04-21 17:46:18', '2017-04-21 17:46:37', 'james.chi@valuelink.cn', 'BJ', 'A'), ('10', 'C1006-BJ', '0', '9', '0', '学而思', '好未来', '12', '101', '102', '', '', '', '', '1', '1', '2017-04-21 17:46:37', '2017-04-21 17:46:37', 'james.chi@valuelink.cn', 'BJ', 'B'), ('11', 'C1007-BJ', '1', '0', '0', '趣分期有限公司', '趣分期', '13', '101', '102', '北京', '', '', '', '1', '1', '2017-04-28 16:33:19', '2017-05-13 14:40:27', 'zhanghuijuan@valuelink.cn', 'BJ', 'A'), ('12', 'C1008-BJ', '1', '0', '0', '华盖医疗健康创业投资成都合伙企业（有限合伙） ', '华盖', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-25 15:55:49', '2017-05-25 16:09:27', 'project_huagai@valuelink.cn', 'BJ', 'A'), ('15', 'C1011-BJ', '1', '0', '0', '北京航美盛世广告有限公司', '航美', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-25 16:50:40', '2017-05-25 17:11:33', 'project_airmedia@valuelink.cn', 'BJ', 'A'), ('16', 'C1010-SH', '1', '0', '0', '成都维仕小额贷款有限公司', '成都维仕', '13', '101', '102', '', '', '', '', '1', '1', '2017-05-25 17:22:01', '2017-05-25 17:22:01', 'project_weishi@valuelink.cn', 'SH', 'A'), ('17', 'C1011-BJ', '1', '0', '0', '北京红黄蓝儿童教育科技发展有限公司', '红黄蓝', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-25 17:23:32', '2017-05-25 17:23:32', 'project_hhl@valuelink.cn', 'BJ', 'A'), ('18', 'C1012-BJ', '1', '0', '0', '北京融世纪信息技术有限公司 ', '融世纪', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-25 17:25:05', '2017-05-25 17:25:05', 'project_rong@valuelink.cn', 'BJ', 'A'), ('19', 'C1013-BJ', '1', '0', '0', '北京嘀嘀无限科技发展有限公司', '滴滴', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-26 13:57:08', '2017-05-31 16:20:01', 'project_didi@valueink.cn', 'BJ', 'A'), ('20', 'C1014-SH', '1', '0', '0', '和讯信息科技有限公司 ', '和讯', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-26 14:50:16', '2017-05-26 15:03:18', 'project_hxkj@valuelink.cn', 'BJ', 'A'), ('21', 'C1015-SH', '1', '0', '0', '上海汉钟精机股份有限公司', '汉钟精机', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-26 15:08:16', '2017-05-26 15:09:32', 'project_trimet@valuelink.cn', 'SH', 'A'), ('22', 'C1016-BJ', '1', '0', '0', '北京千橡网景科技发展有限公司 ', '人人', '12', '101', '102', '', '', '', '', '1', '1', '2017-06-01 20:00:28', '2017-06-01 22:04:19', 'project_renren@valuelink.cn', 'BJ', 'A');
COMMIT;

-- ----------------------------
--  Table structure for `tb_project`
-- ----------------------------
DROP TABLE IF EXISTS `tb_project`;
CREATE TABLE `tb_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `name` varchar(128) NOT NULL COMMENT '项目名称',
  `proc_inst_id` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `company_id` int(11) NOT NULL COMMENT '公司(客户)id',
  `risk_level` int(2) DEFAULT NULL COMMENT '财务风险等级',
  `economic_behavior` varchar(255) DEFAULT NULL COMMENT '经济行为',
  `purpose` tinyint(4) DEFAULT '1' COMMENT '评估目的',
  `valuate_content` varchar(40) DEFAULT '' COMMENT '评估内容',
  `valuate_type` varchar(40) NOT NULL DEFAULT '1' COMMENT '评估类型(内容)',
  `valuate_type_other` varchar(60) DEFAULT NULL COMMENT '评估类型为其他填写内容',
  `report_type` int(2) DEFAULT NULL COMMENT '报告类型',
  `valuate_time` varchar(150) NOT NULL COMMENT '评估时间(基准日) 按照年份存储，可以是多个,用逗号分隔,如：2014,2015,2017',
  `delegate_id` int(11) NOT NULL COMMENT '受托方id',
  `report_id` int(11) DEFAULT NULL COMMENT '报告出具公司ID，与受托方相同，可自行选择',
  `amount` int(11) NOT NULL COMMENT '总金额',
  `currency` tinyint(1) NOT NULL DEFAULT '1' COMMENT '币种，1: 人民币 2: 美元 3: 港币',
  `pay_scale` char(50) NOT NULL COMMENT '付款比例，中间用管道符隔开，例如：4|4|2',
  `report_name` varchar(255) DEFAULT NULL COMMENT '报告出具公司名称',
  `note` varchar(512) NOT NULL COMMENT '备注',
  `creator_id` int(11) NOT NULL COMMENT '创建者ID',
  `status` varchar(50) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='立项申请';

-- ----------------------------
--  Records of `tb_project`
-- ----------------------------
BEGIN;
INSERT INTO `tb_project` VALUES ('6', '测试项目名称', '1401', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '80000', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-09 19:34:36', '2017-07-09 19:34:36'), ('7', '流程ID 测试', '1501', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-09 19:56:48', '2017-07-09 19:56:48'), ('8', '测试项目名称22', '1601', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-09 20:30:27', '2017-07-09 20:30:27'), ('10', '测试项目名称33', '2101', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-09 21:15:22', '2017-07-09 21:15:22'), ('11', '测试项目名称23', '3501', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-23 13:45:32', '2017-07-23 13:45:32'), ('12', '测试项目名称45', '3511', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-23 13:46:48', '2017-07-23 13:46:48'), ('13', '测试项目名称办理人', '3701', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-23 14:26:42', '2017-07-23 14:26:42'), ('14', '测试项目名称9', '3801', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '9000', '1', '4:4:2', null, '备注', '1', 'APPROVED', '2017-07-23 19:40:53', '2017-07-23 19:40:53'), ('15', '测试项目名称', '3905', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'APPROVED', '2017-07-23 19:50:24', '2017-07-23 19:50:24'), ('16', '测试项目名称', '3919', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'REJECTED', '2017-07-23 19:51:14', '2017-07-23 19:51:14'), ('17', '测试项目名称', '4001', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'REJECTED', '2017-07-23 19:52:10', '2017-07-23 19:52:10'), ('18', '测试项目名称', '4101', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'APPROVED', '2017-07-24 11:01:34', '2017-07-24 11:01:34'), ('19', '测试项目名称', '4201', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'APPROVED', '2017-07-24 12:07:35', '2017-07-24 12:07:35'), ('20', '测试项目名称', '4216', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'REJECTED', '2017-07-24 12:09:02', '2017-07-24 12:09:02'), ('21', '测试项目名称', '4301', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'REJECTED', '2017-07-24 12:18:19', '2017-07-24 12:18:19'), ('22', '测试项目名称', '4401', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'REJECTED', '2017-07-24 12:22:51', '2017-07-24 12:22:51'), ('23', '测试项目名称', '4416', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'APPROVED', '2017-07-24 12:27:04', '2017-07-24 12:27:04');
COMMIT;

-- ----------------------------
--  Table structure for `tb_role`
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `creator_id` varchar(32) NOT NULL COMMENT '通过后台，添加本角色的操作者的账号',
  `description` varchar(100) DEFAULT NULL COMMENT '描述信息',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '本记录最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
--  Records of `tb_role`
-- ----------------------------
BEGIN;
INSERT INTO `tb_role` VALUES ('1', '超级管理员', '1', '描述', '2017-06-06 16:35:23', '2017-06-06 16:35:23'), ('2', '普通员工', '1', '描述', '2017-06-06 16:50:36', '2017-07-24 15:03:02'), ('3', '合伙人', '1', '合伙人', '2017-07-24 15:03:26', '2017-07-24 15:03:28'), ('4', '财务', '1', '财务', '2017-07-24 15:04:05', '2017-07-24 15:04:07'), ('5', '同学', '1', '同学', '2017-07-24 15:04:02', '2017-07-24 15:04:04');
COMMIT;

-- ----------------------------
--  Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `login_name` varchar(32) NOT NULL COMMENT '登录名',
  `password` char(32) NOT NULL COMMENT '密码，MD5加密',
  `salt` char(16) NOT NULL COMMENT '密码盐',
  `real_name` varchar(16) NOT NULL COMMENT '真实姓名',
  `company_email` varchar(32) NOT NULL COMMENT '公司邮箱',
  `department_id` int(11) DEFAULT NULL COMMENT '部门id',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别 1: 男 0: 女',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机，手机登录名',
  `mobile_password` varchar(32) DEFAULT NULL COMMENT '手机登录密码，MD5加密',
  `mobile_create_time` datetime DEFAULT NULL COMMENT '手机端创建时间',
  `company_email_password` varchar(32) DEFAULT NULL COMMENT '公司邮箱密码，明文',
  `mail_signed` varchar(1024) DEFAULT NULL COMMENT '邮件签名档',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `login_ip` char(16) DEFAULT NULL COMMENT '本次登录ip',
  `login_time` datetime DEFAULT NULL COMMENT '本次登录时间',
  `last_login_ip` char(16) DEFAULT NULL COMMENT '上次登录ip',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0: 删除，1: 有效 2：冻结',
  `creator_id` int(11) NOT NULL COMMENT '创建者id',
  `sub_company` varchar(10) DEFAULT NULL COMMENT '分公司 BJ ：北京 SH 上海',
  `position` varchar(32) DEFAULT NULL,
  `emp_no` varchar(32) NOT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_001` (`login_name`),
  KEY `idx_user_002` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
--  Records of `tb_user`
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES ('1', 'admin@valuelink.cn', 'a8a5c529896103c4a8c831d4db2571fa', '8990923576109879', '管理员', 'message@valuelink.cn', null, '0', '1', '13888888888', 'a8a5c529896103c4a8c831d4db2571fa', '2016-03-30 10:53:21', '', '<p>_______________</p><p>这里有签名</p><p><img data-filename=\"\" src=\"/files/upload/20160422/20160422120835_240782_logo.jpg\" style=\"width: 50%;\"><br></p>', '', '127.0.0.1', '2017-06-01 15:59:32', '127.0.0.1', '2017-06-01 15:59:32', '1', '1', 'BJ', '总监', '1', '2016-03-30 10:53:21', '2017-06-01 15:59:44'), ('2', 'p1@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '合伙人', 'message@valuelink.cn', null, '1', '2', '', '', null, '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2017-06-01 17:06:47', '127.0.0.1', '2017-06-01 17:06:47', '1', '1', 'BJ', '合伙人', '2', '2016-03-30 10:57:46', '2017-06-01 17:06:58'), ('3', 'u1@valuelink.cn', '892a5ac14ec1cb6f907b98f7fbe04947', 'a22b2eff0504199a', '李先生', 'message@valuelink.cn', null, '1', '4', '', '', null, null, null, null, '127.0.0.1', '2017-06-01 17:41:20', '127.0.0.1', '2017-06-01 17:41:20', '1', '1', 'BJ', '合伙人', '3', '2016-03-30 10:58:07', '2017-06-01 17:41:32'), ('4', 'p2@valuelink.cn', '0350bd36c25d7093f913593a14dc2078', '258650f791164b18', '合伙人2', 'message@valuelink.cn', null, '1', '2', '', '', null, null, null, null, '127.0.0.1', '2017-05-16 16:41:31', '127.0.0.1', '2017-05-16 16:41:31', '1', '2', 'BJ', '合伙人', '4', '2016-04-14 13:25:28', '2017-05-16 16:41:48'), ('5', 'f1@valuelink.cn', '262f80263be33dcad7f98d4ec0cd5c5c', '8a34a50d87f62f93', '李先生', 'message@valuelink.cn', null, '1', '3', '13800138000', '262f80263be33dcad7f98d4ec0cd5c5c', '2016-04-26 10:53:48', null, '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2017-06-01 17:40:28', '127.0.0.1', '2017-06-01 17:40:28', '1', '1', 'BJ', '合伙人', '5', '2016-04-26 10:53:48', '2017-06-01 17:40:40'), ('16', 'celine.zhang@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '张嘉莉', 'celine.zhang@valuelink.cn', null, '1', '99', '18501616788', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2017-06-01 17:10:34', '127.0.0.1', '2017-06-01 17:10:34', '1', '1', 'BJ', '总监', '12', '2016-12-25 18:53:09', '2017-06-01 17:10:46'), ('17', 'roger@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '李丁丁', 'roger@valuelink.cn', null, '1', '2', '18611322758', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '合伙人', '13', '2016-12-25 18:53:09', '2016-12-25 19:25:11'), ('18', 'yan@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '闫冬', 'yan@valuelink.cn', null, '1', '2', '13811064075', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '合伙人', '14', '2016-12-25 18:53:09', '2016-12-25 19:31:21'), ('19', 'sunchuan@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '孙川', 'sunchuan@valuelink.cn', null, '1', '2', '15110118538', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '116.243.188.100', '2016-12-27 10:02:55', '116.243.188.100', '2016-12-27 10:02:55', '1', '1', 'BJ', '总监', '15', '2016-12-25 18:53:09', '2016-12-27 10:02:54'), ('20', 'luo@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '罗俊军', 'luo@valuelink.cn', null, '1', '2', '18618277965', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '合伙人', '16', '2016-12-25 18:53:09', '2016-12-25 19:30:19'), ('21', 'xiaonan@valuelink.cn', '5d0a4614697c38de08c381d84acec9a9', '01e6d62a9fdc08cd', '王晓男', 'xiaonan@valuelink.cn', null, '1', '2', '18911305429', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p><span style=\"font-size: 18px; line-height: 1.4;\">王晓男</span><br></p>', null, '123.119.185.170', '2017-01-20 17:16:18', '123.119.185.170', '2017-01-20 17:16:18', '1', '1', 'BJ', '合伙人', '17', '2016-12-25 18:53:09', '2017-01-20 17:16:17'), ('22', 'amy.yan@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '闫煜', 'amy.yan@valuelink.cn', '10', '1', '2', '13691238462', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理经理', '18', '2016-12-25 18:53:09', '2016-12-25 19:32:02'), ('23', 'carol.jiang@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '蒋丽楠', 'carol.jiang@valuelink.cn', '10', '1', '2', '18611176959', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '118.192.104.74', '2016-12-26 19:14:37', '118.192.104.74', '2016-12-26 19:14:37', '1', '1', 'BJ', '评估助理', '19', '2016-12-25 18:53:09', '2016-12-26 19:14:36'), ('24', 'cher.cao@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '曹雅洁', 'cher.cao@valuelink.cn', '10', '1', '2', '13707118325', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '118.192.104.74', '2016-12-26 10:10:27', '118.192.104.74', '2016-12-26 10:10:27', '1', '1', 'BJ', '评估助理经理', '20', '2016-12-25 18:53:09', '2016-12-26 10:10:27'), ('25', 'Nigel.liu@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '刘立同', 'Nigel.liu@valuelink.cn', '10', '1', '2', '13436550895', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '61.50.127.102', '2017-01-12 17:34:41', '61.50.127.102', '2017-01-12 17:34:41', '1', '1', 'BJ', '评估助理', '21', '2016-12-25 18:53:09', '2017-01-12 17:34:41'), ('26', 'sofia.luo@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '罗捷思', 'sofia.luo@valuelink.cn', '10', '1', '2', '15910210016', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理经理', '22', '2016-12-25 18:53:09', '2016-12-25 19:32:39'), ('27', 'ben.xiao@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '肖恢元', 'ben.xiao@valuelink.cn', '10', '1', '2', '17080994113', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理', '23', '2016-12-25 18:53:09', '2016-12-25 19:32:46'), ('28', 'zhanghuijuan@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '张慧娟', 'zhanghuijuan@valuelink.cn', '10', '1', '4', '13209828070', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '223.145.162.193', '2017-04-28 16:59:00', '223.145.162.193', '2017-04-28 16:59:00', '1', '1', 'BJ', '评估助理', '24', '2016-12-25 18:53:09', '2017-04-28 16:59:00'), ('29', 'susie@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '苏佩荣', 'susie@valuelink.cn', '10', '1', '2', '18511891114', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理', '25', '2016-12-25 18:53:09', '2016-12-25 19:33:13'), ('30', 'syu@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '郁达铭', 'syu@valuelink.cn', '10', '1', '2', '18217517110', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '118.192.104.74', '2017-01-03 10:25:15', '118.192.104.74', '2017-01-03 10:25:15', '1', '1', 'BJ', '评估助理', '26', '2016-12-25 18:53:09', '2017-01-03 10:25:14'), ('31', 'liz@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '朱慧洁', 'liz@valuelink.cn', '10', '1', '2', '13524889640', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理经理', '27', '2016-12-25 18:53:09', '2016-12-25 19:33:39'), ('32', 'jojo@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '袁雯皎', 'jojo@valuelink.cn', '10', '1', '2', '13585650344', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '行政', '28', '2016-12-25 18:53:09', '2016-12-25 19:33:46'), ('33', 'yuki@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '李雅珺', 'yuki@valuelink.cn', '10', '1', '2', '15202140132', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理', '29', '2016-12-25 18:53:09', '2016-12-25 19:37:13'), ('34', 'kyle@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '赵培', 'kyle@valuelink.cn', '10', '1', '2', '13681659204', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '118.192.104.74', '2017-01-03 10:22:36', '118.192.104.74', '2017-01-03 10:22:36', '1', '1', 'BJ', '评估助理', '30', '2016-12-25 18:53:09', '2017-01-03 10:22:36'), ('35', 'changjiang@valueone.com.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '祁长江', 'changjiang@valueone.com.cn', '10', '1', '2', '18810265748', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理', '31', '2016-12-25 18:53:09', '2016-12-25 19:29:23'), ('36', 'ren@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '任尚光', 'ren@valuelink.cn', '10', '1', '2', '18210091816', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理经理', '32', '2016-12-25 18:53:09', '2016-12-25 19:29:33'), ('37', 'Fiona.wang@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '王慧芳', 'Fiona.wang@valuelink.cn', '10', '1', '2', '18033861360', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理', '33', '2016-12-25 18:53:09', '2016-12-25 19:29:48'), ('38', 'tony.wang@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '王剑南', 'tony.wang@valuelink.cn', '10', '1', '4', '13581795461', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理经理', '34', '2016-12-25 18:53:09', '2016-12-25 19:28:29'), ('39', 'alex.liu@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '刘晓', 'alex.liu@valuelink.cn', '10', '1', '2', '18600369761', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理经理', '35', '2016-12-25 18:53:09', '2016-12-25 19:28:52'), ('40', 'William@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '陈广宇', 'william.chen@valuelink.cn', null, '1', '1', '18500031870', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2017-06-01 18:16:52', '127.0.0.1', '2017-06-01 18:16:52', '1', '1', 'BJ', '合伙人', '11', '2016-12-25 18:53:09', '2017-06-01 18:17:04'), ('41', 'message@valuelink.cn', '262f80263be33dcad7f98d4ec0cd5c5c', '8a34a50d87f62f93', '王坤测试', 'message@valuelink.cn', null, '1', '2', '13800138000', '262f80263be33dcad7f98d4ec0cd5c5c', '2016-04-26 10:53:48', null, '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-04-26 11:04:35', '127.0.0.1', '2016-04-26 11:04:35', '1', '1', 'BJ', '合伙人', '5', '2016-04-26 10:53:48', '2016-04-26 11:04:36'), ('42', 'message@valuelink.cn', '262f80263be33dcad7f98d4ec0cd5c5c', '8a34a50d87f62f93', '王坤测试', 'message@valuelink.cn', null, '1', '2', '13800138000', '262f80263be33dcad7f98d4ec0cd5c5c', '2016-04-26 10:53:48', null, '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-04-26 11:04:35', '127.0.0.1', '2016-04-26 11:04:35', '1', '1', 'BJ', '合伙人', '5', '2016-04-26 10:53:48', '2016-04-26 11:04:36');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
