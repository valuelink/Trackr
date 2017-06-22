package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.model.ActTask;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.WorkFlowService;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.task.Task;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 工作任务管理
 * Created by wangkun23 on 2017/6/22.
 */
@RestController
@RequestMapping(value = "/api/v1/workflow")
public class WorkFlowApiController {


    @Resource
    WorkFlowService workFlowService;

    @RequestMapping(value = "/todo", method = RequestMethod.POST)
    public DataTable<ActTask> getTodoDataTable(@RequestBody DataTableRequest request) {
        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());
        Page<ActTask> page = workFlowService.todoList(pageable);
        DataTable<ActTask> dataTable = new DataTable<>(page, request.getDraw());
        return dataTable;
    }
}
