package com.lockbur.trackr.test.mapper;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.mapper.ProjectMapper;
import com.lockbur.trackr.test.TestBase;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wangkun23 on 2016/7/13.
 */
public class ProjectDaoTest extends TestBase {
    private static final Logger LOGGER = LoggerFactory.getLogger(ProjectDaoTest.class);

    @Resource
    private ProjectMapper projectMapper;

    //@Test
    public void test() {
        Project project = new Project();

        project.setName("testName");
        project.setNote("test描述");

        projectMapper.save(project);
        LOGGER.info("##########");
    }

    //@Test
    public void findById() {
        Project project = projectMapper.findById(6L);
        LOGGER.info("########## {}", project);
    }

    @Test
    public void findByLikeName() {
        List<Project> list = projectMapper.findByLikeName("test");
        LOGGER.info("########## {}", list.size());
    }

}
