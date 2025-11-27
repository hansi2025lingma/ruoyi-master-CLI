-- H2数据库初始化脚本

-- ----------------------------
-- 1、部门表
-- ----------------------------
DROP TABLE IF EXISTS sys_dept;
CREATE TABLE sys_dept (
  dept_id           BIGINT          NOT NULL AUTO_INCREMENT    COMMENT '部门id',
  parent_id         BIGINT          DEFAULT 0                  COMMENT '父部门id',
  ancestors         VARCHAR(50)     DEFAULT ''                 COMMENT '祖级列表',
  dept_name         VARCHAR(30)     DEFAULT ''                 COMMENT '部门名称',
  order_num         INT             DEFAULT 0                  COMMENT '显示顺序',
  leader            VARCHAR(20)     DEFAULT NULL               COMMENT '负责人',
  phone             VARCHAR(11)     DEFAULT NULL               COMMENT '联系电话',
  email             VARCHAR(50)     DEFAULT NULL               COMMENT '邮箱',
  status            CHAR(1)         DEFAULT '0'                COMMENT '部门状态（0正常 1停用）',
  del_flag          CHAR(1)         DEFAULT '0'                COMMENT '删除标志（0代表存在 2代表删除）',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT '创建者',
  create_time       DATETIME                                   COMMENT '创建时间',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT '更新者',
  update_time       DATETIME                                   COMMENT '更新时间',
  PRIMARY KEY (dept_id)
);

-- ----------------------------
-- 2、用户信息表
-- ----------------------------
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
  user_id           BIGINT          NOT NULL AUTO_INCREMENT    COMMENT '用户ID',
  dept_id           BIGINT          DEFAULT NULL               COMMENT '部门ID',
  login_name        VARCHAR(30)     NOT NULL                   COMMENT '登录账号',
  user_name         VARCHAR(30)     DEFAULT ''                 COMMENT '用户昵称',
  user_type         VARCHAR(2)      DEFAULT '00'               COMMENT '用户类型（00系统用户 01注册用户）',
  email             VARCHAR(50)     DEFAULT ''                 COMMENT '用户邮箱',
  phonenumber       VARCHAR(11)     DEFAULT ''                 COMMENT '手机号码',
  sex               CHAR(1)         DEFAULT '0'                COMMENT '用户性别（0男 1女 2未知）',
  avatar            VARCHAR(100)    DEFAULT ''                 COMMENT '头像路径',
  password          VARCHAR(50)     DEFAULT ''                 COMMENT '密码',
  salt              VARCHAR(20)     DEFAULT ''                 COMMENT '盐加密',
  status            CHAR(1)         DEFAULT '0'                COMMENT '账号状态（0正常 1停用）',
  del_flag          CHAR(1)         DEFAULT '0'                COMMENT '删除标志（0代表存在 2代表删除）',
  login_ip          VARCHAR(128)    DEFAULT ''                 COMMENT '最后登录IP',
  login_date        DATETIME                                   COMMENT '最后登录时间',
  pwd_update_date   DATETIME                                   COMMENT '密码最后更新时间',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT '创建者',
  create_time       DATETIME                                   COMMENT '创建时间',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT '更新者',
  update_time       DATETIME                                   COMMENT '更新时间',
  remark            VARCHAR(500)    DEFAULT NULL               COMMENT '备注',
  PRIMARY KEY (user_id)
);

-- ----------------------------
-- 3、角色信息表
-- ----------------------------
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role (
  role_id           BIGINT          NOT NULL AUTO_INCREMENT    COMMENT '角色ID',
  role_name         VARCHAR(30)     NOT NULL                   COMMENT '角色名称',
  role_key          VARCHAR(100)    NOT NULL                   COMMENT '角色权限字符串',
  role_sort         INT             NOT NULL                   COMMENT '显示顺序',
  data_scope        CHAR(1)         DEFAULT '1'                COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  status            CHAR(1)         NOT NULL                   COMMENT '角色状态（0正常 1停用）',
  del_flag          CHAR(1)         DEFAULT '0'                COMMENT '删除标志（0代表存在 2代表删除）',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT '创建者',
  create_time       DATETIME                                   COMMENT '创建时间',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT '更新者',
  update_time       DATETIME                                   COMMENT '更新时间',
  remark            VARCHAR(500)    DEFAULT NULL               COMMENT '备注',
  PRIMARY KEY (role_id)
);

