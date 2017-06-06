package com.lockbur.trackr.test.mapper;

import com.lockbur.trackr.domain.Role;
import com.lockbur.trackr.mapper.RoleMapper;
import com.lockbur.trackr.test.TestBase;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;

/**
 * Created by wangkun23 on 2016/12/2.
 */
public class RoleMapperTest extends TestBase {
    private final Logger LOGGER = LoggerFactory.getLogger(getClass());
    @Resource
    private RoleMapper roleMapper;

    @Test
    public void insert() {
        Role role = new Role();
        role.setName("超级管理员");
        role.setDescription("描述");
        role.setCreatorId(1);
        roleMapper.insert(role);
    }

}
