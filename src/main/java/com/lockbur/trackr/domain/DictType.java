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
public class DictType implements Serializable {
    /**
     * 自增ID
     */
    @Getter
    @Setter
    private Integer id;

    @Getter
    @Setter
    /*字典code，一般是需要使用枚举的字段名*/
    private String code;

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

    public DictType() {
        
    }

    public DictType(final String name) {
        this.name = name;
        this.system = false;
    }

    public DictType(final String code, final String name) {
        this.code = code;
        this.name = name;
        this.system = false;
    }

}