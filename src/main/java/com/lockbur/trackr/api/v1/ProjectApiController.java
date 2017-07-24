package com.lockbur.trackr.api.v1;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.enums.ApprovalType;
import com.lockbur.trackr.enums.ProjectStatus;
import com.lockbur.trackr.model.HistoricTaskInstanceModel;
import com.lockbur.trackr.model.ProjectModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.rest.ResponseData;
import com.lockbur.trackr.rest.datatables.DataTable;
import com.lockbur.trackr.rest.datatables.DataTableRequest;
import com.lockbur.trackr.service.ProjectService;
import com.lockbur.trackr.service.WorkFlowService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.history.HistoricVariableInstance;
import org.activiti.engine.task.Comment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 立项管理
 * Created by wangkun23 on 2017/6/22.
 */
@RestController
@RequestMapping(value = "/api/v1/project")
public class ProjectApiController {


    final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    ProjectService projectService;

    @Resource
    WorkFlowService workFlowService;


    @Resource
    TaskService taskService;

    @Resource
    private HistoryService historyService;


    @RequestMapping(value = "/tables", method = RequestMethod.POST)
    public DataTable<ProjectModel> getUserDataTable(@RequestBody DataTableRequest request) {
        Pageable pageable = new Pageable(request.getStart() / request.getLength() + 1, request.getLength());
        Page<ProjectModel> page = projectService.selectByPage(pageable);
        DataTable<ProjectModel> dataTable = new DataTable<>(page, request.getDraw());
        return dataTable;
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ResponseData save(Project project) {
        logger.info("project {}", project);
        project.setValuateType("1");
        project.setDelegateId(1);
        project.setCurrency(1);
        project.setPayScale("4:4:2");

        project.setNote("备注");
        project.setCreatorId(1);
        //新建立项 处理中
        project.setStatus(ProjectStatus.ASSIGNED);
        Integer id = projectService.save(project);

        return ResponseData.success(id + "");

    }

    /**
     * 查询项目详细信息
     *
     * @return
     */
    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public ResponseData details(@PathVariable("id") Integer id) {
        Project project = projectService.selectByPrimaryKey(id);

        List<HistoricTaskInstance> historicTasks = historyService.createHistoricTaskInstanceQuery()
                .processInstanceId(project.getProcessInstanceId())
                .finished()
                .list();

        List<HistoricTaskInstanceModel> models = new ArrayList<>(historicTasks.size());
        for (HistoricTaskInstance hti : historicTasks) {
            HistoricTaskInstanceModel model = new HistoricTaskInstanceModel();

            BeanUtils.copyProperties(hti, model);

            //查询流程变量中存储的审批结果
            HistoricVariableInstance historicVariableInstance = historyService.createHistoricVariableInstanceQuery().taskId(hti.getId()).variableName(ApprovalType.class.getSimpleName()).singleResult();
            if(historicVariableInstance!=null){
                ApprovalType approvalType = ApprovalType.valueOf(historicVariableInstance.getValue().toString());
                model.setApprovalType(approvalType);
            }

            List<Comment> comments = taskService.getTaskComments(hti.getId());
            for (Comment comment : comments) {
                //一般情况只会有一个
                model.setComment(comment.getFullMessage());
            }
            models.add(model);
        }

        ResponseData result = ResponseData.success("200");
        result.addData("project", project);
        result.addData("historicTasks", models);
        return result;

    }

    //完成任务
    @RequestMapping(value = "/complete", method = RequestMethod.POST)
    public ResponseData complete(String taskId, Integer projectId, String comment, ProjectStatus status) {
        logger.info("taskId {}", taskId);
        logger.info("projectId {}", projectId);
        logger.info("comment {}", comment);
        logger.info("comment {}", status);
        projectService.approve(taskId, projectId, comment, status);
        return ResponseData.success();
    }
}
