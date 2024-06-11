package com.song.wiki.controller;

import com.song.wiki.domain.Test;
import com.song.wiki.service.TestService;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TestController {
    @Value("${test.hello:TEST}")
    private String testHello;

    @RequestMapping("/hello")
    public String hello() {
        return "Hello World!" + testHello;
    }

    @Resource
    private TestService testService;

    @RequestMapping("/test/list")
    public List<Test> list() {
        return testService.list();
    }
}
