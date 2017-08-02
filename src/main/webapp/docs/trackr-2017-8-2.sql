/*
Navicat MySQL Data Transfer

Source Server         : localhost-passw0rd
Source Server Version : 50614
Source Host           : 127.0.0.1:3306
Source Database       : trackr

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2017-08-02 23:45:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_authority
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_authority
-- ----------------------------
INSERT INTO `tb_authority` VALUES ('15', 'ROLE', '3', 'project:create', null, '2017-07-25 18:00:33', '2017-07-25 18:00:33');
INSERT INTO `tb_authority` VALUES ('16', 'ROLE', '1', 'project:create', null, '2017-07-25 18:01:34', '2017-07-25 18:01:34');
INSERT INTO `tb_authority` VALUES ('17', 'ROLE', '1', 'employee:add', null, '2017-07-25 18:01:34', '2017-07-25 18:01:34');
INSERT INTO `tb_authority` VALUES ('18', 'ROLE', '1', 'employee:edit', null, '2017-07-25 18:01:34', '2017-07-25 18:01:34');
INSERT INTO `tb_authority` VALUES ('19', 'ROLE', '1', 'employee:resetpwd', null, '2017-07-25 18:01:34', '2017-07-25 18:01:34');
INSERT INTO `tb_authority` VALUES ('20', 'ROLE', '2', 'project:create', null, '2017-07-25 18:01:44', '2017-07-25 18:01:44');
INSERT INTO `tb_authority` VALUES ('21', 'ROLE', '2', 'employee:resetpwd', null, '2017-07-25 18:01:44', '2017-07-25 18:01:44');
INSERT INTO `tb_authority` VALUES ('22', 'ROLE', '2', 'employee:edit', null, '2017-07-25 18:01:44', '2017-07-25 18:01:44');
INSERT INTO `tb_authority` VALUES ('23', 'USER', '1', 'competitor:grant', '1', '2017-07-25 20:16:12', '2017-07-25 20:16:12');
INSERT INTO `tb_authority` VALUES ('24', 'USER', '1', 'competitor:view', '1', '2017-07-25 20:16:12', '2017-07-25 20:16:12');
INSERT INTO `tb_authority` VALUES ('25', 'USER', '3', 'competitor:grant', '3', '2017-07-25 20:22:59', '2017-07-25 20:22:59');
INSERT INTO `tb_authority` VALUES ('26', 'USER', '3', 'competitor:view', '3', '2017-07-25 20:22:59', '2017-07-25 20:22:59');
INSERT INTO `tb_authority` VALUES ('27', 'USER', '2', 'competitor:grant', '2', '2017-07-25 20:23:12', '2017-07-25 20:23:12');
INSERT INTO `tb_authority` VALUES ('28', 'USER', '2', 'competitor:view', '2', '2017-07-25 20:23:12', '2017-07-25 20:23:12');
INSERT INTO `tb_authority` VALUES ('29', 'USER', '4', 'competitor:grant', '4', '2017-07-25 20:23:48', '2017-07-25 20:23:48');
INSERT INTO `tb_authority` VALUES ('30', 'ROLE', '1', 'ROLE_USER', '1', '2017-07-26 10:56:46', '2017-07-26 10:56:46');

-- ----------------------------
-- Table structure for tb_clue
-- ----------------------------
DROP TABLE IF EXISTS `tb_clue`;
CREATE TABLE `tb_clue` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `name` varchar(32) DEFAULT NULL COMMENT '客户名称',
  `contact_name` varchar(16) DEFAULT NULL COMMENT '联系人',
  `valuate_time` datetime DEFAULT NULL COMMENT '预计评估时间',
  `ipo` varchar(16) DEFAULT NULL COMMENT '（拟）上市地',
  `competitor_id` int(11) DEFAULT NULL COMMENT '友商id',
  `counts` tinyint(4) DEFAULT NULL COMMENT '联系次数',
  `signed` tinyint(1) DEFAULT '0' COMMENT '是否签约 1: 是 0: 否',
  `next_time` datetime DEFAULT NULL COMMENT '计划下次联系时间',
  `note` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0: 删除，1: 有效',
  `creator_id` int(11) NOT NULL COMMENT '创建者ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='潜在客户表（线索管理）';

-- ----------------------------
-- Records of tb_clue
-- ----------------------------
INSERT INTO `tb_clue` VALUES ('1', '', null, '2016-04-20 00:00:00', null, null, '0', '0', null, null, '0', '1', '2016-04-19 22:32:49', '2016-04-21 09:11:14');
INSERT INTO `tb_clue` VALUES ('2', null, null, null, null, null, '0', '0', null, null, '0', '1', '2016-04-20 12:23:49', '2016-04-21 09:11:17');
INSERT INTO `tb_clue` VALUES ('3', '', '', null, '', null, '0', '0', null, '', '0', '1', '2016-04-20 15:32:52', '2016-04-20 15:33:04');
INSERT INTO `tb_clue` VALUES ('4', null, null, null, null, null, '0', '0', null, null, '1', '1', '2016-04-20 15:39:04', '2016-04-20 15:39:04');
INSERT INTO `tb_clue` VALUES ('5', '', '', null, '', null, '0', '0', null, '', '0', '1', '2017-04-07 13:32:49', '2017-04-07 13:33:37');

-- ----------------------------
-- Table structure for tb_clue_contacts
-- ----------------------------
DROP TABLE IF EXISTS `tb_clue_contacts`;
CREATE TABLE `tb_clue_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `clue_id` int(11) NOT NULL COMMENT '潜在客户id',
  `assignee` varchar(16) NOT NULL COMMENT '联系执行人',
  `contact_time` datetime NOT NULL COMMENT '联系时间',
  `note` varchar(128) DEFAULT NULL COMMENT '备忘',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0: 删除，1: 有效',
  `creator_id` int(11) NOT NULL COMMENT '创建者ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_potential_contact_record_001` (`clue_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='潜在客户联系记录（线索管理）';

-- ----------------------------
-- Records of tb_clue_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for tb_company
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
-- Records of tb_company
-- ----------------------------
INSERT INTO `tb_company` VALUES ('1', 'C0001_2016_internet', '1', '0', '1', '北京58同城有限公司', '58同城', '12', '101', '103', '北京市海淀区', 'http://www.58.com', '', '', '1', '1', '2016-07-26 18:56:05', '2016-07-26 18:56:44', 'james.chi@valuelink.cn', null, '');
INSERT INTO `tb_company` VALUES ('2', 'C0002_2016_internet', '0', '1', '0', '58快递', '58快递', '12', '101', '102', '北京市海淀区', '', '', '', '1', '1', '2016-07-26 18:56:44', '2016-07-26 18:56:44', 'james.chi@valuelink.cn', null, '');
INSERT INTO `tb_company` VALUES ('3', 'C1003-BJ', '1', '0', '1', '北京美团有限公司', '美团', '12', '101', '102', '北京市朝阳区望京鹏景阁大厦2层', 'http://www.baidu.com', '010-12345678', '010-12345678', '1', '1', '2016-10-09 19:28:29', '2016-10-09 19:29:11', 'james.chi@valuelink.cn', 'BJ', '');
INSERT INTO `tb_company` VALUES ('4', 'C1004-SH', '0', '3', '0', '上海美团有限公司', '上海美团', '12', '101', '103', '北京市朝阳区望京鹏景阁大厦2层', 'http://www.baidu.com', '010-12345678', '010-12345678', '1', '1', '2016-10-09 19:29:11', '2016-10-09 19:29:11', 'james.chi@valuelink.cn', 'SH', '');
INSERT INTO `tb_company` VALUES ('5', 'C1003-BJ', '1', '0', '0', '北京网秦天下科技有限公司', '网秦', '12', '101', '109', '', 'http://www.netqin.cn', '', '', '1', '11', '2016-10-21 16:15:21', '2016-10-21 16:15:21', 'project_netqin@valuelink.cn', 'BJ', 'A');
INSERT INTO `tb_company` VALUES ('6', 'C1004-SH', '1', '0', '0', '联络互动有限公司', '联络互动', '13', '555', '556', '浙江省杭州市', 'http://dd.com', '', '', '1', '1', '2016-11-25 15:39:36', '2016-11-25 15:40:20', 'project_lihd@valuelink.cn', 'SH', 'A');
INSERT INTO `tb_company` VALUES ('7', 'C1005-BJ', '1', '0', '1', '北京美团科技有限公司', '美团', '12', '101', '102', '', '', '', '', '1', '1', '2016-12-27 14:29:12', '2017-05-12 10:48:11', 'james.chi@valuelink.cn', 'BJ', 'A');
INSERT INTO `tb_company` VALUES ('8', 'C1005-BJ', '0', '7', '0', '美团信息技术有限公司', '美团', '13', '101', '102', '', '', '', '', '1', '1', '2016-12-27 14:33:26', '2016-12-27 14:33:26', 'james.chi@valuelink.cn', 'SH', 'B');
INSERT INTO `tb_company` VALUES ('9', 'C1006-BJ', '1', '0', '1', '好未来有限公司', '好未来', '12', '101', '102', '', '', '', '', '1', '1', '2017-04-21 17:46:18', '2017-04-21 17:46:37', 'james.chi@valuelink.cn', 'BJ', 'A');
INSERT INTO `tb_company` VALUES ('10', 'C1006-BJ', '0', '9', '0', '学而思', '好未来', '12', '101', '102', '', '', '', '', '1', '1', '2017-04-21 17:46:37', '2017-04-21 17:46:37', 'james.chi@valuelink.cn', 'BJ', 'B');
INSERT INTO `tb_company` VALUES ('11', 'C1007-BJ', '1', '0', '0', '趣分期有限公司', '趣分期', '13', '101', '102', '北京', '', '', '', '1', '1', '2017-04-28 16:33:19', '2017-05-13 14:40:27', 'zhanghuijuan@valuelink.cn', 'BJ', 'A');
INSERT INTO `tb_company` VALUES ('12', 'C1008-BJ', '1', '0', '0', '华盖医疗健康创业投资成都合伙企业（有限合伙） ', '华盖', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-25 15:55:49', '2017-05-25 16:09:27', 'project_huagai@valuelink.cn', 'BJ', 'A');
INSERT INTO `tb_company` VALUES ('15', 'C1011-BJ', '1', '0', '0', '北京航美盛世广告有限公司', '航美', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-25 16:50:40', '2017-05-25 17:11:33', 'project_airmedia@valuelink.cn', 'BJ', 'A');
INSERT INTO `tb_company` VALUES ('16', 'C1010-SH', '1', '0', '0', '成都维仕小额贷款有限公司', '成都维仕', '13', '101', '102', '', '', '', '', '1', '1', '2017-05-25 17:22:01', '2017-05-25 17:22:01', 'project_weishi@valuelink.cn', 'SH', 'A');
INSERT INTO `tb_company` VALUES ('17', 'C1011-BJ', '1', '0', '0', '北京红黄蓝儿童教育科技发展有限公司', '红黄蓝', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-25 17:23:32', '2017-05-25 17:23:32', 'project_hhl@valuelink.cn', 'BJ', 'A');
INSERT INTO `tb_company` VALUES ('18', 'C1012-BJ', '1', '0', '0', '北京融世纪信息技术有限公司 ', '融世纪', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-25 17:25:05', '2017-05-25 17:25:05', 'project_rong@valuelink.cn', 'BJ', 'A');
INSERT INTO `tb_company` VALUES ('19', 'C1013-BJ', '1', '0', '0', '北京嘀嘀无限科技发展有限公司', '滴滴', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-26 13:57:08', '2017-05-31 16:20:01', 'project_didi@valueink.cn', 'BJ', 'A');
INSERT INTO `tb_company` VALUES ('20', 'C1014-SH', '1', '0', '0', '和讯信息科技有限公司 ', '和讯', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-26 14:50:16', '2017-05-26 15:03:18', 'project_hxkj@valuelink.cn', 'BJ', 'A');
INSERT INTO `tb_company` VALUES ('21', 'C1015-SH', '1', '0', '0', '上海汉钟精机股份有限公司', '汉钟精机', '12', '101', '102', '', '', '', '', '1', '1', '2017-05-26 15:08:16', '2017-05-26 15:09:32', 'project_trimet@valuelink.cn', 'SH', 'A');
INSERT INTO `tb_company` VALUES ('22', 'C1016-BJ', '1', '0', '0', '北京千橡网景科技发展有限公司 ', '人人', '12', '101', '102', '', '', '', '', '1', '1', '2017-06-01 20:00:28', '2017-06-01 22:04:19', 'project_renren@valuelink.cn', 'BJ', 'A');

-- ----------------------------
-- Table structure for tb_competitor
-- ----------------------------
DROP TABLE IF EXISTS `tb_competitor`;
CREATE TABLE `tb_competitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `company_name` varchar(32) DEFAULT NULL COMMENT '客户名称',
  `industry_id` int(11) DEFAULT NULL COMMENT '所属行业id',
  `audit_region_id` int(11) DEFAULT NULL COMMENT '审计/地区id',
  `name` varchar(32) DEFAULT NULL COMMENT '对手名称/友商名称',
  `ipo_id` int(11) DEFAULT NULL COMMENT '上市地id\n',
  `next_plan` varchar(512) DEFAULT NULL COMMENT '下一步执行计划',
  `changed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已被转为潜在客户 1: 是 0: 否',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0: 删除，1: 有效',
  `creator_id` int(11) NOT NULL COMMENT '创建者ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友商客户记录表';

-- ----------------------------
-- Records of tb_competitor
-- ----------------------------

-- ----------------------------
-- Table structure for tb_contract
-- ----------------------------
DROP TABLE IF EXISTS `tb_contract`;
CREATE TABLE `tb_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `company_id` int(11) NOT NULL COMMENT '公司id',
  `contract_number` varchar(32) DEFAULT NULL,
  `contract_name` varchar(128) NOT NULL COMMENT '合同名',
  `contract_type_ids` varchar(32) NOT NULL COMMENT '合同类型id，多个用管道符隔开',
  `amount` int(11) NOT NULL COMMENT '总金额',
  `currency` tinyint(1) NOT NULL DEFAULT '1' COMMENT '币种，1: 人民币 2: 美元 3: 港币',
  `pay_scale` char(50) NOT NULL COMMENT '付款比例，中间用管道符隔开，例如：4|4|2',
  `detail_money` varchar(32) NOT NULL COMMENT '单笔金额，中间用管道符隔开，例如：40000|40000|20000',
  `pay_count` tinyint(4) NOT NULL COMMENT '应付款笔数/次数',
  `is_pay_off` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已结清 1: 是 0: 否',
  `note` varchar(512) NOT NULL COMMENT '备注',
  `progress_master` double(6,3) NOT NULL DEFAULT '1.000' COMMENT '当前进度\n0:合同未上传 \n1: 小组成员未指定\n2: 等待合伙人审核合同\n3: 合同打回重新修改\n4: 合同已审核通过，未发送给客户\n5: 合同已发送给客户，等待客户确认\n6: 客户已确认合同，合同未签回\n7: 合同已签回，资料清单和财务模型都未上传\n8: 资料清单已上传，等待审核\n9: 资料清单打回重新修改\n10: 资料清单审核通过，未发送\n11: 资料清单已发送\n12: 等待合伙人审核文稿\n13: 文稿打回重新修改\n14: 复核合伙人审核通过文稿（原来：文稿已审核通过，未发送给客户）\n15: 文稿已',
  `progress_branch` int(4) NOT NULL DEFAULT '1' COMMENT '当前进度，财务模型的执行状态\n1: 财务模型未上传\n2 财务模型已上传，等待审核\n3: 财务模型打回重新修改\n4: 财务模型审核通过，未发送\n5: 财务模型已发送\n\n资料清单在主进度里体现，因为资料清单和财务模型没有先后顺序，所以需要单独记录状态',
  `parent_id` int(11) DEFAULT NULL COMMENT 'ID',
  `sign_back` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否签回，1: 是 0: 否 ',
  `delegate_id` int(11) NOT NULL COMMENT '受托方id',
  `send_payment_notice` int(2) NOT NULL DEFAULT '1' COMMENT '发送付款通知书节点\n1：确认合同后＋初稿发送后＋确认终稿后或初稿发送后3个月\n2：确认合同后＋初稿发送后\n3：确认合同后＋确认终稿后\n4：确认合同后＋确认终稿后或初稿发送后3个月',
  `contract_year` year(4) NOT NULL,
  `number` int(5) NOT NULL,
  `prefix` varchar(16) DEFAULT NULL,
  `purpose_type` tinyint(4) DEFAULT '1' COMMENT '评估目的 1:股权转让 2:资产收购 3:兼并收购 4:对外投资 5:股权激励 6:财务报告 7:股改 0:其他',
  `valuate_category` varchar(40) DEFAULT '' COMMENT '评估分类 1:咨询(内部参考) 2:咨询(财务报告) 3:法定 4:物业 0:其他',
  `valuate_time` varchar(150) NOT NULL COMMENT '评估时间 按照年份存储，可以是多个,用逗号分隔,如：2014,2015,2017',
  `purpose` varchar(512) DEFAULT NULL COMMENT '评估目的',
  `valuate_type` varchar(40) NOT NULL DEFAULT '1' COMMENT '评估类型(内容) 1、股权2、无形资产3、优先股4、期权5、员工期权6、涡轮7、物业资产：7.1  房屋7.2 土地8、固定资产9、可转债10、限售股折扣11、其他：可编辑12、流动资产13、流动负债14、非流动资产15、非流动负债16、其他金融工具17、交易事项',
  `valuate_type_other` varchar(60) DEFAULT NULL,
  `risk_level` int(2) DEFAULT NULL,
  `report_type` int(2) DEFAULT NULL,
  `send_payment_notice_val` varchar(20) DEFAULT NULL,
  `economic_behavior` varchar(255) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL COMMENT '报告出具公司ID，与受托方相同，可自行选择',
  `report_name` varchar(255) DEFAULT NULL COMMENT '报告出具公司名称',
  `job_code_id` int(11) DEFAULT NULL,
  `job_code_number` varchar(255) DEFAULT NULL,
  `express_info` varchar(120) DEFAULT NULL COMMENT '快递单信息',
  `review_note` varchar(1024) DEFAULT NULL COMMENT '审核备注',
  `review_project_note` varchar(1024) DEFAULT NULL COMMENT '项目相关备注',
  `review_contract_note` varchar(1024) DEFAULT NULL COMMENT '合同相关备注',
  `review_model_note` varchar(1024) DEFAULT NULL COMMENT '底稿相关备注',
  `review_scheme_note` varchar(1024) DEFAULT NULL COMMENT '报告相关备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0: 删除，1: 有效，2: 暂停',
  `creator_id` int(11) NOT NULL COMMENT '创建者ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_contract_001` (`company_id`) USING BTREE,
  CONSTRAINT `tb_contract_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='合同';

-- ----------------------------
-- Records of tb_contract
-- ----------------------------
INSERT INTO `tb_contract` VALUES ('2', '1', 'P2017-1006-BJ', '58合同', '5', '10000', '1', '4|4|2', '4000|4000|2000', '3', '0', '58合同', '8.000', '1', null, '0', '4', '1', '2017', '1006', '蓝策商约字', '1', '', '', '', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '1', '2016-10-07 21:25:17', '2016-10-07 21:25:17');
INSERT INTO `tb_contract` VALUES ('3', '3', 'P2017-1005-BJ', '奔驰北京评估', '5', '10000', '1', '4|4|2', '4000|4000|2000', '3', '0', '奔驰北京评估', '2.000', '1', null, '0', '3', '1', '2017', '1005', '蓝策商约字', '1', '', '', '', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '6', '2016-10-09 19:48:49', '2016-10-09 19:48:49');
INSERT INTO `tb_contract` VALUES ('4', '3', 'P2016-1000-BJ', '美团现代合并', '5', '100000', '1', '4|4|2', '40000|40000|20000', '3', '0', '美团现代合并', '17.000', '5', null, '1', '3', '1', '2016', '1000', '蓝策约字', '1', '', '', '', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '6', '2016-10-09 19:52:05', '2016-10-09 19:52:05');
INSERT INTO `tb_contract` VALUES ('5', '3', 'P2017-1004-BJ', '美团10月评估', '5', '100000', '1', '4|4|2', '40000|40000|20000', '3', '0', '美团10月评估', '1.000', '1', '4', '0', '3', '1', '2017', '1004', '蓝策约字', '1', '', '', '', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '6', '2016-10-09 20:19:05', '2016-10-09 20:19:05');
INSERT INTO `tb_contract` VALUES ('6', '3', 'P2017-1003-BJ', '美团11月评估', '5', '200000', '1', '4|4|2', '80000|80000|40000', '3', '0', '美团11月评估', '1.000', '1', '4', '0', '3', '1', '2017', '1003', '蓝策约字', '1', '', '', '', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '6', '2016-10-09 20:20:05', '2016-10-09 20:20:05');
INSERT INTO `tb_contract` VALUES ('7', '5', 'P2016-1001-BJ', '网秦财务咨询', '5', '200000', '1', '4|4|2', '80000|80000|40000', '3', '0', '网秦财务咨询', '17.000', '5', null, '1', '3', '1', '2016', '1001', '蓝策约字', '1', '', '', '', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '28', '2016-10-25 10:20:13', '2016-10-25 10:20:13');
INSERT INTO `tb_contract` VALUES ('8', '5', 'P2016-1002-BJ', '合同编号测试', '5', '1000', '1', '4|4|2', '400|400|200', '3', '0', '合同编号测试', '17.000', '5', null, '0', '3', '1', '2016', '1002', '蓝策约字', '1', '', '', '', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2', '1', '2016-10-28 20:36:35', '2016-10-28 20:36:35');
INSERT INTO `tb_contract` VALUES ('9', '6', 'P2017-1002-BJ', '联络互动无形资产评估', '6', '100000', '1', '5|5', '50000|50000', '2', '0', '联络互动无形资产评估', '4.000', '1', null, '0', '6', '2', '2017', '1002', '蓝策商约字', '1', '', '', '', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2', '1', '2016-11-25 16:17:04', '2016-11-25 16:17:04');
INSERT INTO `tb_contract` VALUES ('10', '6', 'P2017-1001-BJ', '联络互动有限公司', '5', '200000', '1', '4|4|2', '80000|80000|40000', '3', '0', '联络互动有限公司', '5.000', '1', null, '1', '6', '1', '2017', '1001', '蓝策约字', '1', '', '', '', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2', '12', '2016-11-25 16:38:52', '2016-11-25 16:38:52');
INSERT INTO `tb_contract` VALUES ('11', '3', 'P2017-1000-BJ', 'iuyuy', '6', '100000', '1', '4|4|2', '40000|40000|20000', '3', '0', 'iuyuy', '5.000', '1', null, '0', '6', '1', '2017', '1000', '蓝策商约字4', '7', '1', '2010,2012,2012,2014', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '1', '2017-03-07 16:16:40', '2017-03-07 16:16:40');
INSERT INTO `tb_contract` VALUES ('12', '3', 'P2017-1007-BJ', '美团2017年财务评估', '', '100000', '1', '4|4|2', '40000|40000|20000', '3', '0', '美团2017年财务评估', '1.000', '1', null, '0', '3', '1', '2017', '1007', '蓝策约字1', '1', '1', '2017', '', '569', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '1', '2017-04-06 13:04:41', '2017-04-06 13:04:41');
INSERT INTO `tb_contract` VALUES ('13', '5', 'P2017-1008-BJ', '网秦股权2017', '6', '100000', '1', '4|4|2', '40000|40000|20000', '3', '0', '网秦股权2017', '5.000', '1', null, '0', '3', '1', '2017', '1008', '蓝策约字1', '1', '1', '2017,2016', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '1', '2017-04-06 13:14:02', '2017-04-06 13:14:02');
INSERT INTO `tb_contract` VALUES ('14', '5', 'P2017-1009-BJ', '网秦2018股权评估', '5', '100000', '1', '4|4|2', '40000|40000|20000', '3', '0', '网秦2018股权评估', '5.000', '1', null, '0', '3', '1', '2017', '1009', '蓝策约字1', '2', '1', '2017,2018', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '1', '2017-04-06 17:24:30', '2017-04-06 17:24:30');
INSERT INTO `tb_contract` VALUES ('15', '1', 'P2017-1010-BJ-OSVN', '58同城2017年年审', '', '100000', '1', '5|4|1', '50000|40000|10000', '3', '0', '58同城2017年年审', '1.000', '1', null, '0', '3', '1', '2017', '1010', '蓝策管理咨询（北京）有限公司约字', '1', '', '2017-04-21', null, '1|2|3|30|31', '', '1', '1', '1|2|3', '', null, null, null, null, null, null, null, null, null, null, '1', '1', '2017-04-21 11:36:31', '2017-04-21 11:36:31');
INSERT INTO `tb_contract` VALUES ('16', '1', 'P2017-1011-BJ-OSVN', '58同城2020年金融业务上市咨询', '', '100000', '1', '5|4|1', '50000|40000|10000', '3', '0', '58同城2020年金融业务上市咨询', '1.001', '1', null, '0', '4', '1', '2017', '1011', '北京蓝策管理顾问有限公司约字', '1', '', '2017-04-21', null, '1|2|3|30|31|32', '', '2', '1', '1|2|3', '', null, null, null, null, null, null, '<p>我要退回你</p>', null, null, null, '1', '3', '2017-04-21 14:01:09', '2017-04-21 14:01:09');
INSERT INTO `tb_contract` VALUES ('17', '1', 'P2017-1012-BJ-OSVN', '58同城2017股权评估', '', '200000', '1', '5|4|1', '100000|80000|20000', '3', '0', '58同城2017股权评估', '1.001', '1', null, '0', '3', '1', '2017', '1012', '约字', '1', '', '2017-04-21', null, '1|3|30', '', '1', '1', '1|2|3', '股权评估', null, null, null, null, null, null, null, null, null, null, '1', '3', '2017-04-21 16:33:41', '2017-04-21 16:33:41');
INSERT INTO `tb_contract` VALUES ('18', '4', 'P2017-1015-SH-OFCN', 'layu-test-1005', '', '120000', '1', '5|4|1', '60000|48000|12000', '3', '0', 'layu-test-1005', '1.002', '1', null, '0', '5', '1', '2017', '1015', '约字', '3', '', '2017-04-21', null, '1|2|3|30|7', '', '4', '2', '1|2|3', 'layu-特殊他', null, null, null, null, null, null, null, null, null, null, '1', '1', '2017-04-21 16:34:32', '2017-04-21 16:34:32');
INSERT INTO `tb_contract` VALUES ('19', '3', 'P2017-1013-BJ-OFVN', '美团2018期权', '', '300000', '1', '5|3|2', '150000|90000|60000', '3', '0', '美团2018期权', '11.000', '5', null, '1', '6', '1', '2017', '1013', '约字', '3', '', '2017-04-30', null, '3|32', '', '4', '1', '1|2|3', '股权收购', null, null, null, null, null, null, null, null, null, null, '1', '28', '2017-04-21 16:58:27', '2017-04-21 16:58:27');
INSERT INTO `tb_contract` VALUES ('20', '9', 'P2017-1014-BJ-nullFVN', '好未来2017股权评估', '', '200000', '1', '5|5|0', '100000|100000|0', '3', '0', '好未来2017股权评估', '5.000', '1', null, '0', '6', '1', '2017', '1014', '约字', '3', '', '2017-04-30', null, '1|3|30', '', '4', '1', '1|2|3', '股权收购', null, null, null, null, null, null, null, null, null, null, '1', '28', '2017-04-21 17:50:51', '2017-04-21 17:50:51');
INSERT INTO `tb_contract` VALUES ('21', '5', 'P2017-1025-BJ-OSVN', '网秦期权201704', '', '20000010', '1', '5|3|2', '10000005|6000003|4000002', '3', '0', '网秦期权201704', '1.002', '1', null, '0', '6', '1', '2017', '1025', '蓝策评约字', '1', '', '2017-03-31,2017-04-02', null, '3|32|7', '', '1', '1', '1|2|3', '发放期权', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-04-27 16:44:41', '2017-04-28 16:35:33');
INSERT INTO `tb_contract` VALUES ('22', '3', 'P2017-1016-BJ-OFVN', '美团无形资产2018', '', '50000', '1', '5|3|2', '25000|15000|10000', '3', '0', '美团无形资产2018', '5.000', '1', null, '0', '6', '1', '2017', '1016', '蓝策评约字', '3', '', '2017-04-30', null, '5', '', '4', '1', '1|2|3', 'PPA', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-04-27 16:48:49', '2017-04-27 16:48:49');
INSERT INTO `tb_contract` VALUES ('23', '9', 'P2017-1017-BJ-OSVN', '好未来2017无形资产评估', '', '300000', '1', '5|3|2', '150000|90000|60000', '3', '0', '好未来2017无形资产评估', '7.000', '1', null, '0', '6', '1', '2017', '1017', '蓝策评约字', '1', '', '2017-04-30', null, '5', '', '1', '1', '1|2|3', 'PPA', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-04-28 15:26:25', '2017-04-28 15:28:31');
INSERT INTO `tb_contract` VALUES ('24', '11', 'P2017-1018-BJ-OSVN', '趣分期201704股权评估', '', '500000', '1', '5|5|0', '250000|250000|0', '3', '0', '趣分期201704股权评估', '7.000', '1', null, '1', '6', '1', '2017', '1018', '蓝策评约字', '1', '', '2017-04-30', null, '1|3|31', '', '1', '1', '1|2|3', '股权变更', '8', '北京东方燕都资产评估有限责任公司', null, null, null, null, null, null, null, null, '1', '28', '2017-04-28 16:34:58', '2017-04-28 16:37:11');
INSERT INTO `tb_contract` VALUES ('25', '11', 'P2017-1019-BJ-OSVN', '趣分期2018减值测试', '', '200000', '1', '5|3|2', '100000|60000|40000', '3', '0', '趣分期2018减值测试', '15.000', '7', null, '1', '6', '1', '2017', '1019', '蓝策评约字', '1', '', '2017-04-30', null, '1|3|34', '', '1', '1', '1|2|3', '减值', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-10 15:10:36', '2017-05-10 15:11:23');
INSERT INTO `tb_contract` VALUES ('26', '11', 'P2017-1020-BJ-OIVN', '趣分期2020减值测试', '', '42688', '1', '5|5|0', '21344|21344|0', '3', '0', '趣分期2020减值测试', '10.000', '1', null, '0', '3', '1', '2017', '1020', '蓝策评约字', '2', '', '2017-05-31,2017-10-31', null, '1|3|31', '', '4', '1', '1|2|3', '减值', '3', '蓝策管理咨询（北京）有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-13 14:33:23', '2017-05-13 14:33:23');
INSERT INTO `tb_contract` VALUES ('27', '3', 'P2017-1021-BJ-OSVN', '美团2020股权评估', '', '20000', '1', '5|5|0', '10000|10000|0', '3', '0', '美团2020股权评估', '17.000', '7', null, '1', '4', '1', '2017', '1021', '蓝策评约字', '1', '', '2017-05-14,2017-05-17', null, '1|2', '', '3', '1', '1|2|3', '评估', '4', '北京蓝策管理顾问有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-14 09:47:02', '2017-05-14 09:47:02');
INSERT INTO `tb_contract` VALUES ('28', '5', 'P2017-1022-BJ-OSVN', '网秦2018无形资产评估', '', '42688', '1', '5|5|0', '21344|21344|0', '3', '0', '网秦2018无形资产评估', '17.000', '7', null, '1', '6', '1', '2017', '1022', '蓝策评约字', '1', '', '2017-05-15,2017-05-18', null, '1|5', '', '4', '1', '1|2|3', '股权收购', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-15 13:32:45', '2017-05-15 13:32:45');
INSERT INTO `tb_contract` VALUES ('29', '1', 'P2017-1023-BJ-OFVN', '58同城2016-2017股权评估', '', '120000', '1', '5|3|2', '60000|36000|24000', '3', '0', '58同城2016-2017股权评估', '17.000', '7', null, '1', '6', '1', '2017', '1023', '蓝策评约字', '3', '', '2017-05-31', null, '1|5', '', '3', '1', '1|2|3', '减值', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-17 17:05:41', '2017-05-17 17:05:41');
INSERT INTO `tb_contract` VALUES ('30', '7', 'P2017-1024-BJ-OFVN', '美团减值测试2017', '', '100000', '1', '5|5|0', '50000|50000|0', '3', '0', '美团减值测试2017', '14.002', '402', null, '1', '6', '1', '2017', '1024', '蓝策评约字', '3', '', '2017-05-25', null, '4|5', '', '2', '1', '1|2|3', '减值', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-23 14:16:55', '2017-05-23 14:16:55');
INSERT INTO `tb_contract` VALUES ('31', '5', 'P2017-1026-BJ-OFVN', '网秦CB参数', '', '100000', '1', '10|0|0', '100000|0|0', '3', '0', '网秦CB参数', '16.000', '6', null, '1', '6', '1', '2017', '1026', '蓝策评约字', '3', '', '2017-05-31', null, '1|5', '', '3', '1', '1|2|3', '减值', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-23 17:33:35', '2017-05-23 17:33:35');
INSERT INTO `tb_contract` VALUES ('32', '5', 'P2017-1027-BJ-OFVN', '网秦CB参数分析', '', '64032', '1', '5|5|0', '32016|32016|0', '3', '0', '网秦CB参数分析', '16.000', '5', null, '1', '6', '1', '2017', '1027', '蓝策评约字', '3', '', '2017-03-31,2017-06-30,2017-09-30,2017-12-31', null, '3|34', '', '2', '1', '1|2|3', '可转债', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-24 10:28:57', '2017-05-24 10:28:57');
INSERT INTO `tb_contract` VALUES ('33', '3', '', '美团测试0524', '', '200000', '1', '5|3|2', '100000|60000|40000', '3', '0', '美团测试0524', '1.001', '1', null, '0', '3', '1', '0000', '0', '蓝策评约字', '1', '', '2017-05-27,2017-05-31', null, '1|4', '', '4', '1', '1|2|3', '资产评估', '3', '蓝策管理咨询（北京）有限公司', null, null, null, null, '<p>我要打回这个项目</p>', null, null, null, '1', '28', '2017-05-24 11:25:03', '2017-05-24 11:25:03');
INSERT INTO `tb_contract` VALUES ('34', '9', 'P2017-1028-BJ-OIVN', '好未来减值测试2107', '', '200000', '1', '5|5|0', '100000|100000|0', '3', '0', '好未来减值测试2107', '4.002', '1', null, '0', '6', '1', '2017', '1028', '蓝策评约字', '2', '', '2017-03-31', null, '1|4', '', '4', '1', '1|2|3', '减值', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '1', '2017-05-24 13:51:03', '2017-05-24 13:51:03');
INSERT INTO `tb_contract` VALUES ('35', '9', 'P2017-1029-BJ-OIVN', '好未来股权、无形资产评估', '', '82688', '1', '5|5|0', '41344|41344|0', '3', '0', '好未来股权、无形资产评估', '20.000', '10', null, '1', '6', '1', '2017', '1029', '蓝策评约字', '2', '', '2017-05-12', null, '1|5', '', '3', '1', '1|2|3', '股权收购', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-24 13:55:29', '2017-05-24 13:55:29');
INSERT INTO `tb_contract` VALUES ('36', '5', '', '网秦减值测试', '', '148340', '1', '5|5|0', '74170|74170|0', '3', '0', '网秦减值测试', '1.001', '1', null, '0', '6', '1', '0000', '0', '蓝策评约字', '3', '', '2017-05-25,2017-03-31', null, '8', '减值测试', '2', '1', '1|2|3', '减值', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '1', '2017-05-25 15:01:49', '2017-05-25 15:01:49');
INSERT INTO `tb_contract` VALUES ('37', '5', 'P2017-1030-BJ-OFVN', '网秦减值测试', '', '148340', '1', '5|5|0', '74170|74170|0', '3', '0', '网秦减值测试', '5.000', '1', null, '1', '6', '1', '2017', '1030', '蓝策评约字', '3', '', '2017-03-31', null, '3|34', '', '2', '1', '1|2|3', '可转债', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-25 15:04:02', '2017-05-25 15:04:02');
INSERT INTO `tb_contract` VALUES ('38', '12', 'P2017-1031-BJ-OFVN', '华盖股东部分权益评估', '', '160080', '1', '10|0|0', '160080|0|0', '3', '0', '华盖股东部分权益评估', '14.002', '402', null, '0', '6', '1', '2017', '1031', '蓝策评约字', '3', '', '2017-04-30', null, '5', '', '2', '1', '1|2|3', '股东权益', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-25 15:57:59', '2017-05-25 15:57:59');
INSERT INTO `tb_contract` VALUES ('39', '15', 'P2017-1032-BJ-OFCN', '维美盛景长期资产组减值测试', '', '70000', '1', '5|5|0', '35000|35000|0', '3', '0', '维美盛景长期资产组减值测试', '12.000', '5', null, '0', '6', '1', '2017', '1032', '蓝策咨约字', '3', '', '2016-12-31', null, '8', '减值测试', '1', '2', '1|2|3', '减值', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-25 16:53:28', '2017-05-25 16:53:28');
INSERT INTO `tb_contract` VALUES ('40', '18', 'P2017-1033-BJ-OFVN', '融360优先股和员工期权的公允价值评估', '', '74704', '1', '5|5|0', '37352|37352|0', '3', '0', '融360优先股和员工期权的公允价值评估', '5.000', '1', null, '0', '6', '1', '2017', '1033', '蓝策评约字', '3', '', '2017-06-15', null, '3|31|32', '', '1', '1', '1|2|3', '优先股、期权', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-25 17:29:41', '2017-05-25 17:46:15');
INSERT INTO `tb_contract` VALUES ('41', '19', '', '嘀嘀股权评估', '', '150000', '1', '5|5|0', '75000|75000|0', '3', '0', '嘀嘀股权评估', '1.002', '1', null, '0', '8', '1', '0000', '0', '未定义约字', '1', '', '2017-04-30', null, '8', '股东全部权益', '1', '1', '1|2|3', '股东权益', '8', '北京东方燕都资产评估有限责任公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-26 14:17:41', '2017-05-31 14:04:37');
INSERT INTO `tb_contract` VALUES ('42', '20', 'P2017-1034-BJ-OFCN', '和讯股权价值分析', '', '10000', '1', '10|0|0', '10000|0|0', '3', '0', '和讯股权价值分析', '7.000', '1', null, '0', '3', '1', '2017', '1034', '蓝策咨约字', '3', '', '2016-07-31', null, '8', '股权', '1', '2', '1|2|3', '股权', '3', '蓝策管理咨询（北京）有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-26 14:55:07', '2017-05-26 14:55:07');
INSERT INTO `tb_contract` VALUES ('43', '21', 'P2017-1035-BJ-OFCN', 'TRIMET股东全部权益价值分析项目', '', '320160', '1', '5|5|0', '160080|160080|0', '3', '0', 'TRIMET股东全部权益价值分析项目', '15.000', '402', null, '1', '6', '1', '2017', '1035', '蓝策咨约字', '3', '', '2017-05-26,2017-06-30', null, '8', '股权价值', '1', '2', '1|2|3', '价值分析', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-26 15:13:40', '2017-05-26 15:13:40');
INSERT INTO `tb_contract` VALUES ('44', '19', 'P2017-1036-BJ-OSCN', '嘀嘀股权评估', '', '150000', '1', '5|5|0', '75000|75000|0', '3', '0', '嘀嘀股权评估', '11.000', '1', null, '1', '8', '1', '2017', '1036', 'undefined约字', '1', '', '2017-05-31', null, '1', '', '1', '2', '1|2|3', '股权变更', '8', '北京东方燕都资产评估有限责任公司', null, null, null, null, null, null, null, null, '1', '28', '2017-05-31 16:36:52', '2017-05-31 17:01:17');
INSERT INTO `tb_contract` VALUES ('45', '3', '', '王坤测试合同签回后工号申请', '', '5000', '1', '10|0|0', '5000|0|0', '3', '0', '王坤测试合同签回后工号申请', '1.001', '1', null, '0', '4', '1', '0000', '0', '蓝策评约字', '1', '', '2017-06-01', null, '1', '', '1', '1', '1|2|3', '测试经济行为', '4', '北京蓝策管理顾问有限公司', null, null, null, null, null, null, null, null, '1', '3', '2017-06-01 16:14:33', '2017-06-01 16:14:33');
INSERT INTO `tb_contract` VALUES ('46', '3', 'P2017-1037-BJ-OSVN', '王坤测试合同签回后工号申请002', '', '5000', '1', '10|0|0', '5000|0|0', '3', '0', '王坤测试合同签回后工号申请002', '1.002', '1', null, '0', '4', '1', '2017', '1037', '蓝策评约字', '1', '', '2017-06-01', null, '1', '', '1', '1', '1|2|3', '测试经济行为', '4', '北京蓝策管理顾问有限公司', null, null, null, null, null, null, null, null, '1', '3', '2017-06-01 16:34:38', '2017-06-01 16:34:38');
INSERT INTO `tb_contract` VALUES ('47', '22', null, '人人股权评估', '', '100000', '1', '5|5|0', '50000|50000|0', '3', '0', '人人股权评估', '3.000', '1', null, '0', '6', '1', '0000', '0', '蓝策评约字', '3', '', '2017-06-30', null, '1', '', '2', '1', '1|2|3', '股权变更', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '0', '28', '2017-06-01 20:04:06', '2017-06-01 20:04:06');
INSERT INTO `tb_contract` VALUES ('48', '9', null, '好未来减值测试0601', '', '500000', '1', '5|5|0', '250000|250000|0', '3', '0', '好未来减值测试0601', '2.000', '1', null, '0', '6', '1', '0000', '0', '蓝策评约字', '1', '', '2017-06-30', null, '1', '', '4', '1', '1|2|3', '股权', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '0', '28', '2017-06-01 20:16:48', '2017-06-01 20:16:48');
INSERT INTO `tb_contract` VALUES ('49', '22', 'P2017-1038-BJ-OSVN', '人人股权评估', '', '100000', '1', '5|5|0', '50000|50000|0', '3', '0', '人人股权评估', '7.000', '1', null, '0', '6', '1', '2017', '1038', '蓝策评约字', '1', '', '2017-06-01,2017-06-01', null, '1', '', '3', '1', '1|2|3', '股权收购', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-06-01 21:12:19', '2017-06-01 21:12:19');
INSERT INTO `tb_contract` VALUES ('50', '9', null, '好未来股权期权评估', '', '100000', '1', '5|3|2', '50000|30000|20000', '3', '0', '好未来股权期权评估', '1.000', '1', null, '0', '6', '1', '0000', '0', '蓝策评约字', '3', '', '2017-05-31', null, '1|3|32', '', '4', '1', '1|2|3', '减值测试', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '0', '28', '2017-06-22 17:37:39', '2017-06-22 17:37:39');
INSERT INTO `tb_contract` VALUES ('51', '9', null, '好未来股权期权评估', '', '100000', '1', '5|3|2', '50000|30000|20000', '3', '0', '好未来股权期权评估', '1.000', '1', null, '0', '6', '1', '0000', '0', '蓝策评约字', '3', '', '2017-05-31', null, '1|3|32', '', '4', '1', '1|2|3', '减值测试', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '0', '28', '2017-06-22 17:37:51', '2017-06-22 17:37:51');
INSERT INTO `tb_contract` VALUES ('52', '9', null, '好未来股权期权评估', '', '100000', '1', '5|3|2', '50000|30000|20000', '3', '0', '好未来股权期权评估', '1.000', '1', null, '0', '6', '1', '0000', '0', '蓝策评约字', '3', '', '2017-05-31', null, '1|3|32', '', '4', '1', '1|2|3', '减值测试', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '0', '28', '2017-06-22 17:37:51', '2017-06-22 17:37:51');
INSERT INTO `tb_contract` VALUES ('53', '9', null, '好未来股权期权评估', '', '100000', '1', '5|3|2', '50000|30000|20000', '3', '0', '好未来股权期权评估', '1.000', '1', null, '0', '6', '1', '0000', '0', '蓝策评约字', '3', '', '2017-05-31', null, '1|3|32', '', '4', '1', '1|2|3', '减值测试', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '0', '28', '2017-06-22 17:37:53', '2017-06-22 17:37:53');
INSERT INTO `tb_contract` VALUES ('54', '9', null, '好未来股权期权评估', '', '100000', '1', '5|3|2', '50000|30000|20000', '3', '0', '好未来股权期权评估', '1.000', '1', null, '0', '6', '1', '0000', '0', '蓝策评约字', '3', '', '2017-05-31', null, '1|3|32', '', '4', '1', '1|2|3', '减值测试', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '0', '28', '2017-06-22 17:37:57', '2017-06-22 17:37:57');
INSERT INTO `tb_contract` VALUES ('55', '9', '', '好未来股权期权评估', '', '100000', '1', '5|3|2', '50000|30000|20000', '3', '0', '好未来股权期权评估', '2.000', '1', null, '0', '6', '1', '0000', '0', '蓝策评约字', '3', '', '2017-05-31', null, '1|3|32', '', '4', '1', '1|2|3', '减值测试', '6', '蓝策（北京）资产评估有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-06-22 17:37:59', '2017-06-22 17:37:59');
INSERT INTO `tb_contract` VALUES ('56', '3', '', '美团2020资产评估', '', '200000', '1', '5|4|1', '100000|80000|20000', '3', '0', '美团2020资产评估', '1.002', '1', null, '0', '3', '1', '0000', '0', '蓝策评约字', '1', '', '2017-06-25', null, '1|3|30|31', '', '3', '1', '1|2|3', '评估', '4', '北京蓝策管理顾问有限公司', null, null, null, null, null, null, null, null, '1', '28', '2017-06-24 15:56:55', '2017-06-24 15:56:55');
INSERT INTO `tb_contract` VALUES ('57', '3', '', '美团资产评估', '', '200000', '1', '5|4|1', '100000|80000|20000', '3', '0', '美团资产评估', '5.000', '1', null, '0', '3', '1', '0000', '0', '蓝策评约字', '1', '', '2017-06-30', null, '1|2', '', '3', '1', '1|2|3', '评估', '4', '北京蓝策管理顾问有限公司', null, null, null, null, null, null, null, null, '1', '42', '2017-06-24 17:53:52', '2017-06-24 17:53:52');

-- ----------------------------
-- Table structure for tb_dict
-- ----------------------------
DROP TABLE IF EXISTS `tb_dict`;
CREATE TABLE `tb_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL COMMENT '字典分类的id',
  `code` varchar(40) DEFAULT NULL COMMENT '字典数据的枚举值',
  `name` varchar(100) DEFAULT NULL COMMENT '字典实际内容',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='字典内容';

-- ----------------------------
-- Records of tb_dict
-- ----------------------------
INSERT INTO `tb_dict` VALUES ('1', '2', null, '互联网', '互联网', '0', '1', '1', '2017-06-10 11:51:52', '2017-08-02 10:46:38');
INSERT INTO `tb_dict` VALUES ('2', '2', null, '测试002', '测试002', '0', '1', '1', '2017-07-26 10:56:46', '2017-08-02 10:46:41');
INSERT INTO `tb_dict` VALUES ('3', '3', 'internet', '信息传输、计算机服务和软件业', '信息传输、计算机服务和软件业', '0', '1', '1', '2017-08-02 11:41:38', '2017-08-02 12:39:33');
INSERT INTO `tb_dict` VALUES ('4', '3', 'environment', '环境和公共设施管理业', '环境和公共设施管理业', '0', '1', '1', '2017-08-02 11:43:22', '2017-08-02 12:39:43');

-- ----------------------------
-- Table structure for tb_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_dict_type`;
CREATE TABLE `tb_dict_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) DEFAULT '' COMMENT '字段key值，一般要和需要字典数据的内容保持一致',
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='字典管理';

-- ----------------------------
-- Records of tb_dict_type
-- ----------------------------
INSERT INTO `tb_dict_type` VALUES ('2', 'valuateType', '评估类型', '0', '1', '2017-06-10 12:27:24', '2017-07-31 23:57:30');
INSERT INTO `tb_dict_type` VALUES ('3', 'industry', '行业信息', '0', '1', '2017-07-26 10:56:46', '2017-07-31 23:57:23');
INSERT INTO `tb_dict_type` VALUES ('4', 'repay', '还款方式', '0', '1', '2017-07-31 23:52:44', '2017-07-31 23:57:17');
INSERT INTO `tb_dict_type` VALUES ('7', 'customerType', '客户分类', '0', '1', '2017-07-31 23:56:59', '2017-07-31 23:56:59');

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `tree_path` varchar(255) NOT NULL COMMENT '导航树的路径',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('2', '1', '用户列表', 'sys/user.html', null, '1', 'fa fa-user', '', '1', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('3', '1', '角色管理', 'sys/role.html', null, '1', 'fa fa-user-secret', '', '2', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('4', '1', '菜单管理', 'sys/menu.html', null, '1', 'fa fa-th-list', '', '3', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '', '4', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('6', '1', '定时任务', 'sys/schedule.html', null, '1', 'fa fa-tasks', '', '5', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');
INSERT INTO `tb_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '', '0', '2017-07-25 14:49:13', '2017-07-25 14:49:13');

-- ----------------------------
-- Table structure for tb_project
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
-- Records of tb_project
-- ----------------------------
INSERT INTO `tb_project` VALUES ('6', '测试项目名称', '1401', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '80000', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-09 19:34:36', '2017-07-09 19:34:36');
INSERT INTO `tb_project` VALUES ('7', '流程ID 测试', '1501', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-09 19:56:48', '2017-07-09 19:56:48');
INSERT INTO `tb_project` VALUES ('8', '测试项目名称22', '1601', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-09 20:30:27', '2017-07-09 20:30:27');
INSERT INTO `tb_project` VALUES ('10', '测试项目名称33', '2101', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-09 21:15:22', '2017-07-09 21:15:22');
INSERT INTO `tb_project` VALUES ('11', '测试项目名称23', '3501', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-23 13:45:32', '2017-07-23 13:45:32');
INSERT INTO `tb_project` VALUES ('12', '测试项目名称45', '3511', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-23 13:46:48', '2017-07-23 13:46:48');
INSERT INTO `tb_project` VALUES ('13', '测试项目名称办理人', '3701', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'ASSIGNED', '2017-07-23 14:26:42', '2017-07-23 14:26:42');
INSERT INTO `tb_project` VALUES ('14', '测试项目名称9', '3801', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '9000', '1', '4:4:2', null, '备注', '1', 'APPROVED', '2017-07-23 19:40:53', '2017-07-23 19:40:53');
INSERT INTO `tb_project` VALUES ('15', '测试项目名称', '3905', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'APPROVED', '2017-07-23 19:50:24', '2017-07-23 19:50:24');
INSERT INTO `tb_project` VALUES ('16', '测试项目名称', '3919', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'REJECTED', '2017-07-23 19:51:14', '2017-07-23 19:51:14');
INSERT INTO `tb_project` VALUES ('17', '测试项目名称', '4001', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'REJECTED', '2017-07-23 19:52:10', '2017-07-23 19:52:10');
INSERT INTO `tb_project` VALUES ('18', '测试项目名称', '4101', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'APPROVED', '2017-07-24 11:01:34', '2017-07-24 11:01:34');
INSERT INTO `tb_project` VALUES ('19', '测试项目名称', '4201', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'APPROVED', '2017-07-24 12:07:35', '2017-07-24 12:07:35');
INSERT INTO `tb_project` VALUES ('20', '测试项目名称', '4216', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'REJECTED', '2017-07-24 12:09:02', '2017-07-24 12:09:02');
INSERT INTO `tb_project` VALUES ('21', '测试项目名称', '4301', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'REJECTED', '2017-07-24 12:18:19', '2017-07-24 12:18:19');
INSERT INTO `tb_project` VALUES ('22', '测试项目名称', '4401', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'REJECTED', '2017-07-24 12:22:51', '2017-07-24 12:22:51');
INSERT INTO `tb_project` VALUES ('23', '测试项目名称', '4416', '1', '1', '测试经济行为', '1', null, '1', null, '1', '2017,2018', '1', '1', '0', '1', '4:4:2', null, '备注', '1', 'APPROVED', '2017-07-24 12:27:04', '2017-07-24 12:27:04');

-- ----------------------------
-- Table structure for tb_role
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '超级管理员', '1', '描述', '2017-06-06 16:35:23', '2017-07-25 18:01:34');
INSERT INTO `tb_role` VALUES ('2', '普通员工', '1', '描述', '2017-06-06 16:50:36', '2017-07-25 18:01:44');
INSERT INTO `tb_role` VALUES ('3', '合伙人', '1', '合伙人', '2017-07-24 15:03:26', '2017-07-25 18:00:33');
INSERT INTO `tb_role` VALUES ('4', '财务', '1', '财务', '2017-07-24 15:04:05', '2017-07-24 15:04:07');
INSERT INTO `tb_role` VALUES ('5', '同学', '1', '同学', '2017-07-24 15:04:02', '2017-07-25 18:01:57');
INSERT INTO `tb_role` VALUES ('6', '超级管理员', '1', '描述', '2017-07-26 10:56:46', '2017-07-26 10:56:46');

-- ----------------------------
-- Table structure for tb_user
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
  KEY `idx_user_001` (`login_name`) USING BTREE,
  KEY `idx_user_002` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin@valuelink.cn', '72a4f0fc2cbabf16b1e88827179d3e55', '8990923576109879', '管理员', 'message@valuelink.cn', null, '0', '1', '13888888888', 'a8a5c529896103c4a8c831d4db2571fa', '2016-03-30 10:53:21', '', '<p>_______________</p><p>这里有签名</p><p><img data-filename=\"\" src=\"/files/upload/20160422/20160422120835_240782_logo.jpg\" style=\"width: 50%;\"><br></p>', '', '127.0.0.1', '2017-06-01 15:59:32', '127.0.0.1', '2017-06-01 15:59:32', '1', '1', 'BJ', '总监', '1', '2016-03-30 10:53:21', '2017-06-01 15:59:44');
INSERT INTO `tb_user` VALUES ('2', 'p1@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '合伙人', 'message@valuelink.cn', null, '1', '2', '', '', null, '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2017-06-01 17:06:47', '127.0.0.1', '2017-06-01 17:06:47', '1', '1', 'BJ', '合伙人', '2', '2016-03-30 10:57:46', '2017-06-01 17:06:58');
INSERT INTO `tb_user` VALUES ('3', 'u1@valuelink.cn', '892a5ac14ec1cb6f907b98f7fbe04947', 'a22b2eff0504199a', '李先生', 'message@valuelink.cn', null, '1', '4', '', '', null, null, null, null, '127.0.0.1', '2017-06-01 17:41:20', '127.0.0.1', '2017-06-01 17:41:20', '1', '1', 'BJ', '合伙人', '3', '2016-03-30 10:58:07', '2017-06-01 17:41:32');
INSERT INTO `tb_user` VALUES ('4', 'p2@valuelink.cn', '0350bd36c25d7093f913593a14dc2078', '258650f791164b18', '合伙人2', 'message@valuelink.cn', null, '1', '2', '', '', null, null, null, null, '127.0.0.1', '2017-05-16 16:41:31', '127.0.0.1', '2017-05-16 16:41:31', '1', '2', 'BJ', '合伙人', '4', '2016-04-14 13:25:28', '2017-05-16 16:41:48');
INSERT INTO `tb_user` VALUES ('5', 'f1@valuelink.cn', '262f80263be33dcad7f98d4ec0cd5c5c', '8a34a50d87f62f93', '李先生', 'message@valuelink.cn', null, '1', '3', '13800138000', '262f80263be33dcad7f98d4ec0cd5c5c', '2016-04-26 10:53:48', null, '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2017-06-01 17:40:28', '127.0.0.1', '2017-06-01 17:40:28', '1', '1', 'BJ', '合伙人', '5', '2016-04-26 10:53:48', '2017-06-01 17:40:40');
INSERT INTO `tb_user` VALUES ('16', 'celine.zhang@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '张嘉莉', 'celine.zhang@valuelink.cn', null, '1', '99', '18501616788', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2017-06-01 17:10:34', '127.0.0.1', '2017-06-01 17:10:34', '1', '1', 'BJ', '总监', '12', '2016-12-25 18:53:09', '2017-06-01 17:10:46');
INSERT INTO `tb_user` VALUES ('17', 'roger@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '李丁丁', 'roger@valuelink.cn', null, '1', '2', '18611322758', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '合伙人', '13', '2016-12-25 18:53:09', '2016-12-25 19:25:11');
INSERT INTO `tb_user` VALUES ('18', 'yan@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '闫冬', 'yan@valuelink.cn', null, '1', '2', '13811064075', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '合伙人', '14', '2016-12-25 18:53:09', '2016-12-25 19:31:21');
INSERT INTO `tb_user` VALUES ('19', 'sunchuan@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '孙川', 'sunchuan@valuelink.cn', null, '1', '2', '15110118538', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '116.243.188.100', '2016-12-27 10:02:55', '116.243.188.100', '2016-12-27 10:02:55', '1', '1', 'BJ', '总监', '15', '2016-12-25 18:53:09', '2016-12-27 10:02:54');
INSERT INTO `tb_user` VALUES ('20', 'luo@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '罗俊军', 'luo@valuelink.cn', null, '1', '2', '18618277965', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '合伙人', '16', '2016-12-25 18:53:09', '2016-12-25 19:30:19');
INSERT INTO `tb_user` VALUES ('21', 'xiaonan@valuelink.cn', '5d0a4614697c38de08c381d84acec9a9', '01e6d62a9fdc08cd', '王晓男', 'xiaonan@valuelink.cn', null, '1', '2', '18911305429', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p><span style=\"font-size: 18px; line-height: 1.4;\">王晓男</span><br></p>', null, '123.119.185.170', '2017-01-20 17:16:18', '123.119.185.170', '2017-01-20 17:16:18', '1', '1', 'BJ', '合伙人', '17', '2016-12-25 18:53:09', '2017-01-20 17:16:17');
INSERT INTO `tb_user` VALUES ('22', 'amy.yan@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '闫煜', 'amy.yan@valuelink.cn', '10', '1', '2', '13691238462', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理经理', '18', '2016-12-25 18:53:09', '2016-12-25 19:32:02');
INSERT INTO `tb_user` VALUES ('23', 'carol.jiang@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '蒋丽楠', 'carol.jiang@valuelink.cn', '10', '1', '2', '18611176959', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '118.192.104.74', '2016-12-26 19:14:37', '118.192.104.74', '2016-12-26 19:14:37', '1', '1', 'BJ', '评估助理', '19', '2016-12-25 18:53:09', '2016-12-26 19:14:36');
INSERT INTO `tb_user` VALUES ('24', 'cher.cao@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '曹雅洁', 'cher.cao@valuelink.cn', '10', '1', '2', '13707118325', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '118.192.104.74', '2016-12-26 10:10:27', '118.192.104.74', '2016-12-26 10:10:27', '1', '1', 'BJ', '评估助理经理', '20', '2016-12-25 18:53:09', '2016-12-26 10:10:27');
INSERT INTO `tb_user` VALUES ('25', 'Nigel.liu@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '刘立同', 'Nigel.liu@valuelink.cn', '10', '1', '2', '13436550895', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '61.50.127.102', '2017-01-12 17:34:41', '61.50.127.102', '2017-01-12 17:34:41', '1', '1', 'BJ', '评估助理', '21', '2016-12-25 18:53:09', '2017-01-12 17:34:41');
INSERT INTO `tb_user` VALUES ('26', 'sofia.luo@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '罗捷思', 'sofia.luo@valuelink.cn', '10', '1', '2', '15910210016', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理经理', '22', '2016-12-25 18:53:09', '2016-12-25 19:32:39');
INSERT INTO `tb_user` VALUES ('27', 'ben.xiao@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '肖恢元', 'ben.xiao@valuelink.cn', '10', '1', '2', '17080994113', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理', '23', '2016-12-25 18:53:09', '2016-12-25 19:32:46');
INSERT INTO `tb_user` VALUES ('28', 'zhanghuijuan@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '张慧娟', 'zhanghuijuan@valuelink.cn', '10', '1', '4', '13209828070', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '223.145.162.193', '2017-04-28 16:59:00', '223.145.162.193', '2017-04-28 16:59:00', '1', '1', 'BJ', '评估助理', '24', '2016-12-25 18:53:09', '2017-04-28 16:59:00');
INSERT INTO `tb_user` VALUES ('29', 'susie@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '苏佩荣', 'susie@valuelink.cn', '10', '1', '2', '18511891114', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理', '25', '2016-12-25 18:53:09', '2016-12-25 19:33:13');
INSERT INTO `tb_user` VALUES ('30', 'syu@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '郁达铭', 'syu@valuelink.cn', '10', '1', '2', '18217517110', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '118.192.104.74', '2017-01-03 10:25:15', '118.192.104.74', '2017-01-03 10:25:15', '1', '1', 'BJ', '评估助理', '26', '2016-12-25 18:53:09', '2017-01-03 10:25:14');
INSERT INTO `tb_user` VALUES ('31', 'liz@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '朱慧洁', 'liz@valuelink.cn', '10', '1', '2', '13524889640', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理经理', '27', '2016-12-25 18:53:09', '2016-12-25 19:33:39');
INSERT INTO `tb_user` VALUES ('32', 'jojo@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '袁雯皎', 'jojo@valuelink.cn', '10', '1', '2', '13585650344', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '行政', '28', '2016-12-25 18:53:09', '2016-12-25 19:33:46');
INSERT INTO `tb_user` VALUES ('33', 'yuki@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '李雅珺', 'yuki@valuelink.cn', '10', '1', '2', '15202140132', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理', '29', '2016-12-25 18:53:09', '2016-12-25 19:37:13');
INSERT INTO `tb_user` VALUES ('34', 'kyle@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '赵培', 'kyle@valuelink.cn', '10', '1', '2', '13681659204', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '118.192.104.74', '2017-01-03 10:22:36', '118.192.104.74', '2017-01-03 10:22:36', '1', '1', 'BJ', '评估助理', '30', '2016-12-25 18:53:09', '2017-01-03 10:22:36');
INSERT INTO `tb_user` VALUES ('35', 'changjiang@valueone.com.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '祁长江', 'changjiang@valueone.com.cn', '10', '1', '2', '18810265748', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理', '31', '2016-12-25 18:53:09', '2016-12-25 19:29:23');
INSERT INTO `tb_user` VALUES ('36', 'ren@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '任尚光', 'ren@valuelink.cn', '10', '1', '2', '18210091816', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理经理', '32', '2016-12-25 18:53:09', '2016-12-25 19:29:33');
INSERT INTO `tb_user` VALUES ('37', 'Fiona.wang@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '王慧芳', 'Fiona.wang@valuelink.cn', '10', '1', '2', '18033861360', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理', '33', '2016-12-25 18:53:09', '2016-12-25 19:29:48');
INSERT INTO `tb_user` VALUES ('38', 'tony.wang@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '王剑南', 'tony.wang@valuelink.cn', '10', '1', '4', '13581795461', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理经理', '34', '2016-12-25 18:53:09', '2016-12-25 19:28:29');
INSERT INTO `tb_user` VALUES ('39', 'alex.liu@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '刘晓', 'alex.liu@valuelink.cn', '10', '1', '2', '18600369761', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-12-25 18:53:09', '127.0.0.1', '2016-12-25 18:53:09', '1', '1', 'BJ', '评估助理经理', '35', '2016-12-25 18:53:09', '2016-12-25 19:28:52');
INSERT INTO `tb_user` VALUES ('40', 'William@valuelink.cn', 'ad0ba664d5f4357b08e09861c81bae0f', '01e6d62a9fdc08cd', '陈广宇', 'william.chen@valuelink.cn', null, '1', '1', '18500031870', 'ad0ba664d5f4357b08e09861c81bae0f', '2016-12-25 18:53:09', '', '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2017-06-01 18:16:52', '127.0.0.1', '2017-06-01 18:16:52', '1', '1', 'BJ', '合伙人', '11', '2016-12-25 18:53:09', '2017-06-01 18:17:04');
INSERT INTO `tb_user` VALUES ('41', 'message@valuelink.cn', '262f80263be33dcad7f98d4ec0cd5c5c', '8a34a50d87f62f93', '王坤测试', 'message@valuelink.cn', null, '1', '2', '13800138000', '262f80263be33dcad7f98d4ec0cd5c5c', '2016-04-26 10:53:48', null, '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-04-26 11:04:35', '127.0.0.1', '2016-04-26 11:04:35', '1', '1', 'BJ', '合伙人', '5', '2016-04-26 10:53:48', '2016-04-26 11:04:36');
INSERT INTO `tb_user` VALUES ('42', 'message@valuelink.cn', '262f80263be33dcad7f98d4ec0cd5c5c', '8a34a50d87f62f93', '王坤测试', 'message@valuelink.cn', null, '1', '2', '13800138000', '262f80263be33dcad7f98d4ec0cd5c5c', '2016-04-26 10:53:48', null, '<p>签名</p><p><img data-filename=\"\" src=\"http://img0.bdstatic.com/img/image/lvyou/liushishi1.jpg\" style=\"width: 292px;\"><br></p>', null, '127.0.0.1', '2016-04-26 11:04:35', '127.0.0.1', '2016-04-26 11:04:35', '1', '1', 'BJ', '合伙人', '5', '2016-04-26 10:53:48', '2016-04-26 11:04:36');

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES ('2', '1', '3');
INSERT INTO `tb_user_role` VALUES ('3', '3', '2');
INSERT INTO `tb_user_role` VALUES ('4', '2', null);
INSERT INTO `tb_user_role` VALUES ('5', '4', '3');
