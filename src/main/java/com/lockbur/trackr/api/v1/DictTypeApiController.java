package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.domain.DictDetails;
import com.lockbur.trackr.domain.DictType;
import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.model.ProjectModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.ResponseData;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.DictService;
import com.lockbur.trackr.service.DictTypeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 字典分类
 * Created by wangkun23 on 2017/7/31.
 */
@RestController
@RequestMapping(value = "/api/v1/dict/type")
public class DictTypeApiController {

    @Resource
    private DictTypeService dictTypeService;

    @Resource
    private DictService dictService;

    /**
     * 查询字典分类
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/tables", method = RequestMethod.POST)
    public DataTable<DictType> getDataTables(@RequestBody DataTableRequest request) {
        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());

        List<DictType> list = dictTypeService.findAll();
        Page<DictType> page = new Page<>(list, list.size(), pageable);


        DataTable<DictType> dataTable = new DataTable<>(page, request.getDraw());
        return dataTable;
    }

    /**
     * 查询字典分类下的具体子项目
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public ResponseData details(@PathVariable("id") Integer id) {
        DictDetails details = dictTypeService.findDetailsById(id);
        ResponseData result = ResponseData.success();
        result.addData("details", details);

        return result;
    }
}
