package com.lzy.domain;

/**
 * @author Answer
 * @description 宿管
 * @date 2020/04/09
 */
public class Admin {
    private String sno;
    private String password;
    private String roomid;
    private String inroom;
    private String photo;
    private String tel;
    private String name;

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoomid() {
        return roomid;
    }

    public void setRoomid(String roomid) {
        this.roomid = roomid;
    }

    public String getInroom() {
        return inroom;
    }

    public void setInroom(String inroom) {
        this.inroom = inroom;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
