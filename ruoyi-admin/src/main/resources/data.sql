-- H2数据库初始数据

-- ----------------------------
-- 初始化-部门表数据
-- ----------------------------
INSERT INTO sys_dept VALUES(100,  0,   '0',          '若依科技',   0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL);
INSERT INTO sys_dept VALUES(101,  100, '0,100',      '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL);
INSERT INTO sys_dept VALUES(102,  100, '0,100',      '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL);
INSERT INTO sys_dept VALUES(103,  101, '0,100,101',  '研发部门',   1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL);
INSERT INTO sys_dept VALUES(104,  101, '0,100,101',  '市场部门',   2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL);
INSERT INTO sys_dept VALUES(105,  101, '0,100,101',  '测试部门',   3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL);

-- ----------------------------
-- 初始化-用户信息表数据
-- ----------------------------
INSERT INTO sys_user VALUES(1,  103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', NULL, NULL, 'admin', NOW(), '', NULL, '管理员');
INSERT INTO sys_user VALUES(2,  105, 'ry',    '若依', '00', 'ry@qq.com',  '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', NULL, NULL, 'admin', NOW(), '', NULL, '测试员');

-- ----------------------------
-- 初始化-角色信息表数据
-- ----------------------------
INSERT INTO sys_role VALUES('1', '超级管理员', 'admin',  1, '1', '0', '0', 'admin', NOW(), '', NULL, '超级管理员');
INSERT INTO sys_role VALUES('2', '普通角色',   'common', 2, '2', '0', '0', 'admin', NOW(), '', NULL, '普通角色');

-- ----------------------------
-- 初始化-用户和角色关联表数据
-- ----------------------------
INSERT INTO sys_user_role VALUES ('1', '1');
INSERT INTO sys_user_role VALUES ('2', '2');

-- ----------------------------
-- 初始化-菜单信息表数据
-- ----------------------------
-- 一级菜单
INSERT INTO sys_menu VALUES('1', '系统管理', '0', '1', '#',                '',          'M', '0', '1', '', 'fa fa-gear',           'admin', NOW(), '', NULL, '系统管理目录');
INSERT INTO sys_menu VALUES('2', '系统监控', '0', '2', '#',                '',          'M', '0', '1', '', 'fa fa-video-camera',   'admin', NOW(), '', NULL, '系统监控目录');
INSERT INTO sys_menu VALUES('3', '系统工具', '0', '3', '#',                '',          'M', '0', '1', '', 'fa fa-bars',           'admin', NOW(), '', NULL, '系统工具目录');
-- 二级菜单
INSERT INTO sys_menu VALUES('100',  '用户管理', '1', '1', '/system/user',          '', 'C', '0', '1', 'system:user:view',         'fa fa-user-o',          'admin', NOW(), '', NULL, '用户管理菜单');
INSERT INTO sys_menu VALUES('101',  '角色管理', '1', '2', '/system/role',          '', 'C', '0', '1', 'system:role:view',         'fa fa-user-secret',     'admin', NOW(), '', NULL, '角色管理菜单');
INSERT INTO sys_menu VALUES('102',  '菜单管理', '1', '3', '/system/menu',          '', 'C', '0', '1', 'system:menu:view',         'fa fa-th-list',         'admin', NOW(), '', NULL, '菜单管理菜单');
INSERT INTO sys_menu VALUES('103',  '部门管理', '1', '4', '/system/dept',          '', 'C', '0', '1', 'system:dept:view',         'fa fa-outdent',         'admin', NOW(), '', NULL, '部门管理菜单');

-- ----------------------------
-- 初始化-角色和菜单关联表数据
-- ----------------------------
INSERT INTO sys_role_menu VALUES ('1', '1');
INSERT INTO sys_role_menu VALUES ('1', '2');
INSERT INTO sys_role_menu VALUES ('1', '3');
INSERT INTO sys_role_menu VALUES ('1', '100');
INSERT INTO sys_role_menu VALUES ('1', '101');
INSERT INTO sys_role_menu VALUES ('1', '102');
INSERT INTO sys_role_menu VALUES ('1', '103');

-- ----------------------------
-- 初始化-字典类型表数据
-- ----------------------------
INSERT INTO sys_dict_type VALUES(1,  '用户性别', 'sys_user_sex',        '0', 'admin', NOW(), '', NULL, '用户性别列表');
INSERT INTO sys_dict_type VALUES(2,  '菜单状态', 'sys_show_hide',       '0', 'admin', NOW(), '', NULL, '菜单状态列表');
INSERT INTO sys_dict_type VALUES(3,  '系统开关', 'sys_normal_disable',  '0', 'admin', NOW(), '', NULL, '系统开关列表');

-- ----------------------------
-- 初始化-字典数据表数据
-- ----------------------------
INSERT INTO sys_dict_data VALUES(1,  1,  '男',       '0',       'sys_user_sex',        '',   '',        'Y', '0', 'admin', NOW(), '', NULL, '性别男');
INSERT INTO sys_dict_data VALUES(2,  2,  '女',       '1',       'sys_user_sex',        '',   '',        'N', '0', 'admin', NOW(), '', NULL, '性别女');
INSERT INTO sys_dict_data VALUES(3,  3,  '未知',     '2',       'sys_user_sex',        '',   '',        'N', '0', 'admin', NOW(), '', NULL, '性别未知');
INSERT INTO sys_dict_data VALUES(4,  1,  '显示',     '0',       'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', NOW(), '', NULL, '显示菜单');
INSERT INTO sys_dict_data VALUES(5,  2,  '隐藏',     '1',       'sys_show_hide',       '',   'danger',  'N', '0', 'admin', NOW(), '', NULL, '隐藏菜单');
INSERT INTO sys_dict_data VALUES(6,  1,  '正常',     '0',       'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', NOW(), '', NULL, '正常状态');
INSERT INTO sys_dict_data VALUES(7,  2,  '停用',     '1',       'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', NOW(), '', NULL, '停用状态');

-- ----------------------------
-- 初始化-参数配置表数据
-- ----------------------------
INSERT INTO sys_config VALUES(1, '主框架页-默认皮肤样式名称',     'sys.index.skinName',            'skin-blue',     'Y', 'admin', NOW(), '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO sys_config VALUES(2, '用户管理-账号初始密码',         'sys.user.initPassword',         '123456',        'Y', 'admin', NOW(), '', NULL, '初始化密码 123456');
INSERT INTO sys_config VALUES(3, '主框架页-侧边栏主题',           'sys.index.sideTheme',           'theme-dark',    'Y', 'admin', NOW(), '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO sys_config VALUES(4, '账号自助-验证码开关',           'sys.account.captchaEnabled',    'true',          'Y', 'admin', NOW(), '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO sys_config VALUES(5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser',      'false',         'Y', 'admin', NOW(), '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- 初始化-通知公告表数据
-- ----------------------------
INSERT INTO sys_notice VALUES('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容############', '0', 'admin', NOW(), '', NULL, '管理员');
INSERT INTO sys_notice VALUES('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', NOW(), '', NULL, '管理员');

-- ----------------------------
-- 初始化-定时任务调度表数据
-- ----------------------------
INSERT INTO sys_job VALUES(1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams',        '0/10 * * * * ?', '3', '1', '1', 'admin', NOW(), '', NULL, '');
INSERT INTO sys_job VALUES(2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(''ry'')',  '0/15 * * * * ?', '3', '1', '1', 'admin', NOW(), '', NULL, '');
INSERT INTO sys_job VALUES(3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(''ry'', true, 2000L, 316.50D, 100)',  '0/20 * * * * ?', '3', '1', '1', 'admin', NOW(), '', NULL, '');

-- ----------------------------
-- 初始化-岗位信息表数据
-- ----------------------------
INSERT INTO sys_post VALUES(1, 'ceo',  '董事长',    1, '0', 'admin', NOW(), '', NULL, '');
INSERT INTO sys_post VALUES(2, 'se',   '项目经理',  2, '0', 'admin', NOW(), '', NULL, '');
INSERT INTO sys_post VALUES(3, 'hr',   '人力资源',  3, '0', 'admin', NOW(), '', NULL, '');
INSERT INTO sys_post VALUES(4, 'user', '普通员工',  4, '0', 'admin', NOW(), '', NULL, '');