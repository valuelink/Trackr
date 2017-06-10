package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.mapper.CodeValueMapper;
import com.lockbur.trackr.domain.CodeValue;
import com.lockbur.trackr.service.CodeValueService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 字典条目管理
 * Created by wangkun23 on 2017/4/26.
 */
@Service
public class CodeValueServiceImpl implements CodeValueService {

    @Resource
    CodeValueMapper codeValueMapper;

    @Override
    @Transactional
    public void save(CodeValue codeValue) {
        codeValueMapper.insert(codeValue);
    }

    @Override
    public List<CodeValue> findByCodeId(Integer codeId) {
        return codeValueMapper.findByCodeId(codeId);
    }

    @Override
    public CodeValue findById(Integer id) {
        return codeValueMapper.findById(id);
    }

    @Override
    @Transactional
    public void update(CodeValue codeValue) {
        codeValueMapper.update(codeValue);
    }

    @Override
    public void deleteById(Integer id) {
        codeValueMapper.deleteById(id);
    }

    @Override
    public void markActive(Integer id) {
        CodeValue codeValue = codeValueMapper.findById(id);
        CodeValue codeEntity = new CodeValue();
        codeEntity.setId(id);
        if (codeValue.isActive()) {
            codeEntity.setActive(false);
        } else {
            codeEntity.setActive(true);
        }
        codeValueMapper.update(codeEntity);
    }
}