-- ----------------------------
-- 4、菜单权限表
-- ----------------------------
DROP TABLE IF EXISTS sys_menu;
CREATE TABLE sys_menu (
  menu_id           BIGINT          NOT NULL AUTO_INCREMENT    COMMENT '菜单ID',
  menu_name         VARCHAR(50)     NOT NULL                   COMMENT '菜单名称',
  parent_id         BIGINT          DEFAULT 0                  COMMENT '父菜单ID',
  order_num         INT             DEFAULT 0                  COMMENT '显示顺序',
  url               VARCHAR(200)    DEFAULT '#'                COMMENT '请求地址',
  target            VARCHAR(20)     DEFAULT ''                 COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  menu_type         CHAR(1)         DEFAULT ''                 COMMENT '菜单类型（M目录 C菜单 F按钮）',
  visible           CHAR(1)         DEFAULT '0'                COMMENT '菜单状态（0显示 1隐藏）',
  is_refresh        CHAR(1)         DEFAULT '1'                COMMENT '是否刷新（0刷新 1不刷新）',
  perms             VARCHAR(100)    DEFAULT NULL               COMMENT '权限标识',
  icon              VARCHAR(100)    DEFAULT '#'                COMMENT '菜单图标',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT '创建者',
  create_time       DATETIME                                   COMMENT '创建时间',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT '更新者',
  update_time       DATETIME                                   COMMENT '更新时间',
  remark            VARCHAR(500)    DEFAULT ''                 COMMENT '备注',
  PRIMARY KEY (menu_id)
);

-- ----------------------------
-- 5、用户和角色关联表
-- ----------------------------
DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role (
  user_id           BIGINT          NOT NULL COMMENT '用户ID',
  role_id           BIGINT          NOT NULL COMMENT '角色ID',
  PRIMARY KEY(user_id, role_id)
);

-- ----------------------------
-- 6、角色和菜单关联表
-- ----------------------------
DROP TABLE IF EXISTS sys_role_menu;
CREATE TABLE sys_role_menu (
  role_id           BIGINT          NOT NULL COMMENT '角色ID',
  menu_id           BIGINT          NOT NULL COMMENT '菜单ID',
  PRIMARY KEY(role_id, menu_id)
);

-- ----------------------------
-- 7、字典类型表
-- ----------------------------
DROP TABLE IF EXISTS sys_dict_type;
CREATE TABLE sys_dict_type (
  dict_id           BIGINT          NOT NULL AUTO_INCREMENT    COMMENT '字典主键',
  dict_name         VARCHAR(100)    DEFAULT ''                 COMMENT '字典名称',
  dict_type         VARCHAR(100)    DEFAULT ''                 COMMENT '字典类型',
  status            CHAR(1)         DEFAULT '0'                COMMENT '状态（0正常 1停用）',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT '创建者',
  create_time       DATETIME                                   COMMENT '创建时间',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT '更新者',
  update_time       DATETIME                                   COMMENT '更新时间',
  remark            VARCHAR(500)    DEFAULT NULL               COMMENT '备注',
  PRIMARY KEY (dict_id)
);

-- ----------------------------
-- 8、字典数据表
-- ----------------------------
DROP TABLE IF EXISTS sys_dict_data;
CREATE TABLE sys_dict_data (
  dict_code         BIGINT          NOT NULL AUTO_INCREMENT    COMMENT '字典编码',
  dict_sort         INT             DEFAULT 0                  COMMENT '字典排序',
  dict_label        VARCHAR(100)    DEFAULT ''                 COMMENT '字典标签',
  dict_value        VARCHAR(100)    DEFAULT ''                 COMMENT '字典键值',
  dict_type         VARCHAR(100)    DEFAULT ''                 COMMENT '字典类型',
  css_class         VARCHAR(100)    DEFAULT NULL               COMMENT '样式属性（其他样式扩展）',
  list_class        VARCHAR(100)    DEFAULT NULL               COMMENT '表格回显样式',
  is_default        CHAR(1)         DEFAULT 'N'                COMMENT '是否默认（Y是 N否）',
  status            CHAR(1)         DEFAULT '0'                COMMENT '状态（0正常 1停用）',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT '创建者',
  create_time       DATETIME                                   COMMENT '创建时间',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT '更新者',
  update_time       DATETIME                                   COMMENT '更新时间',
  remark            VARCHAR(500)    DEFAULT NULL               COMMENT '备注',
  PRIMARY KEY (dict_code)
);

