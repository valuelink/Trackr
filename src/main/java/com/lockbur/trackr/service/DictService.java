package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.Dict;

import java.util.List;

/**
 * 经常可能变动的数据字典项管理
 * Created by wangkun23 on 2017/4/26.
 */
public interface DictService {

    public void save(Dict dictValue);

    public List<Dict> findByCodeId(Integer codeId);

    public Dict findById(Integer id);

    public void update(Dict dictValue);

    public void deleteById(Integer id);

    /**
     * 修改active 的状态
     *
     * @param id
     */
    public void markActive(Integer id);
}
