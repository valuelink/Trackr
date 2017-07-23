package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.model.ActTask;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.WorkFlowService;
import org.activiti.engine.history.HistoricTaskInstance;
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

    /**
     * 个人代办任务列表
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/tasks/todo", method = RequestMethod.POST)
    public DataTable<ActTask> getTodoTasksDataTable(@RequestBody DataTableRequest request) {
        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());
        Page<ActTask> page = workFlowService.getTodoTasks(pageable);
        DataTable<ActTask> dataTable = new DataTable<>(page, request.getDraw());
        return dataTable;
    }


    /**
     * 已经办理任务查询
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/tasks/complete", method = RequestMethod.POST)
    public DataTable<ActTask> getCompleteTasksDataTable(@RequestBody DataTableRequest request) {
        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());
        Page<HistoricTaskInstance> page = workFlowService.getCompleteTasks(pageable);
        DataTable<ActTask> dataTable = new DataTable<>(page, request.getDraw());
        return dataTable;
    }

}
