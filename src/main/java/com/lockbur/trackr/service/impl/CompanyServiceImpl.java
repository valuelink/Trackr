package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.mapper.CompanyMapper;
import com.lockbur.trackr.model.CompanyModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.CompanyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 客户管理
 * Created by wangkun23 on 2017/7/24.
 */
@Service
public class CompanyServiceImpl implements CompanyService {

    @Resource
    private CompanyMapper companyMapper;

    @Override
    public Page<CompanyModel> findByPage(Pageable pageable) {
        List<CompanyModel> content = companyMapper.findByPage(pageable);
        Long count = companyMapper.countByPage(pageable);
        return new Page(content, count, pageable);
    }

    @Override
    public CompanyModel findById(Integer id) {
        CompanyModel model = companyMapper.findById(id);
        return model;
    }

}
