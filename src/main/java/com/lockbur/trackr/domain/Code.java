package com.lockbur.trackr.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * 系统用户相关数据字典类别
 */
@ToString
public class Code implements Serializable {
    /**
     * 自增ID
     */
    @Getter
    @Setter
    private Integer id;

    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private boolean system;

    @Getter
    @Setter
    private Integer creatorId;//创建人

    @Getter
    @Setter
    private Date createTime;

    @Getter
    @Setter
    private Date updateTime;

    public Code() {
        this.system = false;
    }

    public Code(final String name) {
        this.name = name;
        this.system = false;
    }

}