package com.lockbur.trackr.test.service;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.model.ProjectModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.ProjectService;
import com.lockbur.trackr.test.TestBase;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;

/**
 * Created by wangkun23 on 2017/6/22.
 */
public class ProjectServiceTest extends TestBase {
    private static final Logger LOGGER = LoggerFactory.getLogger(ProjectServiceTest.class);
    @Resource
    ProjectService projectService;

    @Test
    public void start() {
        Pageable pageable = new Pageable(1, 100);
        Page<ProjectModel> page = projectService.selectByPage(pageable);
        LOGGER.info("page {}", page);
    }
}
