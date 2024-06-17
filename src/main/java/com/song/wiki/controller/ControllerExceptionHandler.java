package com.song.wiki.controller;


import com.song.wiki.exception.BusinessException;
import com.song.wiki.utils.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 统一异常处理、数据预处理等
 */
@ControllerAdvice
public class ControllerExceptionHandler {

    private static final Logger LOG = LoggerFactory.getLogger(ControllerExceptionHandler.class);

    /**
     * 校验异常统一处理
     */
    @ExceptionHandler(value = BindException.class)
    @ResponseBody
    public Result validExceptionHandler(BindException e) {
        Result Result = new Result();
        LOG.warn("参数校验失败：{}", e.getBindingResult().getAllErrors().get(0).getDefaultMessage());
        Result.setSuccess(false);
        Result.setMessage(e.getBindingResult().getAllErrors().get(0).getDefaultMessage());
        return Result;
    }

    /**
     * 校验异常统一处理
     * @param e
     * @return
     */
    @ExceptionHandler(value = BusinessException.class)
    @ResponseBody
    public Result validExceptionHandler(BusinessException e) {
        Result result = new Result();
        LOG.warn("业务异常：{}", e.getCode().getDesc());
        result.setSuccess(false);
        result.setMessage(e.getCode().getDesc());
        return result;
    }

    /**
     * 校验异常统一处理
     * @param e
     * @return
     */
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Result validExceptionHandler(Exception e) {
        Result result = new Result();
        LOG.error("系统异常：", e);
        result.setSuccess(false);
        result.setMessage("系统出现异常，请联系管理员");
        return result;
    }
}