package com.lockbur.trackr.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 员工用户
 */
@Data
public class User implements Serializable {

    private Integer id;
    private String loginName;
    private String password;
    private String salt;
    private String realName;
    private String companyEmail;
    private Integer departmentId;
    private Integer gender;
    private String mobile;
    private String mobilePassword;
    private Date mobileCreateTime;
    private String companyEmailPassword;
    private String mailSigned;
    private String avatar;
    private String loginIp;
    private Date loginTime;
    private String lastLoginIp;
    private Date lastLoginTime;
    private String empNo;
    private String position;
    private String subCompany;
    private Integer status;
    private Integer creatorId;
    private Date createTime;
    private Date updateTime;
    private String specialPowers;
}
