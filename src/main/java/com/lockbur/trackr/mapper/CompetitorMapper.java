package com.lockbur.trackr.mapper;

import com.lockbur.trackr.domain.Competitor;

/**
 * 友商管理
 * Created by wangkun23 on 2017/8/2.
 */
public interface CompetitorMapper {
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
    int insert(Competitor record);

    /**
     * @param record
     */
    int insertSelective(Competitor record);

    /**
     * 根据主键获取一条数据库记录
     *
     * @param id
     */
    Competitor selectByPrimaryKey(Integer id);

    /**
     * @param record
     */
    int updateByPrimaryKeySelective(Competitor record);
}