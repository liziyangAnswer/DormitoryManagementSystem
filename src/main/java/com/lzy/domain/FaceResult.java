package com.lzy.domain;

/**
 * @author Answer
 * @description
 * @date 2020/05/10
 */
public class FaceResult {
    private String msg;
    private Boolean flag;
    private String name;
    private String roomId;
    private String inRoom;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getInRoom() {
        return inRoom;
    }

    public void setInRoom(String inRoom) {
        this.inRoom = inRoom;
    }
}
