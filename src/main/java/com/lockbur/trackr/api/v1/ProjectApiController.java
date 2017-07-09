package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.ResponseData;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.ProjectService;
import com.lockbur.trackr.service.WorkFlowService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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


    final Logger logger= LoggerFactory.getLogger(getClass());

    @Resource
    ProjectService projectService;

    @Resource
    WorkFlowService workFlowService;


    @RequestMapping(value = "/tables", method = RequestMethod.POST)
    public DataTable<Project> getUserDataTable(@RequestBody DataTableRequest request) {
        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());
        Page<Project> page = projectService.selectByPage(pageable);
        DataTable<Project> dataTable = new DataTable<>(page, request.getDraw());
        return dataTable;
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ResponseData save(Project project) {
        logger.info("project {}",project);
        project.setValuateType("1");
        project.setDelegateId(1);
        project.setCurrency(1);
        project.setPayScale("4:4:2");

        project.setNote("备注");
        project.setCreatorId(1);

        Integer id  =projectService.save(project);
        return ResponseData.success();
    }

    //完成任务
    @RequestMapping(value = "/complete", method = RequestMethod.POST)
    public ResponseData complete(String taskId, String projectId, String comment) {
        logger.info("taskId {}",taskId);
        logger.info("projectId {}",projectId);
        logger.info("comment {}",comment);

        workFlowService.complete(taskId,projectId,comment);
        return ResponseData.success();
    }
}
