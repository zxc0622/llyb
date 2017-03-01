/*
Navicat MySQL Data Transfer

Source Server         : 101.200.74.145_root
Source Server Version : 50626
Source Host           : 101.200.74.145:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-09-08 16:25:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_area`
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
`id`  bigint(12) NOT NULL AUTO_INCREMENT COMMENT '编号' ,
`parent_id`  bigint(12) NOT NULL COMMENT '父级编号' ,
`parent_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有父级编号' ,
`code`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域编码' ,
`name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名称' ,
`type`  int(1) NULL DEFAULT NULL COMMENT '区域类型（1：国家；2：省份、直辖市；3：地市；4：区县）' ,
`create_by`  bigint(12) NULL DEFAULT NULL COMMENT '创建者' ,
`create_date`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`update_by`  bigint(12) NULL DEFAULT NULL COMMENT '更新者' ,
`update_date`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
`remarks`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息' ,
`del_flag`  int(1) NOT NULL DEFAULT 0 COMMENT '删除标记（0：正常；1：删除）' ,
PRIMARY KEY (`id`),
INDEX `sys_area_parent_id` (`parent_id`) USING BTREE ,
INDEX `sys_area_parent_ids` (`parent_ids`) USING BTREE ,
INDEX `sys_area_del_flag` (`del_flag`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='区域表'
AUTO_INCREMENT=11

;

-- ----------------------------
-- Table structure for `sys_class`
-- ----------------------------
DROP TABLE IF EXISTS `sys_class`;
CREATE TABLE `sys_class` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`code`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级编号' ,
`name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级名称' ,
`grade`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级' ,
`report_time`  datetime NULL DEFAULT NULL COMMENT '报到时间' ,
`train_time`  datetime NULL DEFAULT NULL COMMENT '培训截止时间' ,
`organization_id`  bigint(12) NOT NULL COMMENT '机构id_外键' ,
`create_by`  bigint(12) NULL DEFAULT NULL COMMENT '创建人' ,
`create_date`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`update_by`  bigint(12) NULL DEFAULT NULL COMMENT '修改人' ,
`update_date`  datetime NULL DEFAULT NULL COMMENT '修改时间' ,
`del_flag`  int(1) NULL DEFAULT NULL COMMENT '删除标志' ,
`principal`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人' ,
`remarks`  tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注' ,
`max_student_no`  int(4) NULL DEFAULT 0 COMMENT '学号流水号最大值' ,
PRIMARY KEY (`id`),
FOREIGN KEY (`organization_id`) REFERENCES `sys_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `sys_class_organization_id` (`organization_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='班级表'
AUTO_INCREMENT=76

;

-- ----------------------------
-- Table structure for `sys_class_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `sys_class_teacher`;
CREATE TABLE `sys_class_teacher` (
`id`  bigint(12) NOT NULL AUTO_INCREMENT COMMENT '班级老师id' ,
`class_id`  bigint(12) NOT NULL COMMENT '班级id' ,
`user_id`  bigint(12) NOT NULL COMMENT '用户id' ,
`remark`  tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注' ,
`del_flag`  int(1) NULL DEFAULT NULL COMMENT '删除标志 0：未删除 1：已删除' ,
`create_by`  bigint(12) NULL DEFAULT NULL COMMENT '创建人' ,
`create_date`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`update_by`  bigint(12) NULL DEFAULT NULL COMMENT '更新人' ,
`update_date`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='班级学生中间表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `sys_department`
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
`id`  bigint(12) NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
`organization_id`  bigint(12) NULL DEFAULT NULL COMMENT '机构id_外键' ,
`parent_id`  bigint(12) NULL DEFAULT NULL COMMENT '所属父级部门id' ,
`parent_ids`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有父级部门id' ,
`name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称' ,
`principal`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人' ,
`mobile`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`fax`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真' ,
`post_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码' ,
`email`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱' ,
`address`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址' ,
`remarks`  tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注信息' ,
`create_by`  bigint(12) NULL DEFAULT NULL COMMENT '创建人' ,
`create_date`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`update_by`  bigint(12) NULL DEFAULT NULL COMMENT '更新者' ,
`update_date`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
`del_flag`  int(1) NULL DEFAULT NULL COMMENT '删除状态' ,
PRIMARY KEY (`id`),
INDEX `sys_department_organization_id` (`organization_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='部门表'
AUTO_INCREMENT=33

;

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号' ,
`label`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名' ,
`value`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据值' ,
`type`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型' ,
`description`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述' ,
`sort`  int(4) NOT NULL COMMENT '排序（升序）' ,
`create_by`  bigint(12) NULL DEFAULT NULL COMMENT '创建者' ,
`create_date`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`update_by`  bigint(12) NULL DEFAULT NULL COMMENT '更新者' ,
`update_date`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
`remarks`  tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注信息' ,
`del_flag`  int(1) NOT NULL DEFAULT 0 COMMENT '删除标记（0：正常；1：删除）' ,
PRIMARY KEY (`id`),
INDEX `sys_dict_value` (`value`) USING BTREE ,
INDEX `sys_dict_label` (`label`) USING BTREE ,
INDEX `sys_dict_del_flag` (`del_flag`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='系统字典表'
AUTO_INCREMENT=323

;

-- ----------------------------
-- Table structure for `sys_dormitory`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dormitory`;
CREATE TABLE `sys_dormitory` (
`id`  bigint(12) NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`code`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宿舍编号' ,
`organization_id`  bigint(12) NULL DEFAULT NULL COMMENT '机构id_外键' ,
`remarks`  tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注' ,
`create_by`  bigint(12) NULL DEFAULT NULL COMMENT '创建人' ,
`create_date`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`update_by`  bigint(12) NULL DEFAULT NULL COMMENT '修改人' ,
`update_date`  datetime NULL DEFAULT NULL COMMENT '修改时间' ,
`del_flag`  int(1) NOT NULL DEFAULT 0 COMMENT '删除标志' ,
PRIMARY KEY (`id`),
FOREIGN KEY (`organization_id`) REFERENCES `sys_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `sys_dormitory_sys_dormitory` (`organization_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='宿舍'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
`id`  bigint(12) NOT NULL AUTO_INCREMENT COMMENT '编号' ,
`parent_id`  bigint(12) NOT NULL COMMENT '父级编号' ,
`parent_ids`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有父级编号' ,
`name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称' ,
`href`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接' ,
`target`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标（mainFrame、 _blank、_self、_parent、_top）' ,
`icon`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标' ,
`sort`  int(11) NOT NULL COMMENT '排序（升序）' ,
`is_show`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否在菜单中显示（1：显示；0：不显示）' ,
`permission`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识' ,
`create_by`  bigint(12) NULL DEFAULT NULL COMMENT '创建者' ,
`create_date`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`update_by`  bigint(12) NULL DEFAULT NULL COMMENT '更新者' ,
`update_date`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
`remarks`  tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注信息' ,
`del_flag`  int(1) NOT NULL DEFAULT 0 COMMENT '删除标记（0：正常；1：删除）' ,
PRIMARY KEY (`id`),
INDEX `sys_menu_parent_id` (`parent_id`) USING BTREE ,
INDEX `sys_menu_parent_ids` (`parent_ids`) USING BTREE ,
INDEX `sys_menu_del_flag` (`del_flag`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='菜单表'
AUTO_INCREMENT=397

;

-- ----------------------------
-- Table structure for `sys_oper_record`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_record`;
CREATE TABLE `sys_oper_record` (
`id`  bigint(12) NOT NULL AUTO_INCREMENT ,
`platform`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户操作系统信息' ,
`browser`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户浏览器信息' ,
`method`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'GET、POST、PUT、DELETE' ,
`is_ajax`  tinyint(1) NOT NULL COMMENT '是不是Ajax方式请求' ,
`moudle`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问的模块名称' ,
`action`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '做的操作(执行的方法名)' ,
`parameter`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录的操作参数' ,
`referer`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '引用页的网址' ,
`create_by`  bigint(12) NULL DEFAULT NULL ,
`create_date`  datetime NULL DEFAULT NULL ,
`update_by`  bigint(12) NULL DEFAULT NULL ,
`update_date`  datetime NULL DEFAULT NULL ,
`del_flag`  int(1) NOT NULL DEFAULT 0 COMMENT '删除标记（0：正常；1：删除）' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=43483

;

-- ----------------------------
-- Table structure for `sys_organization`
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
`id`  bigint(12) NOT NULL AUTO_INCREMENT COMMENT '编号' ,
`type`  int(1) NOT NULL COMMENT '机构类型字典值' ,
`name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称' ,
`principal`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构负责人' ,
`tel`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话' ,
`fax`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真' ,
`post_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码' ,
`email`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱' ,
`area_id`  bigint(12) NOT NULL COMMENT '区域_外键' ,
`addr`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址' ,
`remarks`  tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注' ,
`create_by`  bigint(12) NULL DEFAULT NULL COMMENT '创建人' ,
`create_date`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`update_by`  bigint(12) NULL DEFAULT NULL COMMENT '修改人' ,
`update_date`  datetime NULL DEFAULT NULL COMMENT '修改时间' ,
`del_flag`  int(1) NULL DEFAULT NULL COMMENT '删除标识' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='机构表（包括学生所属的学校，学生就业的单位）'
AUTO_INCREMENT=51

;

-- ----------------------------
-- Table structure for `sys_person`
-- ----------------------------
DROP TABLE IF EXISTS `sys_person`;
CREATE TABLE `sys_person` (
`id`  bigint(12) NOT NULL AUTO_INCREMENT ,
`user_id`  bigint(12) NULL DEFAULT NULL COMMENT '用户id' ,
`organization_id`  bigint(12) NULL DEFAULT NULL COMMENT '机构id' ,
`department_id`  bigint(12) NULL DEFAULT NULL COMMENT '部门id' ,
`phone`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号' ,
`email`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱' ,
`remarks`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注' ,
`create_by`  bigint(12) NULL DEFAULT NULL COMMENT '创建人' ,
`create_date`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`update_by`  bigint(12) NULL DEFAULT NULL COMMENT '修改人' ,
`update_date`  datetime NULL DEFAULT NULL COMMENT '修改时间' ,
`del_flag`  int(1) NULL DEFAULT NULL COMMENT '删除标志  0 未删除  1 删除' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=27

;

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
`id`  bigint(12) NOT NULL AUTO_INCREMENT COMMENT '编号' ,
`name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称' ,
`enname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名称' ,
`organization_id`  bigint(12) NULL DEFAULT NULL ,
`department_id`  bigint(12) NULL DEFAULT NULL ,
`role_type`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色类型' ,
`create_by`  bigint(12) NULL DEFAULT NULL COMMENT '创建者' ,
`create_date`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`update_by`  bigint(12) NULL DEFAULT NULL COMMENT '更新者' ,
`update_date`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
`remarks`  tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注信息' ,
`del_flag`  int(1) NOT NULL DEFAULT 0 COMMENT '删除标记（0：正常；1：删除）' ,
PRIMARY KEY (`id`),
INDEX `sys_role_del_flag` (`del_flag`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='角色表'
AUTO_INCREMENT=7

;

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
`role_id`  bigint(12) NOT NULL COMMENT '角色id_外键' ,
`menu_id`  bigint(12) NOT NULL COMMENT '菜单id_外键' ,
PRIMARY KEY (`role_id`, `menu_id`),
FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `sys_role_menu_menu_id` (`menu_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='角色-菜单'

;

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号' ,
`login_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名' ,
`password`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码' ,
`type`  int(1) NULL DEFAULT NULL COMMENT '类型(0青软实训 1机构 2学校 3学生)' ,
`name`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名' ,
`login_ip`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登陆IP' ,
`login_date`  datetime NULL DEFAULT NULL COMMENT '最后登陆时间' ,
`on_state`  int(1) NULL DEFAULT NULL COMMENT '使用状态' ,
`create_by`  bigint(20) NULL DEFAULT NULL COMMENT '创建者' ,
`create_date`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`update_by`  bigint(20) NULL DEFAULT NULL COMMENT '更新者' ,
`update_date`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
`email`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`remarks`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息' ,
`del_flag`  int(1) NULL DEFAULT 0 COMMENT '删除标记（0：正常；1：删除）' ,
PRIMARY KEY (`id`),
INDEX `sys_user_login_name` (`login_name`) USING BTREE ,
INDEX `sys_user_update_date` (`update_date`) USING BTREE ,
INDEX `sys_user_del_flag` (`del_flag`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户表'
AUTO_INCREMENT=124

;

-- ----------------------------
-- Table structure for `sys_user_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_log`;
CREATE TABLE `sys_user_log` (
`id`  bigint(12) NOT NULL AUTO_INCREMENT ,
`user_id`  bigint(12) NULL DEFAULT NULL ,
`login_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`password`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`role`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  int(1) NULL DEFAULT NULL ,
`dispose`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`login_ip`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`login_date`  datetime NULL DEFAULT NULL ,
`on_state`  int(1) NULL DEFAULT NULL ,
`organization_id`  bigint(11) NULL DEFAULT NULL ,
`department_id`  bigint(11) NULL DEFAULT NULL ,
`phone`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`update_by`  bigint(11) NULL DEFAULT NULL ,
`update_date`  datetime NULL DEFAULT NULL ,
`remarks`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`del_flag`  int(1) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=45

;

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
`user_id`  bigint(12) NOT NULL COMMENT '用户id_外键' ,
`role_id`  bigint(12) NOT NULL COMMENT '角色id_外键' ,
PRIMARY KEY (`user_id`, `role_id`),
FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `sys_user_role_role_id` (`role_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户-角色'

;

-- ----------------------------
-- Auto increment value for `sys_area`
-- ----------------------------
ALTER TABLE `sys_area` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for `sys_class`
-- ----------------------------
ALTER TABLE `sys_class` AUTO_INCREMENT=76;

-- ----------------------------
-- Auto increment value for `sys_class_teacher`
-- ----------------------------
ALTER TABLE `sys_class_teacher` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `sys_department`
-- ----------------------------
ALTER TABLE `sys_department` AUTO_INCREMENT=33;

-- ----------------------------
-- Auto increment value for `sys_dict`
-- ----------------------------
ALTER TABLE `sys_dict` AUTO_INCREMENT=323;

-- ----------------------------
-- Auto increment value for `sys_dormitory`
-- ----------------------------
ALTER TABLE `sys_dormitory` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `sys_menu`
-- ----------------------------
ALTER TABLE `sys_menu` AUTO_INCREMENT=397;

-- ----------------------------
-- Auto increment value for `sys_oper_record`
-- ----------------------------
ALTER TABLE `sys_oper_record` AUTO_INCREMENT=43483;

-- ----------------------------
-- Auto increment value for `sys_organization`
-- ----------------------------
ALTER TABLE `sys_organization` AUTO_INCREMENT=51;

-- ----------------------------
-- Auto increment value for `sys_person`
-- ----------------------------
ALTER TABLE `sys_person` AUTO_INCREMENT=27;

-- ----------------------------
-- Auto increment value for `sys_role`
-- ----------------------------
ALTER TABLE `sys_role` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `sys_user`
-- ----------------------------
ALTER TABLE `sys_user` AUTO_INCREMENT=124;

-- ----------------------------
-- Auto increment value for `sys_user_log`
-- ----------------------------
ALTER TABLE `sys_user_log` AUTO_INCREMENT=45;
