package com.lockbur.trackr.test.utils;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by wangkun23 on 2016/7/14.
 */
public class DateUtilsTest {
    private static final Logger LOGGER = LoggerFactory.getLogger(DateUtilsTest.class);

    public static void main(String[] args) {

        Long start = System.currentTimeMillis();

        LOGGER.info("total time {}", System.currentTimeMillis() - start);
    }


    private void test1() {
        for (int i = 1; i < 100000; i++) {
            Date df_end;
            try {
                df_end = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2016-03-17 17:44:42");
                //df_end = DateUtils.parseDate("2016-03-17 17:44:42");
                LOGGER.info("df_end {}", df_end);
                // new SimpleDateFormat  message:total time 4753

                // 共享 new SimpleDateFormat  message:total time 4482
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
    }

    private void test2() {
        for (int i = 1; i < 100000; i++) {
            DateTime dateTime=new DateTime("2016-03-17 17:44:42");

            LOGGER.info("df_end {}", dateTime.toString("yyyy-MM-dd HH:mm:ss"));
        }
    }


}
