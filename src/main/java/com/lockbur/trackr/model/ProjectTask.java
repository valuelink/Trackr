package com.lockbur.trackr.model;

import com.lockbur.trackr.domain.Project;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.activiti.bpmn.model.Task;

import java.io.Serializable;

/**
 * Created by wangkun23 on 2017/7/9.
 */
@ToString
public class ProjectTask implements Serializable {
    @Setter
    @Getter
    private Project project;

    @Setter
    @Getter
    private Task task;
}
