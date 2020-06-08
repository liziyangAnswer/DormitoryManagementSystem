package com.lzy.domain;

import org.springframework.stereotype.Component;

/**
 * @author Answer
 * @description
 * @date 2020/04/09
 */
@Component
public class ResoutInfo {
    private Boolean flag;
    private String error_msg;
    private Object data;
    private Integer status;

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    public String getError_msg() {
        return error_msg;
    }

    public void setError_msg(String error_msg) {
        this.error_msg = error_msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
