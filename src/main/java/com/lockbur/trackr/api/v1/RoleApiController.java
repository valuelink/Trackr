package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.domain.Role;
import com.lockbur.trackr.domain.User;
import com.lockbur.trackr.rest.Filter;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.RoleService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 角色管理
 * Created by wangkun23 on 2017/7/24.
 */
@RestController
@RequestMapping(value = "/api/v1/role")
public class RoleApiController {

    @Resource
    private RoleService roleService;

    @RequestMapping(value = "/list/tables", method = RequestMethod.POST)
    public DataTable<Role> getDataTables(@RequestBody DataTableRequest request) {
        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());
        Page<Role> page = roleService.findByPage(pageable);
        DataTable<Role> dataTable = new DataTable<>(page, request.getDraw());
        return dataTable;
    }
}
