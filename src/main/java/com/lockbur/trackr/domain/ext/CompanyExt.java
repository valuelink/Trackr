package com.lockbur.trackr.domain.ext;

import cn.valuelink.valuation.model.Company;
import cn.valuelink.valuation.model.Contract;
import cn.valuelink.valuation.model.User;

import java.util.List;

/**
 * 客户/公司
 *
 * @author wangkun
 * @version 16/2/18
 */
public class CompanyExt extends Company {
    
    private User creator;

    private List<CompanyExt> associatedCompany;

    //查看某个公司的全部合同, 只查自己当前用户权限下
    private List<Contract> contracts;
    
    public User getCreator() {
        return creator;
    }
    
    public void setCreator(User creator) {
        this.creator = creator;
    }

    public List<CompanyExt> getAssociatedCompany() {
        return associatedCompany;
    }

    public void setAssociatedCompany(List<CompanyExt> associatedCompany) {
        this.associatedCompany = associatedCompany;
    }

    public List<Contract> getContracts() {
        return contracts;
    }

    public void setContracts(List<Contract> contracts) {
        this.contracts = contracts;
    }
}
