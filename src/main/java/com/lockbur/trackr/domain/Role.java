package com.lockbur.trackr.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by wangkun23 on 2016/12/2.
 */
@Data
public class Role implements Serializable {
    private Integer id;
    private String name;//名称
    private String description;// 描述
    private Integer creatorId;//创建人

    //时间
    private Date createdTime;
    private Date updateTime;

    /**
     * 权限
     */
    private List<String> authorities = new ArrayList<String>();
}
