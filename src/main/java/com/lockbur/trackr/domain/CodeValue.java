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
public class CodeValue implements Serializable {
    /**
     * 自增ID
     */
    @Getter
    @Setter
    private Integer id;


    @Getter
    @Setter
    private Integer codeId;

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

    public CodeValue() {

    }
}