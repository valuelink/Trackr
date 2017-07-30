package com.lockbur.trackr.test.utils;

import com.lockbur.trackr.utils.SecurityPasswordUtils;

/**
 * Created by wangkun23 on 2017/7/31.
 */
public class SecurityPasswordUtilsTest {
    public static void main(String[] args) {
        String passPhrase = SecurityPasswordUtils.getPassphrase("8990923576109879", "123456");

        boolean bool = SecurityPasswordUtils.matchPassphrase("72a4f0fc2cbabf16b1e88827179d3e55", "8990923576109879", "123456");
        System.out.println(bool);

        System.out.println(passPhrase);
    }
}
