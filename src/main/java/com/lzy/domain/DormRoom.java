package com.lzy.domain;

import java.io.Serializable;
/**
 * @author Answer
 * @description 宿舍房间实体类
 * @date 2020/04/04
 */
public class DormRoom implements Serializable {
    private int roomid;
    private String roomname;
    private int beds;
    private int stunum;
    private int dormid;

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    public int getBeds() {
        return beds;
    }

    public void setBeds(int beds) {
        this.beds = beds;
    }

    public int getStunum() {
        return stunum;
    }

    public void setStunum(int stunum) {
        this.stunum = stunum;
    }

    public int getDormid() {
        return dormid;
    }

    public void setDormid(int dormid) {
        this.dormid = dormid;
    }
}
