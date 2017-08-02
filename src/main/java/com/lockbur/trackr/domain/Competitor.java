package com.lockbur.trackr.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * 友商（竞争者）
 * Created by wangkun23 on 2017/8/2.
 */
@ToString
public class Competitor implements Serializable {

    /**
     * <pre>
     * 唯一标识
     * 表字段 : tb_competitor.id
     * </pre>
     */
    @Getter
    @Setter
    private Integer id;

    /**
     * <pre>
     * 客户名称
     * 表字段 : tb_competitor.company_name
     * </pre>
     */
    @Getter
    @Setter
    private String companyName;

    /**
     * <pre>
     * 所属行业id
     * 表字段 : tb_competitor.industry_id
     * </pre>
     */
    @Getter
    @Setter
    private Integer industryId;

    /**
     * <pre>
     * 审计/地区id
     * 表字段 : tb_competitor.audit_region_id
     * </pre>
     */
    @Getter
    @Setter
    private Integer auditRegionId;

    /**
     * <pre>
     * 对手名称/友商名称
     * 表字段 : tb_competitor.name
     * </pre>
     */
    @Getter
    @Setter
    private String name;

    /**
     * <pre>
     * 上市地id
     *
     * 表字段 : tb_competitor.ipo_id
     * </pre>
     */
    @Getter
    @Setter
    private Integer ipoId;

    /**
     * <pre>
     * 下一步执行计划
     * 表字段 : tb_competitor.next_plan
     * </pre>
     */
    @Getter
    @Setter
    private String nextPlan;

    /**
     * <pre>
     * 是否已被转为潜在客户 1: 是 0: 否
     * 表字段 : tb_competitor.changed
     * </pre>
     */
    @Getter
    @Setter
    private Boolean changed;

    /**
     * <pre>
     * 状态：0: 删除，1: 有效
     * 表字段 : tb_competitor.status
     * </pre>
     */
    @Getter
    @Setter
    private Boolean status;

    /**
     * <pre>
     * 创建者ID
     * 表字段 : tb_competitor.creator_id
     * </pre>
     */
    @Getter
    @Setter
    private Integer creatorId;

    /**
     * <pre>
     * 创建时间
     * 表字段 : tb_competitor.create_time
     * </pre>
     */
    @Getter
    @Setter
    private Date createTime;

    /**
     * <pre>
     * 最后一次更新时间
     * 表字段 : tb_competitor.update_time
     * </pre>
     */
    @Getter
    @Setter
    private Date updateTime;

}
