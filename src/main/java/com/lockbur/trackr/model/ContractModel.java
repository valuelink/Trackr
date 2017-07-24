package com.lockbur.trackr.model;

import com.lockbur.trackr.domain.Company;
import com.lockbur.trackr.domain.Contract;
import lombok.Getter;
import lombok.Setter;

/**
 * 合同详细信息
 * Created by wangkun23 on 2017/7/24.
 */
public class ContractModel extends Contract {


    @Setter
    @Getter
    private Company company; //客户

}
