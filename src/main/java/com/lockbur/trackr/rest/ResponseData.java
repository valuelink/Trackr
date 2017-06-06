package com.lockbur.trackr.rest;

import com.lockbur.trackr.enums.RestStatus;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 用户ajax提交之后的相应结果
 * <p>
 * Created by wangkun23 on 2017/6/2.
 */
public class ResponseData implements Serializable {

    /**
     * 响应状态
     */
    private RestStatus status;

    /**
     * 消息code
     */
    private String code;

    /**
     * 错误提示
     */
    private String error;

    /**
     * 结果数据
     * 如果返回对象或数组直接用setData
     * 如果返回简单的键值对用addData
     */
    private Object data;
    private Map<String, Object> dataShadow;

    public ResponseData() {

    }

    public ResponseData(RestStatus status, String code) {
        this.status = status;
        this.code = code;
    }

    public ResponseData(RestStatus status, String code, String error) {
        this.status = status;
        this.code = code;
        this.error = error;
    }

    /**
     * 返回成功
     *
     * @return
     */
    public static ResponseData success() {
        return new ResponseData(RestStatus.SUCCESS, "200");
    }

    /**
     * 返回成功消息
     *
     * @param code 消息code
     * @return 成功消息
     */
    public static ResponseData success(String code) {
        return new ResponseData(RestStatus.SUCCESS, code);
    }

    /**
     * 返回警告消息
     *
     * @param code 消息code
     * @return 警告消息
     */
    public static ResponseData warn(String code) {
        return new ResponseData(RestStatus.WARN, code);
    }

    /**
     * 返回错误
     *
     * @return
     */
    public static ResponseData error() {
        return new ResponseData(RestStatus.ERROR, "500");
    }

    /**
     * 返回错误消息
     *
     * @param code 消息code
     * @return 错误消息
     */
    public static ResponseData error(String code) {
        return new ResponseData(RestStatus.ERROR, code);
    }

    /**
     * 返回错误消息
     *
     * @param code 消息code
     * @return 错误消息
     */
    public static ResponseData error(String code, String error) {
        return new ResponseData(RestStatus.ERROR, code, error);
    }

    /**
     * 获取响应状态
     *
     * @return 响应状态
     */
    public RestStatus getStatus() {
        return status;
    }

    /**
     * 设置响应状态
     *
     * @param status 响应状态
     */
    public void setStatus(RestStatus status) {
        this.status = status;
    }

    /**
     * 获取消息code
     *
     * @return 消息code
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置消息code
     *
     * @param code 消息code
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 获取消息提示
     *
     * @return 消息error
     */
    public String getError() {
        return error;
    }

    /**
     * 设置消息提示
     *
     * @param error
     */
    public void setError(String error) {
        this.error = error;
    }

    /**
     * @return
     */
    public Object getData() {
        return data;
    }

    /**
     * @param data
     */
    public void setData(Object data) {
        this.data = data;
    }

    /**
     * @param key
     * @param value
     */
    public void addData(String key, Object value) {
        if (this.dataShadow == null) {
            this.dataShadow = new LinkedHashMap<String, Object>();

            this.data = this.dataShadow;
        }
        this.dataShadow.put(key, value);
    }

    /**
     * @param key
     * @return
     */
    public Object removeData(String key) {
        return this.dataShadow != null ? this.dataShadow.remove(key) : null;
    }
}
