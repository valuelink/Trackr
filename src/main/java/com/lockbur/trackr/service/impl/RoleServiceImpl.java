package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.domain.Authority;
import com.lockbur.trackr.domain.Role;
import com.lockbur.trackr.enums.AuthorityType;
import com.lockbur.trackr.mapper.AuthorityMapper;
import com.lockbur.trackr.mapper.RoleMapper;
import com.lockbur.trackr.model.RoleModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.RoleService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import javax.annotation.Resource;
import java.util.List;

/**
 * 角色管理
 * Created by wangkun23 on 2016/12/2.
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private AuthorityMapper authorityMapper;

    @Override
    public void save(RoleModel role) {
        Assert.notNull(role);
        roleMapper.insert(role);
        //保存角色对应的权限
        for (String authority : role.getAuthorities()) {
            Authority entity = new Authority();
            entity.setType(AuthorityType.ROLE);
            entity.setTypeId(role.getId());
            entity.setAuthority(authority);
            entity.setCreatorId(role.getCreatorId());

            authorityMapper.insert(entity);
        }
    }

    @Override
    public List<String> findAuthority(List<Integer> roleIds) {
        List<String> result = authorityMapper.findAuthorityByRoles(roleIds);
        return result;
    }


    @Override
    public Page<Role> findByPage(Pageable pageable) {
        List<Role> content = roleMapper.findByPage(pageable);
        Long count = roleMapper.countByPage(pageable);
        return new Page(content, count, pageable);
    }

    @Override
    public RoleModel findById(Integer id) {
        RoleModel role = new RoleModel();

        Role entity = roleMapper.findById(id);
        BeanUtils.copyProperties(entity, role);
        //查询角色对应的权限
        List<String> authorities = authorityMapper.findAuthorityByRoleId(id);
        role.setAuthorities(authorities);
        return role;
    }

    @Override
    public void update(RoleModel role) {
        Assert.notNull(role);
        Role updaterRole = new Role();

        BeanUtils.copyProperties(role, updaterRole);
        roleMapper.update(updaterRole);
        //先删除之前的权限信息
        authorityMapper.deleteByRoleId(role.getId());
        //保存角色对应的权限
        for (String authority : role.getAuthorities()) {
            Authority entity = new Authority();
            entity.setType(AuthorityType.ROLE);
            entity.setTypeId(role.getId());
            entity.setAuthority(authority);
            authorityMapper.insert(entity);
        }
    }
}
