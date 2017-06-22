package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;

import java.util.List;


/**
 * Created by wangkun23 on 2016/6/2.
 */
public interface ProjectService {

    public void save(Project project);

    public Project findById(Long id);

    public List<Project> search(String keyword);

    /**
     *
     * @param pageable
     * @return
     */
    public Page<Project> selectByPage(Pageable pageable);
}
