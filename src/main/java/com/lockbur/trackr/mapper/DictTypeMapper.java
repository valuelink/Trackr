package com.lockbur.trackr.mapper;


import com.lockbur.trackr.domain.DictType;
import com.lockbur.trackr.domain.DictDetails;

import java.util.List;

/**
 * 字典管理
 * Created by wangkun23 on 2017/4/25.
 */
public interface DictTypeMapper {

    public void insert(DictType type);

    public List<DictType> findAll();

    public DictDetails findDetailsById(Integer id);
}
