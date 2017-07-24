package com.lockbur.trackr.mapper;

import com.lockbur.trackr.model.ContractModel;
import com.lockbur.trackr.rest.Pageable;

import java.util.List;

/**
 * 合同管理系统  操作数据库
 * Created by wangkun23 on 2017/7/24.
 */
public interface ContractMapper {

    /**
     * 分页查询列表
     *
     * @param pageable
     * @return
     */
    public List<ContractModel> findByPage(Pageable pageable);

    /**
     * *
     * 分页查询 count
     *
     * @param pageable
     * @return
     */
    public Long countByPage(Pageable pageable);
}
