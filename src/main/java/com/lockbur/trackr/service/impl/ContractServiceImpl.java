package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.domain.Contract;
import com.lockbur.trackr.mapper.ContractMapper;
import com.lockbur.trackr.model.ContractModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.ContractService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 合同管理
 * Created by wangkun23 on 2017/7/24.
 */
@Service
public class ContractServiceImpl implements ContractService {

    @Resource
    ContractMapper contractMapper;

    @Override
    public void create(Contract contract) {

    }

    @Override
    public Page<ContractModel> findByPage(Pageable pageable) {
        List<ContractModel> content = contractMapper.findByPage(pageable);
        Long count = contractMapper.countByPage(pageable);
        return new Page(content, count, pageable);
    }

    @Override
    public ContractModel findById(Integer id) {
        return null;
    }

    /**
     * 查看某个公司的全部合同, 在当前用户权限下
     *
     * @param userId
     * @param companyId
     * @return
     */
    @Override
    public List<ContractModel> findByCompanyId(Integer userId, Integer companyId) {
        return contractMapper.findByCompanyId(userId, companyId);
    }


}
