package com.lockbur.trackr.mapper;


import com.lockbur.trackr.domain.Dict;

import java.util.List;

/**
 * 字典管理
 * Created by wangkun23 on 2017/4/25.
 */
public interface DictMapper {

    public void insert(Dict dict);

    public List<Dict> findByTypeId(Integer typeId);

    public Dict findById(Integer id);

    public void update(Dict dict);

    public void deleteById(Integer id);

    public void markActive(Integer id);
}
