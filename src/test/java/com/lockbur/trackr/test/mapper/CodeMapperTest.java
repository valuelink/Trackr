package com.lockbur.trackr.test.mapper;

import com.lockbur.trackr.domain.Code;
import com.lockbur.trackr.domain.CodeDetails;
import com.lockbur.trackr.domain.CodeValue;
import com.lockbur.trackr.mapper.CodeMapper;
import com.lockbur.trackr.mapper.CodeValueMapper;
import com.lockbur.trackr.test.TestBase;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wangkun23 on 2017/4/25.
 */
public class CodeMapperTest extends TestBase {

    private final Logger logger = LoggerFactory.getLogger(getClass());


    @Resource
    private CodeMapper codeMapper;


    @Resource
    private CodeValueMapper codeValueMapper;

    @Test
    public void insert() {
        Code code = new Code("行业信息");
        code.setCreatorId(1);
        codeMapper.insert(code);
    }


    @Test
    public void insertCodeValue() {
        CodeValue codeValue = new CodeValue();
        codeValue.setCodeId(1);
        codeValue.setName("互联网");
        codeValue.setDescription("互联网");
        codeValue.setCreatorId(1);


        codeValueMapper.insert(codeValue);
    }

    @Test
    public void findAll() {
        List<Code> codes = codeMapper.findAll();
        logger.info("size {}", codes.size());
    }

    @Test
    public void findDetailsById() {
        CodeDetails details = codeMapper.findDetailsById(1);
        logger.info("size {}", details);
    }
}
