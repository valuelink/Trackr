package com.lockbur.trackr.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * 字典类容
 */
@ToString
public class Dict implements Serializable {
    /**
     * 自增ID
     */
    @Getter
    @Setter
    private Integer id;


    @Getter
    @Setter
    private Integer typeId;


    @Getter
    @Setter
    /*字典code，一般是需要使用枚举的字段名*/
    private String code;

    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private int position;

    @Getter
    @Setter
    private String description;

    @Getter
    @Setter
    private boolean active;

    @Getter
    @Setter
    private Integer creatorId;//创建人

    @Getter
    @Setter
    private Date createTime;

    @Getter
    @Setter
    private Date updateTime;

    public Dict() {

    }
}