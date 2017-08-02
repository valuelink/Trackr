package com.lockbur.trackr.test.service;

import com.lockbur.trackr.domain.Clue;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.ClueService;
import com.lockbur.trackr.test.TestBase;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;

/**
 * Created by wangkun23 on 2017/8/2.
 */
public class ClueServiceTest extends TestBase {
    private static final Logger LOGGER = LoggerFactory.getLogger(ClueServiceTest.class);

    @Resource
    ClueService clueService;

    @Test
    public void findByPage() {
        Pageable pageable = new Pageable(1, 100);
        Page<Clue> page = clueService.findByPage(pageable);
        LOGGER.info("page {}", page);
    }

}
