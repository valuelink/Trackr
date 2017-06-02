package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.Project;

import java.util.List;


/**
 * Created by wangkun23 on 2016/6/2.
 */
public interface ProjectService {

    public void save(Project project);

    public Project findById(Long id);

    public List<Project> search(String keyword);

}
