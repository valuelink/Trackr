package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.service.ProjectService;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;


/**
 * Created by wangkun23 on 2016/6/2.
 *
 * @since 1.0
 */
@Service
public class ProjectServiceImpl implements ProjectService {


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
}
