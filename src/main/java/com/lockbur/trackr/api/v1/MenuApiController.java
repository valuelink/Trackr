package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.domain.Menu;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.MenuService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 菜单管理
 * Created by wangkun23 on 2017/7/25.
 */
@RestController
@RequestMapping(value = "/api/v1/menu")
public class MenuApiController {

    @Resource
    private MenuService menuService;

    /**
     * 表格数据
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/list/tables", method = RequestMethod.POST)
    public DataTable<Menu> getDataTables(@RequestBody DataTableRequest request) {
        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());
        Page<Menu> page = menuService.findByPage(pageable);
        DataTable<Menu> dataTable = new DataTable<>(page, request.getDraw());
        return dataTable;
    }


}
