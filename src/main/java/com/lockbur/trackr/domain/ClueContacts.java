package com.lockbur.trackr.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * 潜在客户联系记录管理(线索管理)
 * Created by wangkun23 on 2017/8/2.
 */
@ToString
public class ClueContacts implements Serializable {
    /**
     * <pre>
     * 唯一标识
     * 表字段 : tb_clue_contacts.id
     * </pre>
     */
    @Getter
    @Setter
    private Integer id;

    /**
     * <pre>
     * 潜在客户id
     * 表字段 : tb_clue_contacts.clue_id
     * </pre>
     */
    @Getter
    @Setter
    private Integer clueId;

    /**
     * <pre>
     * 联系执行人
     * 表字段 : tb_clue_contacts.assignee
     * </pre>
     */
    @Getter
    @Setter
    private String assignee;

    /**
     * <pre>
     * 联系时间
     * 表字段 : tb_clue_contacts.contact_time
     * </pre>
     */
    @Getter
    @Setter
    private Date contactTime;

    /**
     * <pre>
     * 备忘
     * 表字段 : tb_clue_contacts.note
     * </pre>
     */
    @Getter
    @Setter
    private String note;

    /**
     * <pre>
     * 状态：0: 删除，1: 有效
     * 表字段 : tb_clue_contacts.status
     * </pre>
     */
    @Getter
    @Setter
    private Boolean status;

    /**
     * <pre>
     * 创建者ID
     * 表字段 : tb_clue_contacts.creator_id
     * </pre>
     */
    @Getter
    @Setter
    private Integer creatorId;

    /**
     * <pre>
     * 创建时间
     * 表字段 : tb_clue_contacts.create_time
     * </pre>
     */
    @Getter
    @Setter
    private Date createTime;

    /**
     * <pre>
     * 最后一次更新时间
     * 表字段 : tb_clue_contacts.update_time
     * </pre>
     */
    @Getter
    @Setter
    private Date updateTime;

}