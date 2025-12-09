package com.ruoyi.web.controller.tool;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ruoyi.common.core.controller.BaseController;

/**
 * Qoder产品介绍
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/tool/qoder")
public class QoderController extends BaseController
{
    private String prefix = "tool/qoder";

    @RequiresPermissions("tool:qoder:view")
    @GetMapping()
    public String index()
    {
        return prefix + "/qoder";
    }
}
