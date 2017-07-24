package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.model.ContractModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.ContractService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 合同管理
 * Created by wangkun23 on 2017/7/24.
 */
@RestController
@RequestMapping(value = "/api/v1/contract")
public class ContractApiController {

    @Resource
    private ContractService contractService;

    @RequestMapping(value = "/list/tables", method = RequestMethod.POST)
    public DataTable<ContractModel> getDataTables(@RequestBody DataTableRequest request) {
        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());
        Page<ContractModel> page = contractService.findByPage(pageable);
        DataTable<ContractModel> dataTable = new DataTable<>(page, request.getDraw());
        return dataTable;
    }
}
