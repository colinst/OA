package com.oa.model;

import java.util.List;


public class Page {
    private int currentPage;
    private int allPage;
    private int start;
    private int count = 6;
    private int allCount;
    private List pageMessage;
    private String createtime;

    public Page() {
    }

    public Page(int getCount) {
        allCount = getCount;
        if (allCount % count == 0) {
            allPage = allCount / count;
        } else {
            allPage = allCount / count + 1;
        }


    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getAllPage() {
        return allPage;
    }

    public void setAllPage(int allPage) {
        this.allPage = allPage;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getAllCount() {
        return allCount;
    }

    public void setAllCount(int allCount) {
        this.allCount = allCount;
    }

    public List getPageMessage() {
        return pageMessage;
    }

    public void setPageMessage(List pageMessage) {
        this.pageMessage = pageMessage;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }
}
