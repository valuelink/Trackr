package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.domain.User;
import com.lockbur.trackr.rest.Filter;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableColumn;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户管理API
 * Created by wangkun23 on 2017/6/6.
 */
@RestController
@RequestMapping(value = "/api/v1/user")
public class UserApiController {

    @Resource
    private UserService userService;

    @RequestMapping(value = "/list/dataTables", method = RequestMethod.POST)
    public DataTable<User> getDataTables(@RequestBody DataTableRequest request) {
        List<Filter> filters = new ArrayList<>();

        for (DataTableColumn column : request.getColumns()) {
            //表示定义的查询条件
            if (StringUtils.equals(column.getName(), "mobile") && StringUtils.isNotEmpty(column.getSearch().getValue())) {
                // Filter simpleFilter = new Filter("mobile", Filter.Operator.eq, );
                //filters.add(simpleFilter);
            }
            //根据姓名模糊查询
            if (StringUtils.equals(column.getName(), "name") && StringUtils.isNotEmpty(column.getSearch().getValue())) {
                Filter simpleFilter = new Filter("name", Filter.Operator.eq, column.getSearch().getValue());
                filters.add(simpleFilter);
            }
        }

        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());
        pageable.setFilters(filters);

        Page<User> page = userService.findByPage(pageable);
        DataTable<User> dataTable = new DataTable<User>(page, request.getDraw());
        return dataTable;
    }
}
