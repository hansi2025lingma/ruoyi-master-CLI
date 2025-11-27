-- ----------------------------
-- 新增"灵码介绍"菜单SQL脚本
-- ----------------------------

-- 一级菜单：灵码介绍目录
insert into sys_menu values('5', '灵码介绍', '0', '5', '#', '', 'M', '0', '1', '', 'fa fa-lightbulb-o', 'admin', sysdate(), '', null, '灵码介绍目录');

-- 二级菜单：灵码介绍页面
insert into sys_menu values('117', '灵码介绍', '5', '1', '/introduction/lingma', '', 'C', '0', '1', 'introduction:lingma:view', 'fa fa-robot', 'admin', sysdate(), '', null, '灵码介绍菜单');

-- 普通角色菜单关联（让普通角色也能访问）
insert into sys_role_menu values ('2', '5');
insert into sys_role_menu values ('2', '117');
