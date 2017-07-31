package com.lockbur.trackr.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Set;

/**
 * Created by wangkun23 on 2017/4/25.
 */
@ToString
public class DictDetails extends DictType {

    @Getter
    @Setter
    private Set<Dict> dicts;
}
