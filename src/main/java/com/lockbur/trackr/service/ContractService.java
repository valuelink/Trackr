package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.Contract;
import com.lockbur.trackr.model.CompanyModel;
import com.lockbur.trackr.model.ContractModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;

import java.util.List;

/**
 * 合同管理
 * Created by wangkun23 on 2017/7/24.
 */
public interface ContractService {

    /**
     * 新建合同
     *
     * @param contract
     * @throws Exception
     */
    public void create(Contract contract);


    /**
     * 查询
     *
     * @return
     */
    public Page<ContractModel> findByPage(Pageable pageable);


    /**
     * 根据主键查询
     *
     * @return
     */
    public ContractModel findById(Integer id);


    /**
     * 查看某个公司的全部合同, 在当前用户权限下
     *
     * @param userId
     * @param companyId
     * @return
     */
    public List<ContractModel> findByCompanyId(Integer userId, Integer companyId);

}
