package com.lockbur.trackr.mapper;


import com.lockbur.trackr.domain.CodeValue;

import java.util.List;

/**
 * 字典管理
 * Created by wangkun23 on 2017/4/25.
 */
public interface CodeValueMapper {

    public void insert(CodeValue codeValue);

    public List<CodeValue> findByCodeId(Integer codeId);

    public CodeValue findById(Integer id);

    public void update(CodeValue codeValue);

    public void deleteById(Integer id);

    public void markActive(Integer id);
}
