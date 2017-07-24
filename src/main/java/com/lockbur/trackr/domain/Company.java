package com.lockbur.trackr.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 客户信息
 */
@Data
public class Company implements Serializable {

    private Integer id;
    private String companyNumber;
    private Integer master;//是否是主公司
    private Integer associatedCount;
    private String companyName;
    private String abbrName;
    private Integer industryId;
    private Integer provinceId;
    private Integer cityId;
    //客户所在地的英文缩写
    private String locationEnName;
    //签约代号
    private String signCode;
    private String email;
    private String address;
    private String webSite;
    private String telephone;
    private String fax;
    private Integer status;
    private Integer creatorId;
    private Date createTime;
    private Date updateTime;
    private Integer masterId;
}