-- ----------------------------
-- 9、参数配置表
-- ----------------------------
DROP TABLE IF EXISTS sys_config;
CREATE TABLE sys_config (
  config_id         BIGINT          NOT NULL AUTO_INCREMENT    COMMENT '参数主键',
  config_name       VARCHAR(100)    DEFAULT ''                 COMMENT '参数名称',
  config_key        VARCHAR(100)    DEFAULT ''                 COMMENT '参数键名',
  config_value      VARCHAR(500)    DEFAULT ''                 COMMENT '参数键值',
  config_type       CHAR(1)         DEFAULT 'N'                COMMENT '系统内置（Y是 N否）',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT '创建者',
  create_time       DATETIME                                   COMMENT '创建时间',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT '更新者',
  update_time       DATETIME                                   COMMENT '更新时间',
  remark            VARCHAR(500)    DEFAULT NULL               COMMENT '备注',
  PRIMARY KEY (config_id)
);

-- ----------------------------
-- 10、通知公告表
-- ----------------------------
DROP TABLE IF EXISTS sys_notice;
CREATE TABLE sys_notice (
  notice_id         BIGINT          NOT NULL AUTO_INCREMENT    COMMENT '公告ID',
  notice_title      VARCHAR(50)     NOT NULL                   COMMENT '公告标题',
  notice_type       CHAR(1)         NOT NULL                   COMMENT '公告类型（1通知 2公告）',
  notice_content    LONGTEXT        DEFAULT NULL               COMMENT '公告内容',
  status            CHAR(1)         DEFAULT '0'                COMMENT '公告状态（0正常 1关闭）',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT '创建者',
  create_time       DATETIME                                   COMMENT '创建时间',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT '更新者',
  update_time       DATETIME                                   COMMENT '更新时间',
  remark            VARCHAR(255)    DEFAULT NULL               COMMENT '备注',
  PRIMARY KEY (notice_id)
);

-- ----------------------------
-- 11、操作日志记录
-- ----------------------------
DROP TABLE IF EXISTS sys_oper_log;
CREATE TABLE sys_oper_log (
  oper_id           BIGINT          NOT NULL AUTO_INCREMENT    COMMENT '日志主键',
  title             VARCHAR(50)     DEFAULT ''                 COMMENT '模块标题',
  business_type     INT             DEFAULT 0                  COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  method            VARCHAR(100)    DEFAULT ''                 COMMENT '方法名称',
  request_method    VARCHAR(10)     DEFAULT ''                 COMMENT '请求方式',
  operator_type     INT             DEFAULT 0                  COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  oper_name         VARCHAR(50)     DEFAULT ''                 COMMENT '操作人员',
  dept_name         VARCHAR(50)     DEFAULT ''                 COMMENT '部门名称',
  oper_url          VARCHAR(255)    DEFAULT ''                 COMMENT '请求URL',
  oper_ip           VARCHAR(128)    DEFAULT ''                 COMMENT '主机地址',
  oper_location     VARCHAR(255)    DEFAULT ''                 COMMENT '操作地点',
  oper_param        VARCHAR(2000)   DEFAULT ''                 COMMENT '请求参数',
  json_result       VARCHAR(2000)   DEFAULT ''                 COMMENT '返回参数',
  status            INT             DEFAULT 0                  COMMENT '操作状态（0正常 1异常）',
  error_msg         VARCHAR(2000)   DEFAULT ''                 COMMENT '错误消息',
  oper_time         DATETIME                                   COMMENT '操作时间',
  PRIMARY KEY (oper_id)
);

-- ----------------------------
-- 12、系统访问记录
-- ----------------------------
DROP TABLE IF EXISTS sys_logininfor;
CREATE TABLE sys_logininfor (
  info_id           BIGINT          NOT NULL AUTO_INCREMENT    COMMENT '访问ID',
  login_name        VARCHAR(50)     DEFAULT ''                 COMMENT '登录账号',
  ipaddr            VARCHAR(128)    DEFAULT ''                 COMMENT '登录IP地址',
  login_location    VARCHAR(255)    DEFAULT ''                 COMMENT '登录地点',
  browser           VARCHAR(50)     DEFAULT ''                 COMMENT '浏览器类型',
  os                VARCHAR(50)     DEFAULT ''                 COMMENT '操作系统',
  status            CHAR(1)         DEFAULT '0'                COMMENT '登录状态（0成功 1失败）',
  msg               VARCHAR(255)    DEFAULT ''                 COMMENT '提示消息',
  login_time        DATETIME                                   COMMENT '访问时间',
  PRIMARY KEY (info_id)
);

