package com.lockbur.trackr.test.mapper;

import com.lockbur.trackr.domain.Role;
import com.lockbur.trackr.mapper.UserMapper;
import com.lockbur.trackr.test.TestBase;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;

/**
 * Created by wangkun23 on 2017/6/6.
 */
public class UserMapperTest extends TestBase {

    private final Logger LOGGER = LoggerFactory.getLogger(getClass());

    @Resource
    private UserMapper userMapper;

    @Test
    public void insert() {

    }
}
