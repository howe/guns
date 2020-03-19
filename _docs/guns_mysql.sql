DROP DATABASE IF EXISTS guns_advanced;
CREATE DATABASE IF NOT EXISTS guns_advanced DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

USE guns_advanced;

/*
 Navicat Premium Data Transfer

 Source Server         : local-vmware
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 192.168.11.128:3306
 Source Schema         : guns_advanced

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 19/03/2020 21:53:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for database_info
-- ----------------------------
DROP TABLE IF EXISTS `database_info`;
CREATE TABLE `database_info`  (
  `db_id` bigint(20) NOT NULL COMMENT '主键id',
  `db_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库名称（英文名称）',
  `jdbc_driver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'jdbc的驱动类型',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库连接的账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库连接密码',
  `jdbc_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'jdbc的url',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注，摘要',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`db_id`) USING BTREE,
  UNIQUE INDEX `NAME_UNIQUE`(`db_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据库信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of database_info
-- ----------------------------
INSERT INTO `database_info` VALUES (1240625039548657665, 'master', 'com.mysql.cj.jdbc.Driver', 'root', 'root', 'jdbc:mysql://192.168.11.128:3306/guns_advanced?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=CONVERT_TO_NULL&useSSL=false&serverTimezone=CTT', '主数据源，项目启动数据源！', '2020-03-19 21:03:53');

-- ----------------------------
-- Table structure for excel_export_deploy
-- ----------------------------
DROP TABLE IF EXISTS `excel_export_deploy`;
CREATE TABLE `excel_export_deploy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'excel导出配置名称',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `nid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一标识',
  `template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模版路径',
  `data_source` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '0开启1关闭',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `E_E_D_NID`(`nid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'excel导出配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of excel_export_deploy
-- ----------------------------
INSERT INTO `excel_export_deploy` VALUES (1, '测试导出excel', '#{name}导出文件', 'test', '/uploadFiles/excelExportTemplate/1240266064118456322.xlsx', 'import cn.stylefeng.roses.core.data.SqlExe;\n\nimport javax.servlet.http.HttpServletRequest;\nimport java.util.HashMap;\nimport java.util.List;\nimport java.util.Map;\n\npublic class Engine {\n    public Map<String, Object> run(HttpServletRequest request) {\n        Map<String, Object> map = new HashMap<String, Object>();\n        // 通过request 可获取前台传来的参数\n        // 通过 GroovyTool.findManyRowData(sql, dataSource) 可获得对应的数据源\n        // 可像正常的使用java一样调用java类、方法以及Spring的bean\n        List<Map<String, Object>> list = SqlExe.selectList(\"SELECT * FROM `sys_dict`\", null);\n        map.put(\"name\", \"系统字典属性内容\");\n        map.put(\"list\", list);\n        System.out.println(\"123123123\");\n        return map;\n    }\n}', 0);

-- ----------------------------
-- Table structure for oauth_user_info
-- ----------------------------
DROP TABLE IF EXISTS `oauth_user_info`;
CREATE TABLE `oauth_user_info`  (
  `oauth_id` bigint(20) NOT NULL COMMENT '主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `blog` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户网址',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在公司',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户备注（各平台中的用户个人介绍）',
  `gender` int(11) NULL DEFAULT NULL COMMENT '性别，1-男，0-女',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户来源',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户授权的token',
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方平台的用户唯一di',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新用户',
  PRIMARY KEY (`oauth_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '第三方用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性编码标识',
  `dict_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否是字典中的值',
  `dict_type_id` bigint(20) NULL DEFAULT NULL COMMENT '字典类型的编码',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值，如果是字典中的类型，则为dict的code',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1143324237579165697, '验证码开关', 'GUNS_KAPTCHA_OPEN', 'Y', 1106120265689055233, 'DISABLE', '是否开启验证码', '2019-06-24 12:46:43', 1, '2019-06-25 09:04:42', 1);
INSERT INTO `sys_config` VALUES (1143386834613694465, '阿里云短信的keyId', 'GUNS_SMS_ACCESSKEY_ID', 'N', NULL, 'xxxkey', '阿里云短信的密钥key', '2019-06-25 13:13:59', 1, '2019-06-25 13:19:21', 1);
INSERT INTO `sys_config` VALUES (1143386953933254657, '阿里云短信的secret', 'GUNS_SMS_ACCESSKEY_SECRET', 'N', NULL, 'xxxsecret', '阿里云短信的secret', '2019-06-25 13:14:28', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143387023449649154, '阿里云短信的签名', 'GUNS_SMS_SIGN_NAME', 'N', NULL, 'xxxsign', '阿里云短信的签名', '2019-06-25 13:14:44', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143387131109044225, '阿里云短信登录的模板号', 'GUNS_SMS_LOGIN_TEMPLATE_CODE', 'N', NULL, 'SMS_XXXXXX', '阿里云短信登录的模板号', '2019-06-25 13:15:10', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143387225019510785, '验证码短信失效时间', 'GUNS_SMS_INVALIDATE_MINUTES', 'N', NULL, '2', '验证码短信失效时间', '2019-06-25 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143468689664876546, '管理系统名称', 'GUNS_SYSTEM_NAME', 'N', NULL, 'Guns快速开发平台', '管理系统名称', '2019-06-25 18:39:15', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143468867767607297, '默认系统密码', 'GUNS_DEFAULT_PASSWORD', 'N', NULL, '111111', '默认系统密码', '2019-06-25 18:39:57', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143469008025133058, 'OAuth2登录用户的账号标识', 'GUNS_OAUTH2_PREFIX', 'N', NULL, 'oauth2', 'OAuth2登录用户的账号标识', '2019-06-25 18:40:31', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145207130463191041, '顶部导航条是否开启', 'GUNS_DEFAULT_ADVERT', 'Y', 1106120265689055233, 'DISABLE', '顶部Guns广告是否开启', '2019-06-30 13:47:11', 1, '2020-01-01 17:22:52', 1);
INSERT INTO `sys_config` VALUES (1145915627211370498, 'Guns发布的编号', 'GUNS_SYSTEM_RELEASE_VERSION', 'N', NULL, '20200318', '用于防止浏览器缓存相关的js和css', '2019-07-02 12:42:30', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370499, '文件上传路径', 'GUNS_FILE_UPLOAD_PATH', 'N', NULL, 'D:/tmp/', '文件上传默认目录', '2019-08-30 09:10:40', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370500, 'BPMN文件上传路径', 'GUNS_BPMN_FILE_UPLOAD_PATH', 'N', NULL, 'D:/tmp/', '工作流文件上传默认目录', '2019-08-30 09:10:40', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370501, '获取系统地密钥过期时间', 'GUNS_JWT_SECRET_EXPIRE', 'N', NULL, '86400', '获取系统地密钥过期时间（单位：秒），默认1天', '2019-10-16 23:02:39', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370502, '获取token的header标识', 'GUNS_TOKEN_HEADER_NAME', 'N', NULL, 'Authorization', '获取token的header标识', '2019-10-16 23:02:39', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370503, '获取租户是否开启的标识', 'GUNS_TENANT_OPEN', 'Y', 1106120265689055233, 'DISABLE', '获取租户是否开启的标识，默认是关的', '2019-10-16 23:02:39', 1, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL COMMENT '主键id',
  `pid` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `pids` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '父级ids',
  `simple_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简称',
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (24, 0, '[0],', '总公司', '总公司', '', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (25, 24, '[0],[24],', '开发部', '开发部', '', NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (26, 24, '[0],[24],', '运营部', '运营部', '', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (27, 24, '[0],[24],', '战略部', '战略部', '', NULL, 4, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `dict_id` bigint(20) NOT NULL COMMENT '字典id',
  `dict_type_id` bigint(20) NOT NULL COMMENT '所属字典类型的id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `parent_id` bigint(20) NOT NULL COMMENT '上级代码id',
  `parent_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有上级id',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ENABLE' COMMENT '状态（字典）',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典的描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '基础字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1106120532442595330, 1106120208097067009, 'M', '男', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:11:00', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120574163337218, 1106120208097067009, 'F', '女', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:11:10', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120645697191938, 1106120265689055233, 'ENABLE', '启用', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:11:27', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120699468169217, 1106120265689055233, 'DISABLE', '禁用', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:11:40', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120784318939137, 1106120322450571266, 'ENABLE', '启用', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:12:00', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120825993543682, 1106120322450571266, 'FREEZE', '冻结', 0, '[0]', 'ENABLE', 1, '', '2019-03-14 17:12:10', '2019-03-16 10:56:36', 1, 1);
INSERT INTO `sys_dict` VALUES (1106120875872206849, 1106120322450571266, 'DELETED', '已删除', 0, '[0]', 'ENABLE', -1221, '', '2019-03-14 17:12:22', '2019-03-16 10:56:53', 1, 1);
INSERT INTO `sys_dict` VALUES (1106120935070613505, 1106120388036902914, 'Y', '删除', 0, '[0]', 'ENABLE', 23333, '', '2019-03-14 17:12:36', '2019-03-16 10:58:53', 1, 1);
INSERT INTO `sys_dict` VALUES (1106120968910258177, 1106120388036902914, 'N', '未删除', 0, '[0]', 'ENABLE', 1212211221, '', '2019-03-14 17:12:44', '2019-03-16 10:59:03', 1, 1);
INSERT INTO `sys_dict` VALUES (1149218674746355713, 1149217131989069826, 'BASE_SYSTEM', '基础功能', 0, '[0]', 'ENABLE', 1, '系统管理平台', '2019-07-11 15:27:38', '2020-01-01 17:14:45', 1, 1);
INSERT INTO `sys_dict` VALUES (1160533174626959361, 1160532704105742337, '00101', '办公审批', 0, '[0]', 'ENABLE', 10, '', '2019-08-11 20:47:25', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533264645111810, 1160532704105742337, '00102', '行政审批', 0, '[0]', 'ENABLE', 20, '', '2019-08-11 20:47:47', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533377727741954, 1160532775455047681, 'KEY_LEAVE', '请假流程标识', 0, '[0]', 'ENABLE', 10, '', '2019-08-11 20:48:14', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533455343337474, 1160532775455047681, 'KEY_FINANCE', '财务流程标识', 0, '[0]', 'ENABLE', 20, '', '2019-08-11 20:48:32', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533574843252737, 1160532886713155585, '00401', '事假', 0, '[0]', 'ENABLE', 10, '', '2019-08-11 20:49:01', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533625615302658, 1160532886713155585, '00402', '婚假', 0, '[0]', 'ENABLE', 20, '', '2019-08-11 20:49:13', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533707215486977, 1160532886713155585, '00403', '产假', 0, '[0]', 'ENABLE', 30, '', '2019-08-11 20:49:32', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533765403066370, 1160532886713155585, '00404', '病假', 0, '[0]', 'ENABLE', 40, '', '2019-08-11 20:49:46', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533863834992641, 1160532886713155585, '00405', '公假', 0, '[0]', 'ENABLE', 50, '', '2019-08-11 20:50:09', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533945309347841, 1160532886713155585, '00406', '年假', 0, '[0]', 'ENABLE', 60, '', '2019-08-11 20:50:29', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160534007389241346, 1160532886713155585, '00407', '其他', 0, '[0]', 'ENABLE', 70, '', '2019-08-11 20:50:44', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1212300736972668929, 1149217131989069826, 'ENT_FUNC', '企业功能', 0, '[0]', 'ENABLE', 20, '企业功能', '2020-01-01 17:13:14', NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_type_id` bigint(20) NOT NULL COMMENT '字典类型id',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型名称',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典描述',
  `system_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否是系统字典，Y-是，N-否',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ENABLE' COMMENT '状态(字典)',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dict_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1106120208097067009, 'SEX', '性别', '', 'Y', 'ENABLE', 4, '2019-03-14 17:09:43', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1106120265689055233, 'STATUS', '状态', '', 'Y', 'ENABLE', 3, '2019-03-14 17:09:57', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1106120322450571266, 'ACCOUNT_STATUS', '账号状态', '', 'Y', 'ENABLE', 40, '2019-03-14 17:10:10', 1, '2019-08-11 20:46:38', 1);
INSERT INTO `sys_dict_type` VALUES (1106120388036902914, 'DEL_FLAG', '是否删除', '', 'Y', 'ENABLE', 2, '2019-03-14 17:10:26', 1, '2019-03-27 16:26:31', 1);
INSERT INTO `sys_dict_type` VALUES (1149217131989069826, 'SYSTEM_TYPE', '系统分类', '系统所有分类的维护', 'Y', 'ENABLE', 50, '2019-07-11 15:21:30', 1, '2019-08-11 20:46:47', 1);
INSERT INTO `sys_dict_type` VALUES (1160532704105742337, 'FLOW_CATEGARY', '工作流分类', '工作流分类', 'Y', 'ENABLE', 60, '2019-08-11 20:45:33', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1160532775455047681, 'FLOW_KEY', '工作流标识', '工作流标识', 'Y', 'ENABLE', 70, '2019-08-11 20:45:50', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1160532886713155585, 'LEAVE_TYPE', '请假类型', '请假类型', 'Y', 'ENABLE', 80, '2019-08-11 20:46:17', 1, '2019-08-11 20:46:23', 1);

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info`  (
  `file_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `file_bucket` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件仓库（oss仓库）',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `file_suffix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `file_size_kb` bigint(20) NULL DEFAULT NULL COMMENT '文件大小kb',
  `final_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件唯一标识id',
  `file_path` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------
INSERT INTO `sys_file_info` VALUES ('1167385745179131905', NULL, '请假流程.bpmn20.xml', 'xml', 6, '1167385745179131905.xml', '/Users/stylefeng/tmp/gunsTempFiles/1167385745179131905.xml', '2019-08-30 18:37:05', NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `login_log_id` bigint(20) NOT NULL COMMENT '主键',
  `log_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '管理员id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否执行成功',
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '具体消息',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`login_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL COMMENT '主键id',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url地址',
  `sort` int(65) NULL DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) NULL DEFAULT NULL COMMENT '菜单层级',
  `menu_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是菜单(字典)',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ENABLE' COMMENT '菜单状态(字典)',
  `new_page_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否打开新页面的标识(字典)',
  `open_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否打开(字典)',
  `system_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统分类(字典)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (105, 'system', '0', '[0],', '系统管理', 'layui-icon layui-icon-set', '#', 20, 1, 'Y', NULL, 'ENABLE', NULL, '1', 'BASE_SYSTEM', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (106, 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', 10, 2, 'Y', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (107, 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', NULL, '/mgr/add', 1, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (108, 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', NULL, '/mgr/edit', 2, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (109, 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', NULL, '/mgr/delete', 3, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (110, 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', NULL, '/mgr/reset', 4, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (111, 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', NULL, '/mgr/freeze', 5, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (112, 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', NULL, '/mgr/unfreeze', 6, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (113, 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', NULL, '/mgr/setRole', 7, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (114, 'role', 'system', '[0],[system],', '角色管理', '', '/role', 20, 2, 'Y', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (115, 'role_add', 'role', '[0],[system],[role],', '添加角色', NULL, '/role/add', 1, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (116, 'role_edit', 'role', '[0],[system],[role],', '修改角色', NULL, '/role/edit', 2, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (117, 'role_remove', 'role', '[0],[system],[role],', '删除角色', NULL, '/role/remove', 3, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (118, 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', NULL, '/role/setAuthority', 4, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (119, 'menu', 'system', '[0],[system],', '菜单管理', '', '/menu', 50, 2, 'Y', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (120, 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', NULL, '/menu/add', 1, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (121, 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', NULL, '/menu/edit', 2, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (122, 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', NULL, '/menu/remove', 3, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (128, 'log', 'system', '[0],[system],', '业务日志', '', '/log', 70, 2, 'Y', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (130, 'druid', 'system', '[0],[system],', '监控管理', '', '/druid', 80, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:50:06', NULL, 1);
INSERT INTO `sys_menu` VALUES (131, 'dept', 'system', '[0],[system],', '部门管理', '', '/dept', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (132, 'dict', 'system', '[0],[system],', '字典管理', '', '/dictType', 40, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (133, 'loginLog', 'system', '[0],[system],', '登录日志', '', '/loginLog', 60, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:29', NULL, 1);
INSERT INTO `sys_menu` VALUES (134, 'log_clean', 'log', '[0],[system],[log],', '清空日志', NULL, '/log/delLog', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (135, 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', NULL, '/dept/add', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (136, 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', NULL, '/dept/update', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (137, 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', NULL, '/dept/delete', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (138, 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', NULL, '/dictType/addItem', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (139, 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', NULL, '/dictType/editItem', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (140, 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', NULL, '/dictType/delete', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (141, 'notice', 'system', '[0],[system],', '通知管理', '', '/notice', 90, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:44', NULL, 1);
INSERT INTO `sys_menu` VALUES (142, 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', NULL, '/notice/add', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:44', NULL, 1);
INSERT INTO `sys_menu` VALUES (143, 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', NULL, '/notice/update', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:44', NULL, 1);
INSERT INTO `sys_menu` VALUES (144, 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', NULL, '/notice/delete', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:44', NULL, 1);
INSERT INTO `sys_menu` VALUES (145, 'sys_message', 'dashboard', '[0],[dashboard],', '消息通知', 'layui-icon layui-icon-tips', '/system/notice', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-04-08 22:49:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (149, 'api_mgr', 'dev_tools', '[0],[dev_tools],', '接口文档', 'fa-leaf', '/swagger-ui.html', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-15 18:13:00', NULL, 1);
INSERT INTO `sys_menu` VALUES (150, 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (151, 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (152, 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (153, 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (154, 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', 6, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (155, 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (156, 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (157, 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', 6, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (158, 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (159, 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (160, 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:29', NULL, 1);
INSERT INTO `sys_menu` VALUES (161, 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:29', NULL, 1);
INSERT INTO `sys_menu` VALUES (162, 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (163, 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', 6, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (164, 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', 7, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (165, 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', 8, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (166, 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', 9, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (167, 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', 10, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (171, 'dev_tools', '0', '[0],', '开发管理', 'layui-icon layui-icon-code-circle', '#', 30, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-05-11 13:40:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (172, 'dashboard', '0', '[0],', '主控面板', 'layui-icon layui-icon-home', '#', 10, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-04-08 22:48:15', NULL, 1);
INSERT INTO `sys_menu` VALUES (1110777136265838594, 'demos_show', '0', '[0],', '高级组件', 'layui-icon-diamond', '#', 60, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 13:34:41', '2020-01-01 18:23:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1110777366856089602, 'excel_import', 'EXCEL_PROCESS', '[0],[EXCEL_PROCESS],', 'excel导入', 'layui-icon-rate-solid', '/excel/import', 10, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 13:35:36', '2020-01-01 18:22:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1110777491464667137, 'excel_export', 'EXCEL_PROCESS', '[0],[EXCEL_PROCESS],', 'excel导出', 'layui-icon-rate-solid', '/excel/export', 20, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 13:36:06', '2020-01-01 18:22:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1110787391943098370, 'advanced_form', 'demos_show', '[0],[demos_show],', '高级表单', '', '/egForm', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 14:15:26', '2020-01-01 18:23:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1110839216310329346, 'pdf_view', 'demos_show', '[0],[demos_show],', '文档预览', '', '/loadPdfFile', 40, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 17:41:22', '2020-01-01 18:23:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1111545968697860098, 'console', 'dashboard', '[0],[dashboard],', '项目介绍', '', '/system/console', 10, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2019-03-29 16:29:45', '2019-04-09 20:57:08', 1, 1);
INSERT INTO `sys_menu` VALUES (1111546189892870145, 'console2', 'dashboard', '[0],[dashboard],', '统计报表', '', '/system/console2', 20, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2019-03-29 16:30:38', '2019-04-08 22:49:48', 1, 1);
INSERT INTO `sys_menu` VALUES (1139827152854716418, 'data_source', '0', '[0],', '数据容器', 'layui-icon-template-1', '/databaseInfo', 40, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-06-15 17:29:05', '2020-01-01 18:23:17', 1, 1);
INSERT INTO `sys_menu` VALUES (1142957882422112257, 'SYS_CONFIG', 'dev_tools', '[0],[dev_tools],', '参数配置', 'fa-star', '/sysConfig', 30, 2, 'Y', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-24 08:49:28', '2020-01-01 18:33:09', 1, 1);
INSERT INTO `sys_menu` VALUES (1142957882422112258, 'SYS_CONFIG_ADD', 'SYS_CONFIG', '[0],[dev_tools],[SYS_CONFIG],', '参数配置添加', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-24 08:49:28', '2020-01-01 18:33:09', 1, 1);
INSERT INTO `sys_menu` VALUES (1142957882422112259, 'SYS_CONFIG_EDIT', 'SYS_CONFIG', '[0],[dev_tools],[SYS_CONFIG],', '参数配置修改', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-24 08:49:28', '2020-01-01 18:33:09', 1, 1);
INSERT INTO `sys_menu` VALUES (1142957882426306562, 'SYS_CONFIG_DELETE', 'SYS_CONFIG', '[0],[dev_tools],[SYS_CONFIG],', '参数配置删除', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-24 08:49:28', '2020-01-01 18:33:09', 1, 1);
INSERT INTO `sys_menu` VALUES (1144441072852684801, 'SYS_POSITION', 'system', '[0],[system],', '职位管理', 'fa-star', '/position', 35, 2, 'Y', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-28 11:03:09', '2019-06-28 11:06:42', 1, 1);
INSERT INTO `sys_menu` VALUES (1144441072852684802, 'SYS_POSITION_ADD', 'SYS_POSITION', '[0],[system],[SYS_POSITION],', '职位表添加', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-28 11:03:09', '2019-06-28 11:06:42', 1, 1);
INSERT INTO `sys_menu` VALUES (1144441072852684803, 'SYS_POSITION_EDIT', 'SYS_POSITION', '[0],[system],[SYS_POSITION],', '职位表修改', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-28 11:03:09', '2019-06-28 11:06:42', 1, 1);
INSERT INTO `sys_menu` VALUES (1144441072852684804, 'SYS_POSITION_DELETE', 'SYS_POSITION', '[0],[system],[SYS_POSITION],', '职位表删除', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-28 11:03:09', '2019-06-28 11:06:42', 1, 1);
INSERT INTO `sys_menu` VALUES (1149955324929765378, 'system_info', 'dashboard', '[0],[dashboard],', '系统监控', 'layui-icon-star-fill', '/system/systemInfo', 40, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2019-07-13 16:14:49', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1212299504967204865, 'EXCEL_PROCESS', '0', '[0],', 'excel处理', 'layui-icon-template', '#', 10, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2020-01-01 17:08:20', '2020-01-01 18:22:18', 1, 1);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint(20) NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (6, '欢迎', 'hi，Guns旗舰版发布了！', '2017-01-11 08:53:20', 1, '2018-12-28 23:24:48', 1);
INSERT INTO `sys_notice` VALUES (8, '你好', '你好，世界！', '2017-05-10 19:28:57', 1, '2018-12-28 23:28:26', 1);

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `operation_log_id` bigint(20) NOT NULL COMMENT '主键',
  `log_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志类型(字典)',
  `log_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(65) NULL DEFAULT NULL COMMENT '用户id',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类名称',
  `method` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '方法名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否成功(字典)',
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '备注',
  PRIMARY KEY (`operation_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES (1240637477484531714, '业务日志', '清空业务日志', 1, 'cn.stylefeng.guns.sys.modular.system.controller.LogController', 'delLog', '2020-03-19 21:53:19', '成功', '主键id=null');

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position`  (
  `position_id` bigint(20) NOT NULL COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位名称',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位编码',
  `sort` int(11) NOT NULL COMMENT '顺序',
  `status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ENABLE' COMMENT '状态(字典)',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`position_id`) USING BTREE,
  UNIQUE INDEX `CODE_UNI`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_position
-- ----------------------------
INSERT INTO `sys_position` VALUES (1, '董事长', 'President', 1, 'ENABLE', NULL, '2019-06-27 18:14:43', 1, NULL, NULL);
INSERT INTO `sys_position` VALUES (2, '总经理', 'GM', 2, 'ENABLE', NULL, '2019-06-27 18:14:43', 1, NULL, NULL);

-- ----------------------------
-- Table structure for sys_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE `sys_relation`  (
  `relation_id` bigint(20) NOT NULL COMMENT '主键',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单id',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_relation
-- ----------------------------
INSERT INTO `sys_relation` VALUES (1184839164297945090, 105, 5);
INSERT INTO `sys_relation` VALUES (1184839164306333697, 132, 5);
INSERT INTO `sys_relation` VALUES (1184839164310528002, 138, 5);
INSERT INTO `sys_relation` VALUES (1184839164318916609, 139, 5);
INSERT INTO `sys_relation` VALUES (1184839164323110913, 140, 5);
INSERT INTO `sys_relation` VALUES (1184839164327305218, 155, 5);
INSERT INTO `sys_relation` VALUES (1184839164335693826, 156, 5);
INSERT INTO `sys_relation` VALUES (1184839164339888130, 157, 5);
INSERT INTO `sys_relation` VALUES (1184839164344082434, 141, 5);
INSERT INTO `sys_relation` VALUES (1184839164348276737, 142, 5);
INSERT INTO `sys_relation` VALUES (1184839164360859649, 143, 5);
INSERT INTO `sys_relation` VALUES (1184839164365053953, 144, 5);
INSERT INTO `sys_relation` VALUES (1184839164373442561, 171, 5);
INSERT INTO `sys_relation` VALUES (1184839164377636866, 149, 5);
INSERT INTO `sys_relation` VALUES (1184839164390219778, 172, 5);
INSERT INTO `sys_relation` VALUES (1184839164394414081, 145, 5);
INSERT INTO `sys_relation` VALUES (1184839164398608386, 1111545968697860098, 5);
INSERT INTO `sys_relation` VALUES (1184839164402802690, 1111546189892870145, 5);
INSERT INTO `sys_relation` VALUES (1240637405216673794, 105, 1);
INSERT INTO `sys_relation` VALUES (1240637405229256706, 106, 1);
INSERT INTO `sys_relation` VALUES (1240637405229256707, 107, 1);
INSERT INTO `sys_relation` VALUES (1240637405241839618, 108, 1);
INSERT INTO `sys_relation` VALUES (1240637405241839619, 109, 1);
INSERT INTO `sys_relation` VALUES (1240637405246033921, 110, 1);
INSERT INTO `sys_relation` VALUES (1240637405254422529, 111, 1);
INSERT INTO `sys_relation` VALUES (1240637405262811138, 112, 1);
INSERT INTO `sys_relation` VALUES (1240637405262811139, 113, 1);
INSERT INTO `sys_relation` VALUES (1240637405271199746, 165, 1);
INSERT INTO `sys_relation` VALUES (1240637405279588354, 166, 1);
INSERT INTO `sys_relation` VALUES (1240637405283782657, 167, 1);
INSERT INTO `sys_relation` VALUES (1240637405292171266, 114, 1);
INSERT INTO `sys_relation` VALUES (1240637405300559873, 115, 1);
INSERT INTO `sys_relation` VALUES (1240637405308948482, 116, 1);
INSERT INTO `sys_relation` VALUES (1240637405308948483, 117, 1);
INSERT INTO `sys_relation` VALUES (1240637405321531394, 118, 1);
INSERT INTO `sys_relation` VALUES (1240637405325725698, 162, 1);
INSERT INTO `sys_relation` VALUES (1240637405329920002, 163, 1);
INSERT INTO `sys_relation` VALUES (1240637405338308610, 164, 1);
INSERT INTO `sys_relation` VALUES (1240637405342502913, 119, 1);
INSERT INTO `sys_relation` VALUES (1240637405350891522, 120, 1);
INSERT INTO `sys_relation` VALUES (1240637405350891523, 121, 1);
INSERT INTO `sys_relation` VALUES (1240637405359280130, 122, 1);
INSERT INTO `sys_relation` VALUES (1240637405367668737, 150, 1);
INSERT INTO `sys_relation` VALUES (1240637405371863042, 151, 1);
INSERT INTO `sys_relation` VALUES (1240637405380251649, 128, 1);
INSERT INTO `sys_relation` VALUES (1240637405380251650, 134, 1);
INSERT INTO `sys_relation` VALUES (1240637405392834561, 158, 1);
INSERT INTO `sys_relation` VALUES (1240637405392834562, 159, 1);
INSERT INTO `sys_relation` VALUES (1240637405405417473, 130, 1);
INSERT INTO `sys_relation` VALUES (1240637405409611778, 131, 1);
INSERT INTO `sys_relation` VALUES (1240637405413806082, 135, 1);
INSERT INTO `sys_relation` VALUES (1240637405418000386, 136, 1);
INSERT INTO `sys_relation` VALUES (1240637405422194690, 137, 1);
INSERT INTO `sys_relation` VALUES (1240637405422194691, 152, 1);
INSERT INTO `sys_relation` VALUES (1240637405430583298, 153, 1);
INSERT INTO `sys_relation` VALUES (1240637405434777602, 154, 1);
INSERT INTO `sys_relation` VALUES (1240637405443166210, 132, 1);
INSERT INTO `sys_relation` VALUES (1240637405447360513, 138, 1);
INSERT INTO `sys_relation` VALUES (1240637405451554818, 139, 1);
INSERT INTO `sys_relation` VALUES (1240637405459943426, 140, 1);
INSERT INTO `sys_relation` VALUES (1240637405468332034, 155, 1);
INSERT INTO `sys_relation` VALUES (1240637405472526337, 156, 1);
INSERT INTO `sys_relation` VALUES (1240637405480914945, 157, 1);
INSERT INTO `sys_relation` VALUES (1240637405485109249, 133, 1);
INSERT INTO `sys_relation` VALUES (1240637405493497858, 160, 1);
INSERT INTO `sys_relation` VALUES (1240637405493497859, 161, 1);
INSERT INTO `sys_relation` VALUES (1240637405501886466, 141, 1);
INSERT INTO `sys_relation` VALUES (1240637405510275074, 142, 1);
INSERT INTO `sys_relation` VALUES (1240637405514469377, 143, 1);
INSERT INTO `sys_relation` VALUES (1240637405522857985, 144, 1);
INSERT INTO `sys_relation` VALUES (1240637405522857986, 1144441072852684801, 1);
INSERT INTO `sys_relation` VALUES (1240637405531246593, 1144441072852684802, 1);
INSERT INTO `sys_relation` VALUES (1240637405539635201, 1144441072852684803, 1);
INSERT INTO `sys_relation` VALUES (1240637405543829505, 1144441072852684804, 1);
INSERT INTO `sys_relation` VALUES (1240637405543829506, 171, 1);
INSERT INTO `sys_relation` VALUES (1240637405556412418, 149, 1);
INSERT INTO `sys_relation` VALUES (1240637405556412419, 1142957882422112257, 1);
INSERT INTO `sys_relation` VALUES (1240637405564801026, 1142957882422112258, 1);
INSERT INTO `sys_relation` VALUES (1240637405568995330, 1142957882422112259, 1);
INSERT INTO `sys_relation` VALUES (1240637405577383938, 1142957882426306562, 1);
INSERT INTO `sys_relation` VALUES (1240637405581578241, 172, 1);
INSERT INTO `sys_relation` VALUES (1240637405589966849, 145, 1);
INSERT INTO `sys_relation` VALUES (1240637405589966850, 1111545968697860098, 1);
INSERT INTO `sys_relation` VALUES (1240637405602549762, 1111546189892870145, 1);
INSERT INTO `sys_relation` VALUES (1240637405606744066, 1149955324929765378, 1);
INSERT INTO `sys_relation` VALUES (1240637405610938370, 1110777136265838594, 1);
INSERT INTO `sys_relation` VALUES (1240637405619326977, 1110787391943098370, 1);
INSERT INTO `sys_relation` VALUES (1240637405619326978, 1110839216310329346, 1);
INSERT INTO `sys_relation` VALUES (1240637405627715586, 1139827152854716418, 1);
INSERT INTO `sys_relation` VALUES (1240637405636104194, 1212299504967204865, 1);
INSERT INTO `sys_relation` VALUES (1240637405640298497, 1110777366856089602, 1);
INSERT INTO `sys_relation` VALUES (1240637405644492801, 1110777491464667137, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL COMMENT '主键id',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示',
  `sort` int(11) NULL DEFAULT NULL COMMENT '序号',
  `version` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 0, '超级管理员', 'administrator', 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (5, 1, '第三方登录', 'oauth_role', 2, NULL, NULL, '2019-06-11 13:59:40', NULL, 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL COMMENT '主键id',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `account` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `sex` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别(字典)',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id(多个逗号隔开)',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id(多个逗号隔开)',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(字典)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `version` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '1124606971782160385', 'admin', '17db03c22596b7609c7c9704f16663e0', 'abcdef', 'stylefeng', '2018-11-16 00:00:00', 'M', 'sn93@qq.com', '18200000000', '1', 25, 'ENABLE', '2016-01-29 08:49:53', NULL, '2019-06-28 14:38:19', 24, 25);

-- ----------------------------
-- Table structure for sys_user_pos
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_pos`;
CREATE TABLE `sys_user_pos`  (
  `user_pos_id` bigint(20) NOT NULL COMMENT '主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `pos_id` bigint(20) NOT NULL COMMENT '职位id',
  PRIMARY KEY (`user_pos_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户职位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_pos
-- ----------------------------
INSERT INTO `sys_user_pos` VALUES (1144495219551617025, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
