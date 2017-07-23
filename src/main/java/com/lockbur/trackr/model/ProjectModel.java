package com.lockbur.trackr.model;

import com.lockbur.trackr.domain.Project;
import lombok.Getter;
import lombok.Setter;

/**
 * 封装给前端数据
 * Created by wangkun23 on 2017/7/23.
 */
public class ProjectModel extends Project {


    @Setter
    @Getter
    private String statusName; //根据status 的名称
}
