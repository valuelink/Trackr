package com.lockbur.trackr.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * Created by wangkun23 on 2016/6/2.
 */
@Data
public class Project implements Serializable {

    private Long id;
    private String name;
    private String description;

    private Date createTime;// 创建日期
    private Date updateTime;// 修改日期
}
