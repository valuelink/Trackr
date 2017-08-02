package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.Clue;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;

/**
 * 潜在客户管理（线索管理）
 * Created by wangkun23 on 2017/8/2.
 */
public interface ClueService {

    /**
     * @param pageable
     * @return
     */
    public Page<Clue> findByPage(Pageable pageable);

}
