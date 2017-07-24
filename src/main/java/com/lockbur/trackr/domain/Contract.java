package com.lockbur.trackr.domain;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * 合同管理（一般就是一个项目）
 * Created by wangkun23 on 2017/7/24.
 */
@Data
@ToString
public class Contract implements Serializable {

    private Integer id;
    private Integer projectId;//立项项目的id
    private Integer companyId;
    private String contractYear;//合同年份
    private String contractNumber;//合同编号
    private String contractName;//合同名
    private String contractTypeIds;//合同类型id，多个用管道符隔开
    private Integer amount;//总金额
    private Integer currency;//
    private String payScale;//付款比例，中间用管道符隔开，例如：4|4|2
    private String detailMoney;
    private Integer payCount;
    private Integer isPayOff;
    private String note;
    private Double progressMaster;
    private Integer progressBranch;
    //签约代号
    private String companySignCode;

    private String contractTypeNames;
    private Integer paymentNoticeProgress;

    private boolean untreated;
    private Integer signBack;// 0-合同未签回，1-合同已签回 2-合同待确认
    private Integer delegateId;
    private String delegateName;

    private Integer sendPaymentNotice;
    private String sendPaymentNoticeVal;

    private String prefix;


    private Integer status;
    private Integer parentId;
    private Integer creatorId;
    private Date createTime;
    private Date updateTime;

}