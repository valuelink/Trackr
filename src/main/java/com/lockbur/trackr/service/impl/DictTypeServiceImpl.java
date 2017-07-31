package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.domain.DictType;
import com.lockbur.trackr.mapper.DictTypeMapper;
import com.lockbur.trackr.domain.DictDetails;
import com.lockbur.trackr.service.DictTypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 字典管理
 * Created by wangkun23 on 2017/4/25.
 */
@Service
public class DictTypeServiceImpl implements DictTypeService {

    @Resource
    private DictTypeMapper dictTypeMapper;

    @Transactional
    @Override
    public void save(DictType type) {
        dictTypeMapper.insert(type);
    }

    @Override
    public List<DictType> findAll() {
        List<DictType> result = dictTypeMapper.findAll();
        return result;
    }

    @Override
    public DictDetails findDetailsById(Integer id) {
        return dictTypeMapper.findDetailsById(id);
    }
}
