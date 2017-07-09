package com.lockbur.trackr.mapper;

import com.lockbur.trackr.domain.User;
import com.lockbur.trackr.rest.Pageable;

import java.util.List;

/**
 * 员工用户管理
 * Created by wangkun23 on 2017/6/6.
 */
public interface UserMapper {

    /**
     * @param user
     */
    public void insert(User user);

    /**
     * @param id
     * @return
     */
    public User findById(Integer id);


    /**
     * 分页查询用户列表
     *
     * @param pageable
     * @return
     */
    public List<User> findByPage(Pageable pageable);

    /**
     * *
     * 分页查询 count
     *
     * @param pageable
     * @return
     */
    public Long countByPage(Pageable pageable);


    /**
     *  根据用户名查找
     * @param loginName
     * @return
     */
    public User getByUserName(String loginName);

}
