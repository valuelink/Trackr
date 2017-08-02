package com.lockbur.trackr.test.mapper;

import com.lockbur.trackr.domain.DictType;
import com.lockbur.trackr.domain.DictDetails;
import com.lockbur.trackr.domain.Dict;
import com.lockbur.trackr.mapper.DictTypeMapper;
import com.lockbur.trackr.mapper.DictMapper;
import com.lockbur.trackr.test.TestBase;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wangkun23 on 2017/4/25.
 */
public class DictMapperTest extends TestBase {

    private final Logger logger = LoggerFactory.getLogger(getClass());


    @Resource
    private DictTypeMapper dictTypeMapper;


    @Resource
    private DictMapper dictMapper;

    @Test
    public void insert() {
        DictType code = new DictType("行业信息");
        code.setCreatorId(1);
        dictTypeMapper.insert(code);
    }


    @Test
    public void insertCodeValue() {
        Dict dictValue = new Dict();
        dictValue.setTypeId(1);
        dictValue.setName("互联网");
        dictValue.setDescription("互联网");
        dictValue.setCreatorId(1);


        dictMapper.insert(dictValue);
    }

    @Test
    public void findAll() {
        List<DictType> codes = dictTypeMapper.findAll();
        logger.info("size {}", codes.size());
    }

    @Test
    public void findDetailsById() {
        DictDetails details = dictTypeMapper.findDetailsById(1);
        logger.info("size {}", details);
    }



    @Test
    public void findDetailsByCodes() {
        List<String> codes =new ArrayList<>();
        codes.add("valuateType");
//        codes.add("industry");
//        codes.add("repay");
//        codes.add("customerType");

        List<DictDetails> details = dictTypeMapper.findDetailsByCodes(codes);

        logger.info("size {}", details.size());
    }
}
