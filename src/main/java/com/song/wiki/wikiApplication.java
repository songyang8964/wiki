package com.song.wiki;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import springfox.documentation.oas.annotations.EnableOpenApi;


@SpringBootApplication
@MapperScan("com.song.wiki.mapper")
@EnableOpenApi
@EnableScheduling
@EnableAsync
public class wikiApplication {

    private static final Logger LOG = LoggerFactory.getLogger(wikiApplication.class);

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(wikiApplication.class);
        Environment env = app.run(args).getEnvironment();
        LOG.info("启动成功！！");
        LOG.info("地址: \thttp://127.0.0.1:{}", env.getProperty("server.port"));
    }
}
