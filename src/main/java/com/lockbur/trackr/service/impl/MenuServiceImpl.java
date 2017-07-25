package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.domain.Menu;
import com.lockbur.trackr.mapper.MenuMapper;
import com.lockbur.trackr.model.ContractModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 菜单管理
 * Created by wangkun23 on 2017/7/25.
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Resource
    private MenuMapper menuMapper;

    @Override
    public Page<Menu> findByPage(Pageable pageable) {
        List<Menu> content = menuMapper.findByPage(pageable);
        Long count = menuMapper.countByPage(pageable);
        return new Page(content, count, pageable);
    }

}

