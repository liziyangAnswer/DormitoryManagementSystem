package com.lzy.service.impl;

import com.lzy.dao.IAnnouncementDao;
import com.lzy.domain.Announcement;
import com.lzy.domain.PageBean;
import com.lzy.domain.Student;
import com.lzy.service.IAnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Answer
 * @description
 * @date 2020/05/09
 */
@Service("announcementService")
public class AnnouncementServiceImpl implements IAnnouncementService {
    @Autowired
    private IAnnouncementDao announcementDao;
    @Override
    public void insert(Announcement announcement) {
        announcementDao.insert(announcement);
    }

    @Override
    public PageBean<Announcement> findUserByPage(String _currentPage, String _rows, String title, String author) {
        int currentPage = Integer.parseInt(_currentPage);
        System.out.println("开始查总数");
        int total  = announcementDao.findAll(title,author);
        System.out.println("查询到的总数"+total);
        int rows = Integer.parseInt(_rows);
        int totalPages = total % rows == 0 ? total/rows : total/rows + 1;
        if(currentPage<=1 || currentPage>totalPages)
            currentPage = 1;
        PageBean<Announcement> pb = new PageBean<>();
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        pb.setTotalCounts(total);

        pb.setTotalPages(totalPages);
        int start = (currentPage - 1)*rows;
        List<Announcement> list = announcementDao.findByPage(start,rows,title,author);
        pb.setList(list);
        return pb;
    }

    @Override
    public Announcement findById(Announcement announcement) {
        Announcement byId = announcementDao.findById(announcement);
        return byId;
    }
}
