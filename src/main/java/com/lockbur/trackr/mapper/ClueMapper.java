package com.lockbur.trackr.mapper;

import com.lockbur.trackr.domain.Clue;
import com.lockbur.trackr.rest.Pageable;

import java.util.List;


/**
 * 潜在客户管理(线索管理)
 * Created by wangkun23 on 2017/8/2.
 */
public interface ClueMapper {

    /**
     * 根据主键删除数据库的记录
     *
     * @param id
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入数据库记录
     *
     * @param record
     */
    int insert(Clue record);

    /**
     * @param record
     */
    int insertSelective(Clue record);

    /**
     * 根据主键获取一条数据库记录
     *
     * @param id
     */
    Clue selectByPrimaryKey(Integer id);

    /**
     * @param record
     */
    int updateByPrimaryKeySelective(Clue record);

    /**
     * 分页查询列表
     *
     * @param pageable
     * @return
     */
    public List<Clue> findByPage(Pageable pageable);

    /**
     * *
     * 分页查询 count
     *
     * @param pageable
     * @return
     */
    public Long countByPage(Pageable pageable);

}