package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.Dict;
import com.lockbur.trackr.domain.DictDetails;

import java.util.List;

/**
 * 经常可能变动的数据字典项管理
 * Created by wangkun23 on 2017/4/26.
 */
public interface DictService {

    public void save(Dict dictValue);

    public List<Dict> findByTypeId(Integer typeId);

    public Dict findById(Integer id);

    public void update(Dict dictValue);

    public void deleteById(Integer id);

    /**
     * 修改active 的状态
     *
     * @param id
     */
    public void markActive(Integer id);



    /**
     * 根据字典分类的code 查询字典列表，这是给接口用的，所以可以查询多个。
     */
    public List<DictDetails> findByTypeCodes(List<String> typeCodes);


}
