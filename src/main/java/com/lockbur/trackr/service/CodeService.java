package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.Code;
import com.lockbur.trackr.domain.CodeDetails;

import java.util.List;

/**
 * 经常可能变动的数据字典管理
 * Created by wangkun23 on 2017/4/25.
 */
public interface CodeService {

    public void save(Code code);

    public List<Code> findAll();

    public CodeDetails findDetailsById(Integer id);

}
