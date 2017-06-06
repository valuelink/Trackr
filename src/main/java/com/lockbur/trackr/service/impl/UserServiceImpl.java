package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.domain.User;
import com.lockbur.trackr.mapper.UserMapper;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 用户管理实现
 * Created by wangkun23 on 2017/6/6.
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;


    @Override
    public Page<User> findByPage(Pageable pageable) {
        List<User> content = userMapper.findByPage(pageable);
        Long count = userMapper.countByPage(pageable);
        return new Page(content, count, pageable);
    }

}
