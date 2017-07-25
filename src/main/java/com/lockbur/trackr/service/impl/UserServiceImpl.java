package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.domain.Authority;
import com.lockbur.trackr.domain.Role;
import com.lockbur.trackr.domain.User;
import com.lockbur.trackr.domain.UserRole;
import com.lockbur.trackr.enums.AuthorityType;
import com.lockbur.trackr.mapper.AuthorityMapper;
import com.lockbur.trackr.mapper.UserMapper;
import com.lockbur.trackr.mapper.UserRoleMapper;
import com.lockbur.trackr.model.UserModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.RoleService;
import com.lockbur.trackr.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Resource
    private UserRoleMapper userRoleMapper;

    @Resource
    private AuthorityMapper authorityMapper;

    @Resource
    private RoleService roleService;


    @Override
    public Page<User> findByPage(Pageable pageable) {
        List<User> content = userMapper.findByPage(pageable);
        Long count = userMapper.countByPage(pageable);
        return new Page(content, count, pageable);
    }

    @Override
    public UserModel findById(Integer id) {
        UserModel model = new UserModel();

        User user = userMapper.findById(id);
        if (user != null) {
            BeanUtils.copyProperties(user, model);
        }
        //用户角色
        Role role = roleService.findRoleByUserId(id);
        model.setRole(role);

        /*附加权限*/
        List<String> authorities = authorityMapper.findAuthorityByUserId(id);
        model.setAuthorities(authorities);

        return model;
    }

    @Override
    public User selectByUserName(String userName) {
        return userMapper.getByUserName(userName);
    }

    @Override
    @Transactional
    public void update(UserModel model) {
        //1 更新用户基本信息



        //2 修改对应的角色关系
        userRoleMapper.deleteByUserId(model.getId());

        UserRole userRole = new UserRole();
        userRole.setRoleId(model.getRole().getId());
        userRole.setUserId(model.getId());
        userRoleMapper.insert(userRole);

        //3 附加权限修改
        authorityMapper.deleteByUserId(model.getId());

        for (String authority : model.getAuthorities()) {
            Authority entity = new Authority();

            entity.setTypeId(model.getId());
            entity.setAuthority(authority);
            entity.setType(AuthorityType.USER);
            entity.setCreatorId(model.getId());
            authorityMapper.insert(entity);
        }

    }
}