-- ----------------------------
-- 13、在线用户记录
-- ----------------------------
DROP TABLE IF EXISTS sys_user_online;
CREATE TABLE sys_user_online (
  sessionId         VARCHAR(50)     DEFAULT ''                 COMMENT '用户会话id',
  login_name        VARCHAR(50)     DEFAULT ''                 COMMENT '登录账号',
  dept_name         VARCHAR(50)     DEFAULT ''                 COMMENT '部门名称',
  ipaddr            VARCHAR(128)    DEFAULT ''                 COMMENT '登录IP地址',
  login_location    VARCHAR(255)    DEFAULT ''                 COMMENT '登录地点',
  browser           VARCHAR(50)     DEFAULT ''                 COMMENT '浏览器类型',
  os                VARCHAR(50)     DEFAULT ''                 COMMENT '操作系统',
  status            VARCHAR(10)     DEFAULT ''                 COMMENT '在线状态on_line在线off_line离线',
  start_timestamp   DATETIME                                   COMMENT 'session创建时间',
  last_access_time  DATETIME                                   COMMENT 'session最后访问时间',
  expire_time       INT             DEFAULT 0                  COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (sessionId)
);

-- ----------------------------
-- 14、定时任务调度表
-- ----------------------------
DROP TABLE IF EXISTS sys_job;
CREATE TABLE sys_job (
  job_id            BIGINT          NOT NULL AUTO_INCREMENT    COMMENT '任务ID',
  job_name          VARCHAR(64)     DEFAULT ''                 COMMENT '任务名称',
  job_group         VARCHAR(64)     DEFAULT 'DEFAULT'          COMMENT '任务组名',
  invoke_target     VARCHAR(500)    NOT NULL                   COMMENT '调用目标字符串',
  cron_expression   VARCHAR(255)    DEFAULT ''                 COMMENT 'cron执行表达式',
  misfire_policy    VARCHAR(20)     DEFAULT '3'                COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  concurrent        CHAR(1)         DEFAULT '1'                COMMENT '是否并发执行（0允许 1禁止）',
  status            CHAR(1)         DEFAULT '0'                COMMENT '状态（0正常 1暂停）',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT '创建者',
  create_time       DATETIME                                   COMMENT '创建时间',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT '更新者',
  update_time       DATETIME                                   COMMENT '更新时间',
  remark            VARCHAR(500)    DEFAULT ''                 COMMENT '备注信息',
  PRIMARY KEY (job_id, job_name, job_group)
);

-- ----------------------------
-- 15、定时任务调度日志表
-- ----------------------------
DROP TABLE IF EXISTS sys_job_log;
CREATE TABLE sys_job_log (
  job_log_id        BIGINT          NOT NULL AUTO_INCREMENT    COMMENT '任务日志ID',
  job_name          VARCHAR(64)     NOT NULL                   COMMENT '任务名称',
  job_group         VARCHAR(64)     NOT NULL                   COMMENT '任务组名',
  invoke_target     VARCHAR(500)    NOT NULL                   COMMENT '调用目标字符串',
  job_message       VARCHAR(500)                               COMMENT '日志信息',
  status            CHAR(1)         DEFAULT '0'                COMMENT '执行状态（0正常 1失败）',
  exception_info    VARCHAR(2000)   DEFAULT ''                 COMMENT '异常信息',
  create_time       DATETIME                                   COMMENT '创建时间',
  PRIMARY KEY (job_log_id)
);

-- ----------------------------
-- 16、岗位信息表
-- ----------------------------
DROP TABLE IF EXISTS sys_post;
CREATE TABLE sys_post (
  post_id           BIGINT          NOT NULL AUTO_INCREMENT    COMMENT '岗位ID',
  post_code         VARCHAR(64)     NOT NULL                   COMMENT '岗位编码',
  post_name         VARCHAR(50)     NOT NULL                   COMMENT '岗位名称',
  post_sort         INT             NOT NULL                   COMMENT '显示顺序',
  status            CHAR(1)         NOT NULL                   COMMENT '状态（0正常 1停用）',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT '创建者',
  create_time       DATETIME                                   COMMENT '创建时间',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT '更新者',
  update_time       DATETIME                                   COMMENT '更新时间',
  remark            VARCHAR(500)    DEFAULT NULL               COMMENT '备注',
  PRIMARY KEY (post_id)
);

-- ----------------------------
-- 17、用户与岗位关联表
-- ----------------------------
DROP TABLE IF EXISTS sys_user_post;
CREATE TABLE sys_user_post (
  user_id           BIGINT          NOT NULL COMMENT '用户ID',
  post_id           BIGINT          NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (user_id, post_id)
);

-- ----------------------------
-- 18、角色和部门关联表
-- ----------------------------
DROP TABLE IF EXISTS sys_role_dept;
CREATE TABLE sys_role_dept (
  role_id           BIGINT          NOT NULL COMMENT '角色ID',
  dept_id           BIGINT          NOT NULL COMMENT '部门ID',
  PRIMARY KEY(role_id, dept_id)
);