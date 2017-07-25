package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.domain.Role;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.ResponseData;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.RoleService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

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


    /**
     * 全部角色
     *
     * @return
     */
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public ResponseData findAll() {
        Pageable pageable = new Pageable(1, Integer.MAX_VALUE);
        Page<Role> page = roleService.findByPage(pageable);

        ResponseData result = ResponseData.success("200");
        result.addData("roles", page.getContent());
        return result;
    }


    /**
     * 角色权限信息
     *
     * @return
     */
    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public ResponseData details(@PathVariable("id") Integer id) {
        Role role = roleService.findById(id);

        //角色对应的权限

        ResponseData result = ResponseData.success("200");
        result.addData("role", role);
        return result;
    }
}
