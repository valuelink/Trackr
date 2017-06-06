package com.lockbur.trackr.mapper;

import com.lockbur.trackr.rest.Pageable;
import org.apache.ibatis.annotations.Param;

/**
 * 客户管理
 * Created by wangkun23 on 2017/6/6.
 */
public interface CompanyMapper {

    /**
     * 分页查询客户列表
     *
     * @param pageable
     * @return
     */
    public List<CompanyExt> findByPage(Pageable pageable);

    /**
     * *
     * 分页查询 count
     *
     * @param pageable
     * @return
     */
    public Long countByPage(Pageable pageable);

    /**
     * *
     * 查询客户/公司和创建者关联信息
     *
     * @param id
     * @return
     */
    public CompanyExt findCompanyExtById(Integer id);

    /**
     * 更新客户编号 在保存客户之后，重新按规则设置客户编号
     *
     * @param companyNumber
     * @param id
     */
    public void updateCompanyNumber(@Param("companyNumber") String companyNumber, @Param("id") Integer id);

    /**
     * 添加关联公司时，主公司的关联公司数目 自动+1
     *
     * @param id
     */
    public void updateCompanyAssociatedCount(@Param("id") Integer id);

    /**
     * 查询主公司的关联公司数
     *
     * @param id
     */
    public Integer findCompanyAssociatedCount(@Param("id") Integer id);
    /**
     * 查询公司/客户的关联公司
     *
     * @param masterId
     * @return
     */
    public List<CompanyExt> findAssociatedCompanyExtById(@Param("masterId") Integer masterId);

    /**
     * 查询公司/客户和该公司的关联公司
     *
     * @return
     */
    public List<CompanyExt> findCompanyExtAndaAsociated();


    /**
     * 统计所有有效的客户
     *
     * @return
     */
    public long countAll();

    /**
     * 根据客户简称查询
     * @param abbrName
     * @return
     */
    public Company findByAbbrName(String abbrName);

    /**
     * 客户下所有的公司 使用同一个客户编号，所以在查询添加master为1为条件
     * @return
     */
    public Integer findNextId();
}
