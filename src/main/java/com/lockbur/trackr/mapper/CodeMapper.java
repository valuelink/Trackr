package com.lockbur.trackr.mapper;


import com.lockbur.trackr.domain.Code;
import com.lockbur.trackr.domain.CodeDetails;

import java.util.List;

/**
 * 字典管理
 * Created by wangkun23 on 2017/4/25.
 */
public interface CodeMapper {

    public void insert(Code code);

    public List<Code> findAll();

    public CodeDetails findDetailsById(Integer id);
}
