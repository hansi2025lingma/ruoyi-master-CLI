-- ----------------------------
-- 灵码介绍菜单数据
-- ----------------------------

-- 一级菜单：灵码介绍
insert into sys_menu values('5', '灵码介绍', '0', '5', '#', '', 'M', '0', '1', '', 'fa fa-lightbulb-o', 'admin', sysdate(), '', null, '灵码介绍目录');

-- 二级菜单：灵码介绍
insert into sys_menu values('117', '灵码介绍', '5', '1', '/system/lingma', '', 'C', '0', '1', 'system:lingma:view', 'fa fa-code', 'admin', sysdate(), '', null, '灵码介绍菜单');

-- ----------------------------
-- 为超级管理员角色分配灵码介绍菜单权限
-- ----------------------------
insert into sys_role_menu values ('1', '5');
insert into sys_role_menu values ('1', '117');
