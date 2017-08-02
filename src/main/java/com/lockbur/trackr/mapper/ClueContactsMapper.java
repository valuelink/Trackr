package com.lockbur.trackr.mapper;

import com.lockbur.trackr.domain.ClueContacts;

/**
 * 潜在客户联系记录管理(线索管理)
 * Created by wangkun23 on 2017/8/2.
 */
public interface ClueContactsMapper {
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
    int insert(ClueContacts record);

    /**
     * @param record
     */
    int insertSelective(ClueContacts record);

    /**
     * 根据主键获取一条数据库记录
     *
     * @param id
     */
    ClueContacts selectByPrimaryKey(Integer id);

    /**
     * @param record
     */
    int updateByPrimaryKeySelective(ClueContacts record);

}