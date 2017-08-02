package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.domain.Dict;
import com.lockbur.trackr.domain.DictDetails;
import com.lockbur.trackr.rest.ResponseData;
import com.lockbur.trackr.service.DictService;
import com.lockbur.trackr.service.DictTypeService;
import com.lockbur.trackr.service.EmployeeService;
import org.apache.commons.lang.StringUtils;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 字典管理
 * Created by wangkun23 on 2017/8/2.
 */
@RestController
@RequestMapping(value = "/api/v1/dict")
public class DictApiController {

    @Resource
    EmployeeService employeeService;

    @Resource
    private DictTypeService dictTypeService;

    @Resource
    private DictService dictService;


    /**
     * 根据字典分类code 查询字典列表
     *
     * @param codes
     * @return
     */
    @RequestMapping(value = "/select", method = RequestMethod.GET)
    public ResponseData select(List<String> codes) {
        ResponseData result = ResponseData.success("0");
        List<DictDetails> dicts = dictService.findByTypeCodes(codes);
        result.addData("dicts", dicts);
        return result;
    }

    /**
     * 保存或者修改字典数据
     *
     * @return
     */
    @RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
    public ResponseData saveOrUpdate(Dict dict) {
        Integer creator = employeeService.getCurrentUserId();
        if (StringUtils.isNotEmpty(dict.getName())) {
            if (dict.getId() != null) {
                dictService.update(dict);
            } else {
                dict.setCreatorId(creator);
                dict.setActive(true);
                dictService.save(dict);
            }
        }
        return ResponseData.success("0");
    }


    /**
     * 启用和禁用 该字典数据
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/toggleActive/{id}", method = RequestMethod.GET)
    public ResponseData toggleActive(@PathVariable("id") Integer id) {
        dictService.markActive(id);
        return ResponseData.success();
    }

}
