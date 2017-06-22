package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.ProjectService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 立项管理
 * Created by wangkun23 on 2017/6/22.
 */
@RestController
@RequestMapping(value = "/api/v1/project")
public class ProjectApiController {

    @Resource
    ProjectService projectService;

    @RequestMapping(value = "/tables", method = RequestMethod.POST)
    public DataTable<Project> getUserDataTable(@RequestBody DataTableRequest request) {
        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());
        Page<Project> page = projectService.selectByPage(pageable);
        DataTable<Project> dataTable = new DataTable<>(page, request.getDraw());
        return dataTable;
    }
}
