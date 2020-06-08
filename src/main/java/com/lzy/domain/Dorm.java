package com.lzy.domain;

import java.io.Serializable;
/**
 * @author Answer
 * @description 宿舍楼实体类
 * @date 2020/04/04
 */
public class Dorm implements Serializable {
    private int dormid;
    private String dormname;
    private int rooms;

    public int getDormid() {
        return dormid;
    }

    public void setDormid(int dormid) {
        this.dormid = dormid;
    }

    public String getDormname() {
        return dormname;
    }

    public void setDormname(String dormname) {
        this.dormname = dormname;
    }

    public int getRooms() {
        return rooms;
    }

    public void setRooms(int rooms) {
        this.rooms = rooms;
    }
}
