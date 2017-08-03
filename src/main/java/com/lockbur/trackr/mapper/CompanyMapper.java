package com.lockbur.trackr.mapper;

import com.lockbur.trackr.model.CompanyModel;
import com.lockbur.trackr.rest.Pageable;

import java.util.List;

/**
 * 客户管理
 * Created by wangkun23 on 2017/7/24.
 */
public interface CompanyMapper {

    /**
     * 根据ID查询
     *
     * @param id
     * @return
     */
    public CompanyModel findById(Integer id);

    /**
     * 分页查询列表
     *
     * @param pageable
     * @return
     */
    public List<CompanyModel> findByPage(Pageable pageable);

    /**
     * *
     * 分页查询 count
     *
     * @param pageable
     * @return
     */
    public Long countByPage(Pageable pageable);
}
