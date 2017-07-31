package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.DictType;
import com.lockbur.trackr.domain.DictDetails;

import java.util.List;

/**
 * 经常可能变动的数据字典管理
 * Created by wangkun23 on 2017/4/25.
 */
public interface DictTypeService {

    public void save(DictType code);

    public List<DictType> findAll();

    public DictDetails findDetailsById(Integer id);

}
