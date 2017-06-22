package com.lockbur.trackr.mapper;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.rest.Pageable;

import java.util.List;


/**
 * 立项申请管理
 * Created by wangkun23 on 2016/6/2.
 */
public interface ProjectMapper {

    public int deleteByPrimaryKey(Integer id);

    public int insert(Project record);

    public Project selectByPrimaryKey(Integer id);

    public int updateByPrimaryKeySelective(Project record);

    public List<Project> selectByLikeName(String name);

    /**
     * 分页查询列表
     *
     * @param pageable
     * @return
     */
    public List<Project> selectByPage(Pageable pageable);

    /**
     * *
     * 分页查询 count
     *
     * @param pageable
     * @return
     */
    public Long countByPage(Pageable pageable);

}
