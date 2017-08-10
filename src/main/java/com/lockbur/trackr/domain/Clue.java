package com.lockbur.trackr.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 潜在客户管理(线索管理)
 * Created by wangkun23 on 2017/8/2.
 */
@ToString
public class Clue implements Serializable {



    /**
     * <pre>
     * 唯一标识
     * 表字段 : tb_clue.id
     * </pre>
     */
    @Getter
    @Setter
    private Integer id;

    /**
     * <pre>
     * 客户名称
     * 表字段 : tb_clue.name
     * </pre>
     */
    @Getter
    @Setter
    private String name;

    /**
     * <pre>
     * 联系人
     * 表字段 : tb_clue.contact_name
     * </pre>
     */
    @Getter
    @Setter
    private String contactName;

    /**
     * <pre>
     * 预计评估时间
     * 表字段 : tb_clue.valuate_time
     * </pre>
     */
    @Getter
    @Setter
    private Date valuateTime;

    /**
     * <pre>
     * （拟）上市地
     * 表字段 : tb_clue.ipo
     * </pre>
     */
    @Getter
    @Setter
    private String ipo;

    /**
     * <pre>
     * 友商id
     * 表字段 : tb_clue.competitor_id
     * </pre>
     */
    @Getter
    @Setter
    private Integer competitorId;

    /**
     * <pre>
     * 联系次数
     * 表字段 : tb_clue.counts
     * </pre>
     */
    @Getter
    @Setter
    private Byte counts;

    /**
     * <pre>
     * 是否签约 1: 是 0: 否
     * 表字段 : tb_clue.signed
     * </pre>
     */
    @Getter
    @Setter
    private Boolean signed;

    /**
     * <pre>
     * 计划下次联系时间
     * 表字段 : tb_clue.next_time
     * </pre>
     */
    @Getter
    @Setter
    private Date nextTime;

    /**
     * <pre>
     * 备注
     * 表字段 : tb_clue.note
     * </pre>
     */
    @Getter
    @Setter
    private String note;

    /**
     * <pre>
     * 状态：0: 删除，1: 有效
     * 表字段 : tb_clue.status
     * </pre>
     */
    @Getter
    @Setter
    private Boolean status;

    /**
     * <pre>
     * 创建者ID
     * 表字段 : tb_clue.creator_id
     * </pre>
     */
    @Getter
    @Setter
    private Integer creatorId;

    /**
     * <pre>
     * 创建时间
     * 表字段 : tb_clue.create_time
     * </pre>
     */
    @Getter
    @Setter
    private Date createTime;

    /**
     * <pre>
     * 最后一次更新时间
     * 表字段 : tb_clue.update_time
     * </pre>
     */
    @Getter
    @Setter
    private Date updateTime;
}
