package com.lockbur.trackr.model;

import com.lockbur.trackr.domain.Company;
import com.lockbur.trackr.domain.User;
import lombok.Getter;
import lombok.Setter;

/**
 * 客户管理类 VO
 * Created by wangkun23 on 2017/7/24.
 */
public class CompanyModel extends Company {


    @Setter
    @Getter
    private User creator=new User();//关联用户

}
