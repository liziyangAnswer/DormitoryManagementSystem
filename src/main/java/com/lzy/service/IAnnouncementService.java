package com.lzy.service;

import com.lzy.domain.Announcement;
import com.lzy.domain.PageBean;

/**
 * @author Answer
 * @description
 * @date 2020/05/09
 */
public interface IAnnouncementService {
    void insert(Announcement announcement);

    PageBean<Announcement> findUserByPage(String currentPage, String rows, String title, String author);

    Announcement findById(Announcement announcement);
}
