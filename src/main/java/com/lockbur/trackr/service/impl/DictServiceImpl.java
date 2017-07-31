package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.domain.Dict;
import com.lockbur.trackr.mapper.DictMapper;
import com.lockbur.trackr.service.DictService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 字典条目管理
 * Created by wangkun23 on 2017/4/26.
 */
@Service
public class DictServiceImpl implements DictService {

    @Resource
    DictMapper dictMapper;

    @Override
    @Transactional
    public void save(Dict dictValue) {
        dictMapper.insert(dictValue);
    }

    @Override
    public List<Dict> findByCodeId(Integer typeId) {
        return dictMapper.findByTypeId(typeId);
    }

    @Override
    public Dict findById(Integer id) {
        return dictMapper.findById(id);
    }

    @Override
    @Transactional
    public void update(Dict dictValue) {
        dictMapper.update(dictValue);
    }

    @Override
    public void deleteById(Integer id) {
        dictMapper.deleteById(id);
    }

    @Override
    public void markActive(Integer id) {
        Dict dictValue = dictMapper.findById(id);
        Dict codeEntity = new Dict();
        codeEntity.setId(id);
        if (dictValue.isActive()) {
            codeEntity.setActive(false);
        } else {
            codeEntity.setActive(true);
        }
        dictMapper.update(codeEntity);
    }
}
