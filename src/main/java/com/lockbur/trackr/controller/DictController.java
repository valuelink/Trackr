package com.lockbur.trackr.controller;

import com.lockbur.trackr.domain.DictType;
import com.lockbur.trackr.domain.DictDetails;
import com.lockbur.trackr.domain.Dict;
import com.lockbur.trackr.rest.ResponseData;
import com.lockbur.trackr.service.DictTypeService;
import com.lockbur.trackr.service.DictService;
import com.lockbur.trackr.service.EmployeeService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 系统字典管理
 * Created by wangkun23 on 2017/4/25.
 */
@Controller
@RequestMapping("/dict")
public class DictController {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    EmployeeService employeeService;

    @Resource
    private DictTypeService codeService;

    @Resource
    private DictService codeValueService;


    /*字典分类管理*/
    @RequestMapping("/type/list")
    public String list(Model model) {
        return "/dict/type/list";
    }

    @RequestMapping("/type/add")
    public String add() {
        return "/dict/type/add";
    }



    @RequestMapping("/type/details/{id}")
    public String details(@ModelAttribute @PathVariable("id") Integer id) {

        return "/dict/details";
    }
    /*字典分类管理*/

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        Dict dictValue = codeValueService.findById(id);
        int typeId = dictValue.getTypeId();
        codeValueService.deleteById(id);
        return "redirect:/dict/details/" + typeId;
    }


}
