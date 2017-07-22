package com.lockbur.trackr.test.service;

import com.lockbur.trackr.test.TestBase;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by wangkun23 on 2017/6/22.
 */
public class WorkFlowServiceTest extends TestBase {

    private static final Logger logger = LoggerFactory.getLogger(WorkFlowServiceTest.class);


    @Resource
    RuntimeService runtimeService;


    @Resource
    TaskService taskService;

    @Test
    public void start() {
        // 启动流程
        ProcessInstance procIns = runtimeService.startProcessInstanceByKey("SurveyProcess", "CT000005");
    }
    @Test
    public void complete() {
        Map map = new HashMap();
        map.put("partnert", "王坤123");
        //taskService.complete("803",map);
        taskService.complete("3306");
    }


    @Test
    public void isEnded() {
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId("2301").singleResult();
        logger.info("isEnded {}",processInstance.isEnded());
    }

}
