package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.domain.Dict;
import com.lockbur.trackr.domain.DictDetails;
import com.lockbur.trackr.domain.DictType;
import com.lockbur.trackr.rest.ResponseData;
import com.lockbur.trackr.service.DictService;
import com.lockbur.trackr.service.DictTypeService;
import com.lockbur.trackr.service.EmployeeService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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

}
