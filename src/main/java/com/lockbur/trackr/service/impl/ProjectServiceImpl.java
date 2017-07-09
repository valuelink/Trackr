package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.mapper.ProjectMapper;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.ProjectService;
import com.lockbur.trackr.service.WorkFlowService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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


    @Resource
    ProjectMapper projectMapper;

    @Resource
    WorkFlowService workFlowService;

    @Override
    public Integer save(Project project) {
        projectMapper.insert(project);

        //创建流程并启动
        workFlowService.startProcess(project.getId().toString());
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
    public Page<Project> selectByPage(Pageable pageable) {
        List<Project> content = projectMapper.selectByPage(pageable);
        Long count = projectMapper.countByPage(pageable);
        return new Page(content, count, pageable);
    }
}
