package com.lockbur.trackr.mapper;


import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.domain.User;
import com.lockbur.trackr.rest.Pageable;

import java.util.List;


/**
 * Created by wangkun23 on 2016/6/2.
 */
public interface ProjectMapper {

    public void save(Project project);

    public Project findById(Long id);

    public List<Project> findByLikeName(String name);

    /**
     * 分页查询列表
     *
     * @param pageable
     * @return
     */
    public List<Project> findByPage(Pageable pageable);

    /**
     * *
     * 分页查询 count
     *
     * @param pageable
     * @return
     */
    public Long countByPage(Pageable pageable);

}
