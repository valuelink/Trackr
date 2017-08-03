package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.model.CompanyModel;
import com.lockbur.trackr.model.ContractModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.ResponseData;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.CompanyService;
import com.lockbur.trackr.service.ContractService;
import com.lockbur.trackr.service.EmployeeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 客户管理
 * Created by wangkun23 on 2017/7/24.
 */
@RestController
@RequestMapping(value = "/api/v1/company")
public class CompanyApiController {

    @Resource
    EmployeeService employeeService;

    @Resource
    private CompanyService companyService;

    @Resource
    private ContractService contractService;

    @RequestMapping(value = "/list/tables", method = RequestMethod.POST)
    public DataTable<CompanyModel> getDataTables(@RequestBody DataTableRequest request) {
        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());
        Page<CompanyModel> page = companyService.findByPage(pageable);
        DataTable<CompanyModel> dataTable = new DataTable<>(page, request.getDraw());
        return dataTable;
    }


    /**
     * 查看详情信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public ResponseData details(@PathVariable("id") Integer id) {
        Integer userId = employeeService.getCurrentUserId();

        CompanyModel company = companyService.findById(id);
        List<ContractModel> contracts = contractService.findByCompanyId(userId, company.getId());

        
        ResponseData result = ResponseData.success("0");
        result.addData("company", company);
        result.addData("contracts", contracts);

        return result;
    }
}
