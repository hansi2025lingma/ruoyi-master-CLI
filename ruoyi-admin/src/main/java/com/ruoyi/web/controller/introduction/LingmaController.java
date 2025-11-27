package com.ruoyi.web.controller.introduction;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.controller.BaseController;

/**
 * 灵码介绍页面控制器
 * 
 * @author ruoyi
 */
@Controller
public class LingmaController extends BaseController
{
    /**
     * 灵码介绍页面
     */
    @RequiresPermissions("introduction:lingma:view")
    @GetMapping("/introduction/lingma")
    public String lingma(ModelMap mmap)
    {
        mmap.put("version", RuoYiConfig.getVersion());
        return "introduction/lingma";
    }
}
