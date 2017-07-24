package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.Role;
import com.lockbur.trackr.model.CompanyModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;

/**
 * Created by wangkun23 on 2017/7/24.
 */
public interface CompanyService {

    /**
     * 查询
     *
     * @return
     */
    public Page<CompanyModel> findByPage(Pageable pageable);


    /**
     * 根据主键查询
     *
     * @return
     */
    public CompanyModel findById(Integer id);
}
