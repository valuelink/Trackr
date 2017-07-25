package com.lockbur.trackr.mapper;


import com.lockbur.trackr.domain.Menu;
import com.lockbur.trackr.domain.Role;
import com.lockbur.trackr.rest.Pageable;

import java.util.List;

/**
 * 菜单管理
 * <p>
 * <p>
 * Created by wangkun23 on 2017/7/25.
 */
public interface MenuMapper {

    /*保存*/
    public void insert(Menu entity);

    /**
     * 根据父菜单，查询子菜单
     *
     * @param parentId 父菜单ID
     */
    List<Menu> findByParentId(Integer parentId);

    /**
     * 获取不包含按钮的菜单列表
     */
    List<Menu> findNotButtonList();

    /**
     * 分页查询列表
     *
     * @param pageable
     * @return
     */
    public List<Menu> findByPage(Pageable pageable);

    /**
     * *
     * 分页查询 count
     *
     * @param pageable
     * @return
     */
    public Long countByPage(Pageable pageable);
}
