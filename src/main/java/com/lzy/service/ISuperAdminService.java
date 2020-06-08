package com.lzy.service;


import com.lzy.domain.SuperAdmin;

/**
 * @author Answer
 * @description
 * @date 2020/05/05
 */
public interface ISuperAdminService {
    SuperAdmin findById(SuperAdmin superAdmin);
    void update(SuperAdmin superAdmin);
}
