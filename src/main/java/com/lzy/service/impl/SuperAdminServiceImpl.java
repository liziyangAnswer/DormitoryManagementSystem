package com.lzy.service.impl;

import com.lzy.dao.ISuperAdminDao;
import com.lzy.domain.SuperAdmin;
import com.lzy.service.ISuperAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Answer
 * @description
 * @date 2020/05/05
 */
@Service("superAdminService")
public class SuperAdminServiceImpl implements ISuperAdminService {
    @Autowired
    private ISuperAdminDao superAdminDao;
    @Override
    public SuperAdmin findById(SuperAdmin superAdmin) {
        return superAdminDao.findById(superAdmin);

    }
    @Override
    public void update(SuperAdmin superAdmin) {
         superAdminDao.update(superAdmin);
    }
}
