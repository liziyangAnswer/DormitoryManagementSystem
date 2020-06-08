package com.lzy.domain;

import java.io.Serializable;
/**
 * @author Answer
 * @description 学生信息实体类
 * @date 2020/04/04
 */
public class Student implements Serializable {
    private String sno;
    private String name;
    private String password;
    private String tel;
    private String roomid;
    private String inroom;
    private String college;
    private String major;
    private String clase;
    private String gender;
    private String photo;

    public Student() {

    }

    public Student(String sno, String name, String password, String tel, String roomid, String inroom, String college, String major, String clase, String gender, String photo) {
        this.sno = sno;
        this.name = name;
        this.password = password;
        this.tel = tel;
        this.roomid = roomid;
        this.inroom = inroom;
        this.college = college;
        this.major = major;
        this.clase = clase;
        this.gender = gender;
        this.photo = photo;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
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

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getClase() {
        return clase;
    }

    public void setClase(String clase) {
        this.clase = clase;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Student{" +
                "sno='" + sno + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", tel='" + tel + '\'' +
                ", roomid='" + roomid + '\'' +
                ", inroom='" + inroom + '\'' +
                ", college='" + college + '\'' +
                ", major='" + major + '\'' +
                ", clase='" + clase + '\'' +
                ", gender='" + gender + '\'' +
                ", photo='" + photo + '\'' +
                '}';
    }
}
