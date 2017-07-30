package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.domain.User;
import com.lockbur.trackr.model.UserModel;
import com.lockbur.trackr.rest.Filter;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.ResponseData;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableColumn;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

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

    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private UserService userService;


    /**
     * 保存员工信息
     *
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ResponseData login(String username, String password) {
        try {
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            SecurityUtils.getSubject().login(token);

        } catch (AuthenticationException ex) {
            if (ex instanceof UnknownAccountException) {
                return ResponseData.error("100001","账户不存在");
            }
            if (ex instanceof DisabledAccountException) {
                return ResponseData.error("100002","账户已被禁用，请与管理员联系");
            }
            if (ex instanceof IncorrectCredentialsException) {
                return ResponseData.error("100002","账户验证失败");
            }
        }
        return ResponseData.success("0");
    }


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


    /**
     * 查询详情信息
     *
     * @return
     */
    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public ResponseData details(@PathVariable("id") Integer id) {
        UserModel model = userService.findById(id);

        ResponseData result = ResponseData.success("200");
        result.addData("user", model);
        return result;
    }

    /**
     * 保存员工信息
     *
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ResponseData save(User user) {

        return ResponseData.success();
    }


    /**
     * 保存员工信息
     *
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ResponseData update(@RequestBody UserModel user) {
        userService.update(user);
        logger.info("## {}", user);
        return ResponseData.success();
    }
}
