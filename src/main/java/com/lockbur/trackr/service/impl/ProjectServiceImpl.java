package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.domain.User;
import com.lockbur.trackr.mapper.ProjectMapper;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.ProjectService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;


/**
 * Created by wangkun23 on 2016/6/2.
 *
 * @since 1.0
 */
@Service
public class ProjectServiceImpl implements ProjectService {


    @Resource
    ProjectMapper projectMapper;

    @Override
    public void save(Project project) {

    }

    @Override
    public Project findById(Long id) {
        return null;
    }

    @Override
    public List<Project> search(String keyword) {
        return Collections.emptyList();
    }

    @Override
    public Page<Project> findByPage(Pageable pageable) {
        List<Project> content = projectMapper.findByPage(pageable);
        Long count = projectMapper.countByPage(pageable);
        return new Page(content, count, pageable);
    }
}
