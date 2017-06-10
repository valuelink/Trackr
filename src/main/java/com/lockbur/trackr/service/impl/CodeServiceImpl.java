package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.mapper.CodeMapper;
import com.lockbur.trackr.mapper.CodeValueMapper;
import com.lockbur.trackr.domain.Code;
import com.lockbur.trackr.domain.CodeDetails;
import com.lockbur.trackr.service.CodeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 字典管理
 * Created by wangkun23 on 2017/4/25.
 */
@Service
public class CodeServiceImpl implements CodeService {

    @Resource
    private CodeMapper codeMapper;

    @Resource
    private CodeValueMapper codeValueMapper;

    @Transactional
    @Override
    public void save(Code code) {
        codeMapper.insert(code);
    }

    @Override
    public List<Code> findAll() {
        List<Code> result = codeMapper.findAll();
        return result;
    }

    @Override
    public CodeDetails findDetailsById(Integer id) {
        return codeMapper.findDetailsById(id);
    }
}
