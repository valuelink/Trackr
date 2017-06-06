package com.lockbur.trackr.test.mapper;

import com.lockbur.trackr.domain.Authority;
import com.lockbur.trackr.enums.AuthorityType;
import com.lockbur.trackr.mapper.AuthorityMapper;
import com.lockbur.trackr.test.TestBase;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wangkun23 on 2016/12/2.
 */
public class AuthorityMapperTest extends TestBase {
    private final Logger LOGGER = LoggerFactory.getLogger(getClass());

    @Resource
    private AuthorityMapper authorityMapper;

    @Test
    public void insert() {
        Authority authority = new Authority();
        authority.setType(AuthorityType.ROLE);
        authority.setTypeId(1);
        authority.setAuthority("ROLE_USER");
        authority.setCreatorId(1);
        authorityMapper.insert(authority);
    }

    @Test
    public void findAuthorityByRole() {
        List ins = new ArrayList<>();
        ins.add(1);
        //ins.add(2);
        List<String> list = authorityMapper.findAuthorityByRoles(ins);

        LOGGER.info("size {}", list.size());
    }

}
