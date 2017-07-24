package com.lockbur.trackr.domain;

import com.lockbur.trackr.enums.ProjectStatus;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;


/**
 * 立项申请
 * Created by wangkun23 on 2016/6/2.
 */
@ToString
public class Project implements Serializable {

    @Getter
    @Setter
    private Integer id;


    @Getter
    @Setter
    private String processInstanceId;//流程实例的ID


    @Getter
    @Setter
    private String name;//项目名称

    @Getter
    @Setter
    private Integer companyId;//关联客户

    @Getter
    @Setter
    private Integer riskLevel;//财务风险评级

    @Getter
    @Setter
    private String economicBehavior;//经济行为

    //评估目的
    //如果其他 需要填写附加说明
    @Getter
    @Setter
    private Integer purpose;


    @Getter
    @Setter
    private String valuateContent;//评估内容

    @Getter
    @Setter
    private String valuateType; //评估内容(类型)

    @Getter
    @Setter
    private String valuateTypeOther; //如果选择是其他项资产，在跟选内容

    @Getter
    @Setter
    private Integer reportType;//报告类型

    @Getter
    @Setter
    private String valuateTime;//项目评估时间(评估基准日)

    @Getter
    @Setter
    private Integer delegateId;//受托方

    @Getter
    @Setter
    private Integer reportId;//报告出具公司ID，与受托方相同，可自行选择

    @Getter
    @Setter
    private Integer reportName;//报告出具公司

    @Getter
    @Setter
    private Integer amount;//总金额

    @Getter
    @Setter
    private Integer currency;//货币

    @Getter
    @Setter
    private String payScale;//支付比例

    @Getter
    @Setter
    private Integer partnerId;//项目合伙人

    @Getter
    @Setter
    private String note;//备注信息

    @Getter
    @Setter
    private Integer creatorId;//项目创建人


    @Getter
    @Setter
    private ProjectStatus status;//项目状态

    @Getter
    @Setter
    private Date createTime;// 创建日期

    @Getter
    @Setter
    private Date updateTime;// 修改日期
}
