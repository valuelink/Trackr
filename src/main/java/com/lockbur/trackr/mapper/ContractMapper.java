package com.lockbur.trackr.mapper;

import com.lockbur.trackr.model.ContractModel;
import com.lockbur.trackr.rest.Pageable;
import org.apache.ibatis.annotations.Param;

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


    /**
     * 查看某个公司客户的全部合同, 在当前用户权限下
     *
     * @param userId
     * @param companyId
     * @return
     */
    public List<ContractModel> findByCompanyId(@Param("userId") Integer userId, @Param("companyId") Integer companyId);
}
