package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.CodeValue;

import java.util.List;

/**
 * 经常可能变动的数据字典项管理
 * Created by wangkun23 on 2017/4/26.
 */
public interface CodeValueService {

    public void save(CodeValue codeValue);

    public List<CodeValue> findByCodeId(Integer codeId);

    public CodeValue findById(Integer id);

    public void update(CodeValue codeValue);

    public void deleteById(Integer id);

    /**
     * 修改active 的状态
     *
     * @param id
     */
    public void markActive(Integer id);
}
