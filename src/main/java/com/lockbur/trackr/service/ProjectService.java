package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;

import java.util.List;


/**
 * Created by wangkun23 on 2016/6/2.
 */
public interface ProjectService {

    public Integer save(Project project);

    public Project selectByPrimaryKey(Integer id);

    public List<Project> search(String keyword);

    /**
     * @param pageable
     * @return
     */
    public Page<Project> selectByPage(Pageable pageable);


    /**
     * 立项任务审批
     *
     * @param id
     * @return
     */
    public void approve(String taskId, Integer projectId, String comment, String approve);

}
