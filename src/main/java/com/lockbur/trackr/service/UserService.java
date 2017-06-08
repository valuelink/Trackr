package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.User;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;

/**
 * Created by wangkun23 on 2017/6/6.
 */
public interface UserService {

    /**
     * 分页查询
     *
     * @param pageable
     * @return
     */
    public Page<User> findByPage(Pageable pageable);


    /**
     *
     * @param id
     * @return
     */
    public User findById(Integer id);

}
