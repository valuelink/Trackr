package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.domain.Clue;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.ClueService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 在客户管理(线索管理)
 * Created by wangkun23 on 2017/8/3.
 */
@RestController
@RequestMapping(value = "/api/v1/clue")
public class ClueApiController {

    @Resource
    private ClueService clueService;

    /**
     * 分页查询
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/tables", method = RequestMethod.POST)
    public DataTable<Clue> getDataTables(@RequestBody DataTableRequest request) {
        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());
        Page<Clue> page = clueService.findByPage(pageable);
        DataTable<Clue> dataTable = new DataTable<>(page, request.getDraw());
        return dataTable;
    }
}
