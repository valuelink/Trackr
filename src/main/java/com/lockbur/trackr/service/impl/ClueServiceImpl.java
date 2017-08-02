package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.domain.Clue;
import com.lockbur.trackr.mapper.ClueMapper;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.ClueService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wangkun23 on 2017/8/2.
 */
@Service
public class ClueServiceImpl implements ClueService {
    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private ClueMapper clueMapper;

    @Override
    public Page<Clue> findByPage(Pageable pageable) {
        List<Clue> list = clueMapper.findByPage(pageable);
        Long count = clueMapper.countByPage(pageable);
        return new Page(list, count, pageable);
    }
}
