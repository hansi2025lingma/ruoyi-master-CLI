# 灵码介绍功能实施说明

## 一、功能概述

在若依后台管理系统中新增了"灵码介绍"菜单模块，用于展示阿里云通义灵码的产品信息。

## 二、实施内容

### 1. 数据库变更
执行SQL脚本：`sql/lingma_menu.sql`

该脚本包含：
- 一级菜单：灵码介绍（menu_id=5）
- 二级菜单：灵码介绍页面（menu_id=117）
- 普通角色权限关联（role_id=2）

**执行方式：**
```bash
# 连接数据库后执行
mysql -u用户名 -p密码 数据库名 < sql/lingma_menu.sql
```

或者在数据库管理工具中手动执行SQL脚本内容。

### 2. 后端代码
新增Controller：
- 文件位置：`ruoyi-admin/src/main/java/com/ruoyi/web/controller/introduction/LingmaController.java`
- 访问路径：`/introduction/lingma`
- 权限标识：`introduction:lingma:view`

### 3. 前端页面
新增视图模板：
- 文件位置：`ruoyi-admin/src/main/resources/templates/introduction/lingma.html`
- 页面风格：参考main.html，采用响应式布局
- 包含内容：产品介绍、核心功能、应用场景、常见问题等

## 三、部署步骤

### 步骤1：执行数据库脚本
```sql
-- 连接到若依系统数据库后，执行以下SQL

-- 一级菜单：灵码介绍目录
insert into sys_menu values('5', '灵码介绍', '0', '5', '#', '', 'M', '0', '1', '', 'fa fa-lightbulb-o', 'admin', sysdate(), '', null, '灵码介绍目录');

-- 二级菜单：灵码介绍页面
insert into sys_menu values('117', '灵码介绍', '5', '1', '/introduction/lingma', '', 'C', '0', '1', 'introduction:lingma:view', 'fa fa-robot', 'admin', sysdate(), '', null, '灵码介绍菜单');

-- 普通角色菜单关联（让普通角色也能访问）
insert into sys_role_menu values ('2', '5');
insert into sys_role_menu values ('2', '117');
```

**注意：** 执行前请确认menu_id=5和menu_id=117未被占用。

### 步骤2：编译项目
```bash
# 在项目根目录执行
mvn clean package
```

### 步骤3：重启应用
```bash
# Windows系统
ry.bat

# Linux系统
sh ry.sh
```

## 四、验证功能

### 1. 超级管理员验证
1. 使用admin账号登录系统
2. 查看左侧菜单栏，应显示"灵码介绍"一级菜单（带灯泡图标）
3. 点击展开，显示"灵码介绍"二级菜单（带机器人图标）
4. 点击二级菜单，在页签中打开灵码介绍页面
5. 验证页面内容完整显示，无样式错误

### 2. 普通角色验证
1. 使用普通角色账号登录（如ry用户）
2. 验证是否能看到并访问"灵码介绍"菜单
3. 如果看不到，检查角色权限配置是否正确

## 五、功能说明

### 菜单结构
```
灵码介绍（一级目录）
  └── 灵码介绍（二级菜单，实际页面）
```

### 页面内容区块
1. **顶部展示区**
   - 左侧：问候语 + 二维码
   - 中间：产品介绍 + 版本信息 + 快捷链接
   - 右侧：核心功能列表

2. **中部卡片区**
   - 产品特色
   - 应用场景
   - 快速开始

3. **底部扩展区**
   - 常见问题（FAQ）

### 权限控制
- 权限标识：`introduction:lingma:view`
- 默认授权角色：超级管理员（role_id=1）、普通角色（role_id=2）
- 其他角色需手动在"菜单管理"中配置权限

## 六、常见问题

### Q1: 菜单不显示怎么办？
**A:** 
1. 检查数据库脚本是否执行成功
2. 清除浏览器缓存，重新登录
3. 检查用户角色是否有对应菜单权限
4. 查看`sys_menu`表中menu_id=5和117的记录是否存在

### Q2: 点击菜单出现404错误？
**A:** 
1. 检查Controller的路径映射是否正确：`/introduction/lingma`
2. 检查模板文件是否存在：`templates/introduction/lingma.html`
3. 重新编译项目并重启应用

### Q3: 页面样式错误或显示异常？
**A:** 
1. 检查静态资源（CSS、JS）是否加载成功
2. 清除浏览器缓存
3. 检查模板文件的Thymeleaf语法是否正确

### Q4: 如何修改页面内容？
**A:** 
直接编辑 `templates/introduction/lingma.html` 文件，修改对应的HTML内容即可。无需修改数据库或Controller。

### Q5: 如何调整菜单顺序？
**A:** 
修改`sys_menu`表中的`order_num`字段值，数字越小越靠前。

## 七、扩展建议

### 1. 添加子菜单
如需在"灵码介绍"目录下添加更多子菜单，可参考以下SQL：

```sql
insert into sys_menu values('118', '菜单名称', '5', '2', '/访问路径', '', 'C', '0', '1', '权限标识', '图标类名', 'admin', sysdate(), '', null, '菜单备注');
```

### 2. 自定义页面内容
可根据实际需求修改`lingma.html`中的内容，包括：
- 产品介绍文案
- 功能特性列表
- 应用场景描述
- 常见问题条目
- 外部链接地址

### 3. 添加动态数据
如需从后端获取动态数据（如版本号、统计信息），可在Controller中添加相应逻辑：

```java
@GetMapping("/introduction/lingma")
public String lingma(ModelMap mmap)
{
    mmap.put("version", RuoYiConfig.getVersion());
    // 添加更多动态数据
    mmap.put("visitCount", getVisitCount());
    return "introduction/lingma";
}
```

## 八、文件清单

| 文件类型 | 文件路径 | 说明 |
|---------|---------|------|
| SQL脚本 | sql/lingma_menu.sql | 菜单数据脚本 |
| Controller | ruoyi-admin/src/main/java/com/ruoyi/web/controller/introduction/LingmaController.java | 后端控制器 |
| HTML模板 | ruoyi-admin/src/main/resources/templates/introduction/lingma.html | 前端页面 |
| 说明文档 | LINGMA_README.md | 本文档 |

## 九、技术支持

如遇到问题，可通过以下方式获取帮助：
- 查看若依官方文档：http://doc.ruoyi.vip
- 若依社区：http://ruoyi.vip
- 通义灵码官网：https://tongyi.aliyun.com/lingma

---

**实施完成时间：** 2025-11-27  
**版本：** v1.0  
**适用系统：** 若依后台管理系统 v4.x
