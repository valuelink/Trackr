package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.enums.ApprovalType;
import com.lockbur.trackr.enums.ProjectStatus;
import com.lockbur.trackr.mapper.ProjectMapper;
import com.lockbur.trackr.model.ProjectModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.ProjectService;
import com.lockbur.trackr.service.WorkFlowService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


/**
 * 项目管理
 * Created by wangkun23 on 2016/6/2.
 *
 * @since 1.0
 */
@Service
public class ProjectServiceImpl implements ProjectService {

    final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    ProjectMapper projectMapper;

    @Resource
    WorkFlowService workFlowService;

    @Override
    @Transactional
    public Integer save(Project project) {
        projectMapper.insert(project);

        //创建流程并启动
        String processInstanceId = workFlowService.startProcess(project.getId().toString());

        Project updateProject = new Project();
        updateProject.setId(project.getId());
        updateProject.setProcessInstanceId(processInstanceId);

        projectMapper.updateByPrimaryKeySelective(updateProject);

        return project.getId();
    }

    @Override
    public Project selectByPrimaryKey(Integer id) {
        return projectMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Project> search(String keyword) {
        return Collections.emptyList();
    }

    @Override
    public Page<ProjectModel> findByPage(Pageable pageable) {
        List<Project> content = projectMapper.selectByPage(pageable);
        Long count = projectMapper.countByPage(pageable);

        List<ProjectModel> result = new ArrayList(content.size());
        for (Project entity : content) {
            ProjectModel model = new ProjectModel();
            BeanUtils.copyProperties(entity, model);
            //重新设置枚举值
            model.setStatusName(entity.getStatus().getKey());
            result.add(model);
        }

        return new Page(result, count, pageable);
    }


    @Override
    @Transactional
    public void approve(String taskId, Integer projectId, String comment, ProjectStatus status) {
        //审批通过
        Project updateProject = new Project();
        updateProject.setId(projectId);
        updateProject.setStatus(status);
        projectMapper.updateByPrimaryKeySelective(updateProject);

        if (status.equals(ProjectStatus.APPROVED)) {
            //创建合同项目
            workFlowService.complete(taskId, projectId.toString(), ApprovalType.APPROVE, comment);
        }

        if (status.equals(ProjectStatus.REJECTED)) {
            workFlowService.complete(taskId, projectId.toString(), ApprovalType.REJECT, comment);
        }

    }
}
