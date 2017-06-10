package com.lockbur.trackr.controller;

import com.lockbur.trackr.domain.Code;
import com.lockbur.trackr.domain.CodeDetails;
import com.lockbur.trackr.domain.CodeValue;
import com.lockbur.trackr.rest.ResponseData;
import com.lockbur.trackr.service.CodeService;
import com.lockbur.trackr.service.CodeValueService;
import com.lockbur.trackr.service.EmployeeService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 系统字典管理
 * Created by wangkun23 on 2017/4/25.
 */
@Controller
@RequestMapping("/code")
public class CodeController {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    EmployeeService employeeService;

    @Resource
    private CodeService codeService;

    @Resource
    private CodeValueService codeValueService;

    @RequestMapping("/list")
    public String list(Model model) {
        List<Code> list = codeService.findAll();
        model.addAttribute("list", list);
        return "code/list";
    }

    @RequestMapping("/details/{id}")
    public String details(@PathVariable("id") Integer id, Model model) {
        CodeDetails details = codeService.findDetailsById(id);
        model.addAttribute("details", details);
        model.addAttribute("codeId", id);
        return "code/details";
    }

    @RequestMapping("/add")
    public String add() {
        return "code/add";
    }

    @RequestMapping("/addValue/{codeId}")
    public String addValue(@PathVariable("codeId") Integer codeId, Model model) {
        model.addAttribute("codeId", codeId);
        return "code/addValue";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addDictionary(String name, Model model) {
        Integer creator = employeeService.getCurrentUserId();
        if (StringUtils.isNotEmpty(name)) {
            Code code = new Code(name);
            code.setCreatorId(creator);
            codeService.save(code);
        }
        return "redirect:/code/list";
    }

    @RequestMapping(value = "/addValue", method = RequestMethod.POST)
    public String addValue(CodeValue codeValue, Model model) {
        Integer creator = employeeService.getCurrentUserId();
        if (StringUtils.isNotEmpty(codeValue.getName())) {
            codeValue.setCreatorId(creator);
            codeValueService.save(codeValue);
        }
        return "redirect:/code/details/" + codeValue.getCodeId();
    }

    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model) {
        CodeValue codeValue = codeValueService.findById(id);
        model.addAttribute("codeValue", codeValue);
        return "code/edit";
    }

    @RequestMapping(value = "/editValue", method = RequestMethod.POST)
    public String update(CodeValue codeValue) {
        codeValueService.update(codeValue);
        return "redirect:/code/details/" + codeValue.getCodeId();
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        CodeValue codeValue = codeValueService.findById(id);
        int codeId = codeValue.getCodeId();
        codeValueService.deleteById(id);
        return "redirect:/code/details/" + codeId;
    }

    @ResponseBody
    @RequestMapping("/toggleActive/{id}")
    public ResponseData toggleActive(@PathVariable("id") Integer id) {
        codeValueService.markActive(id);
        ResponseData result = ResponseData.success();
        return result;
    }
}
