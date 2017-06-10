package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.domain.User;
import com.lockbur.trackr.service.EmployeeService;
import org.springframework.stereotype.Service;

/**
 * Created by wangkun23 on 2017/6/10.
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Override
    public boolean isAuthenticated() {
        return false;
    }

    @Override
    public User getCurrentUser() {
        return null;
    }

    @Override
    public User getCurrentUserByPrincipal() {
        return null;
    }

    @Override
    public Integer getCurrentUserId() {
        return 1;
    }
}
