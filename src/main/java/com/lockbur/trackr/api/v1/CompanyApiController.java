package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.model.CompanyModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.CompanyService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 客户管理
 * Created by wangkun23 on 2017/7/24.
 */
@RestController
@RequestMapping(value = "/api/v1/company")
public class CompanyApiController {

    @Resource
    private CompanyService companyService;

    @RequestMapping(value = "/list/tables", method = RequestMethod.POST)
    public DataTable<CompanyModel> getDataTables(@RequestBody DataTableRequest request) {
        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());
        Page<CompanyModel> page = companyService.findByPage(pageable);
        DataTable<CompanyModel> dataTable = new DataTable<>(page, request.getDraw());
        return dataTable;
    }
}
