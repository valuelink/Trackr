package com.lockbur.trackr.test.service;

import com.lockbur.trackr.test.TestBase;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.runtime.ProcessInstance;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * Created by wangkun23 on 2017/6/22.
 */
public class WorkFlowServiceTest extends TestBase {

    @Resource
    RuntimeService runtimeService;

    @Test
    public void start() {
        // 启动流程
        ProcessInstance procIns = runtimeService.startProcessInstanceByKey("projectProcess", "CT000002");
    }

}
