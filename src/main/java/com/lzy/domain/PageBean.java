package com.lzy.domain;

import java.util.List;

/**
 * @author Answer
 * @description
 * @date 2020/05/05
 */
public class PageBean<T> {
    private int currentPage;//当前页
    private int rows;//每页显示条数
    private int totalCounts;//总条数
    private int totalPages;//总页数
    private List<T> list;//页中数据

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getTotalCounts() {
        return totalCounts;
    }

    public void setTotalCounts(int totalCounts) {
        this.totalCounts = totalCounts;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "currentPage=" + currentPage +
                ", rows=" + rows +
                ", totalCounts=" + totalCounts +
                ", totalPages=" + totalPages +
                ", list=" + list +
                '}';
    }
}
