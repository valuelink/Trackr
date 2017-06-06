
---- 权限表
CREATE TABLE `tb_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL COMMENT '权限类型，用户或者角色',
  `type_id` bigint(20) NOT NULL COMMENT '所属用户或者角色ID',
  `authority` varchar(50) NOT NULL DEFAULT '' COMMENT '权限值',
  `creator_id` varchar(32) DEFAULT NULL COMMENT '创建者的ID',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` timestamp NOT NULL  COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

---角色表
CREATE TABLE `tb_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `creator_id` varchar(32) NOT NULL COMMENT '通过后台，添加本角色的操作者的账号',
  `description` varchar(100) DEFAULT NULL COMMENT '描述信息',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` timestamp NOT NULL COMMENT '本记录最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT='角色表';



