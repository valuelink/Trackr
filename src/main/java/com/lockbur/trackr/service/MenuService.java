package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.Menu;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;

/**
 * 菜单管理
 * Created by wangkun23 on 2017/7/25.
 */
public interface MenuService {


    /**
     * 分页查询
     *
     * @param pageable
     * @return
     */
    public Page<Menu> findByPage(Pageable pageable);
}
