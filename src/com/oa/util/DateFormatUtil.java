package com.oa.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.SimpleFormatter;

import javassist.expr.NewArray;

/**
 * @author 方升群
 * @createTime:2017年7月6日
 * @context：时间类
 */
public class DateFormatUtil {
    //获得日期   如：2016-01-01
    Date date = new Date();

    public String getDate() {
        return new SimpleDateFormat("YYYY-MM-dd").format(date);
    }

    //获得时间   如：2016-01-01 10:00:00
    public String getTime() {
        return new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").format(date);
    }

    public String getCreatetime(Date date1) {
        return new SimpleDateFormat("YYYY-MM-dd").format(date1);
    }
}

