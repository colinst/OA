package com.oa.util;


import com.oa.model.Page;

import java.util.Date;

public class PageControlUtil {
    /*public static void setAllPage(Page page) {
        if(page.getAllCount()%page.getPageSize()==0){
            page.setAllPage(page.getAllCount()/page.getPageSize());
        }else {
            page.setAllPage(page.getAllCount()/page.getPageSize()+1);
        }
    }*/
    public static void setTimeAndstart(Page page, Date date) {
        page.setStart(page.getCurrentPage() * page.getCount());
        page.setCreatetime(new DateFormatUtil().getCreatetime(date));

    }

    public static void setCurrentpage(Page page, String currentPage, String jumpPage) {
        if (currentPage != null) {
            int i = Integer.parseInt(currentPage);
            if (i <= 0) {
                page.setCurrentPage(0);
            } else if (i >= page.getAllPage()) {
                page.setCurrentPage(page.getAllPage() - 1);
            } else {
                page.setCurrentPage(i);
            }
        }
        if (jumpPage != null && !jumpPage.equals("")) {
            int i = Integer.parseInt(jumpPage) - 1;
            if (i <= 0) {
                page.setCurrentPage(0);
            } else if (i >= page.getAllPage()) {
                page.setCurrentPage(page.getAllPage() - 1);
            } else {
                page.setCurrentPage(i);
            }
        }
        page.setStart(page.getCurrentPage() * page.getCount());

    }
}
