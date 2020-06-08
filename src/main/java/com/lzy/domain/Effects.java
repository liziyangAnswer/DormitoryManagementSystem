package com.lzy.domain;

import java.io.Serializable;
/**
 * @author Answer
 * @description 个人物品实体类
 * @date 2020/04/04
 */
public class Effects  implements Serializable {
    private int id;
    private String name;
    private String sno;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }
}
