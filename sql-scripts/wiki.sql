/*
 Navicat Premium Data Transfer

 Source Server         : song
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : localhost:3306
 Source Schema         : wiki

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 25/06/2024 17:15:08
*/
CREATE DATABASE wiki;

create table test
(
    id int,
    name varchar(255) not null,
    password varchar(255) not null
);

create unique index test_id_uindex
    on test (id);

alter table test
    add constraint test_pk
        primary key (id);

alter table test modify id int auto_increment;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;



-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `parent` bigint(20) NOT NULL DEFAULT 0 COMMENT '父id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (100, 0, 'Frontend', 100);
INSERT INTO `category` VALUES (101, 100, 'Vue', 101);
INSERT INTO `category` VALUES (102, 100, 'HTML & CSS', 102);
INSERT INTO `category` VALUES (200, 0, 'Java', 200);
INSERT INTO `category` VALUES (201, 200, 'Basic', 201);
INSERT INTO `category` VALUES (202, 200, 'Framework', 202);
INSERT INTO `category` VALUES (300, 0, 'Python', 300);
INSERT INTO `category` VALUES (301, 300, 'Basic', 301);
INSERT INTO `category` VALUES (302, 300, 'Advanced', 302);
INSERT INTO `category` VALUES (400, 0, 'DataBase', 400);
INSERT INTO `category` VALUES (401, 400, 'MySQL', 401);
INSERT INTO `category` VALUES (500, 0, 'Others', 500);
INSERT INTO `category` VALUES (501, 500, 'Server', 501);
INSERT INTO `category` VALUES (502, 500, 'Tools', 502);
INSERT INTO `category` VALUES (459026297188913152, 0, 'God\'s word', 600);
INSERT INTO `category` VALUES (459026376289292288, 459026297188913152, 'Bible', NULL);
INSERT INTO `category` VALUES (459026459713998849, 459026297188913152, 'BoM', NULL);

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`  (
  `id` bigint(20) NOT NULL COMMENT '文档id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档内容' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES (1, '');
INSERT INTO `content` VALUES (2, '<h2>Spring Boot Interview Questions for Freshers</h2><h3>1.&nbsp;<b><strong>What is Spring Boot?</strong></b></h3><h3><p>Spring Boot is built on the top of Spring framework to create stand-alone RESTful web application with very minimal configuration and there is no need of external servers to run the application, because it has embedded servers like Tomcat and Jetty etc.</p><ul><li>Spring Boot framework is independent.</li><li>It creates executable spring applications that are production-grade.</li></ul><p><b><strong>To know more about Spring Boot, refer to this article</strong></b>&nbsp;–&nbsp;<a href=\"https://www.geeksforgeeks.org/introduction-to-spring-boot\">Introduction to Spring Boot</a></p></h3><h3>2. What are the Features of Spring Boot?</h3><h3><p>There are many useful features of Spring Boot. Some of them are mentioned below:</p><ul><li><b><strong>Auto-configuration –</strong></b>&nbsp;Spring Boot automatically configures dependencies by using&nbsp;<b><strong>@EnableAutoconfiguration</strong></b>&nbsp;annotation and reduces boilerplate code.</li><li><b><strong>Spring Boot Starter POM</strong></b>&nbsp;– These Starter POMs are pre-configured dependencies for functions like database, security, maven configuration etc.</li><li><b><strong>Spring Boot CLI (Command Line Interface)</strong></b>&nbsp;– This command line tool is generally for managing dependencies, creating projects and running the applications.</li><li><b><strong>Actuator –&nbsp;</strong></b>Spring Boot Actuator provides health check, metrics and monitors the endpoints of the application. It also simplifies the troubleshooting management.</li><li><b><strong>Embedded Servers –&nbsp;</strong></b>Spring Boot contains embedded servers like Tomcat and Jetty for quick application run. No need of external servers.</li><li><img src=\"https://media.geeksforgeeks.org/wp-content/uploads/20231222123536/Spring-Boot-Interview-Questions--2-660.png\" alt=\"Features of Spring Boot\"/><br/></li></ul></h3><h3>3.&nbsp;<b><strong>What are the advantages of using Spring Boot?</strong></b></h3><h3><div><p>Spring Boot is a framework that creates stand-alone, production grade Spring based applications. So, this framework has so many advantages.</p><ul><li><b><strong>Easy to use:&nbsp;&nbsp;</strong></b>The majority of the boilerplate code required to create a Spring application is reduced by Spring Boot.</li><li><b><strong>Rapid Development:&nbsp;</strong></b>Spring Boot’s opinionated approach and auto-configuration enable developers to quickly develop apps without the need for time-consuming setup, cutting down on development time.</li><li><b><strong>Scalable:&nbsp;</strong></b>Spring Boot apps are intended to be scalable. This implies they may be simply scaled up or down to match your application’s needs.</li><li><b><strong>Production-ready:</strong></b>&nbsp;Metrics, health checks, and externalized configuration are just a few of the features that Spring Boot includes and are designed for use in production environments.</li></ul></div></h3><h3>4. Define the Key Components of Spring Boot.</h3><h3><div><p>The key components of Spring Boot are listed below:</p><ul><li>Spring Boot starters</li><li>Auto-configuration</li><li>Spring Boot Actuator</li><li>Spring Boot CLI</li><li>Embedded Servers</li></ul></div></h3><h3>5.&nbsp;<b><strong>Why do we prefer Spring Boot over Spring?</strong></b></h3><h3><div><p>Here is a table that summarizes why we use Spring Boot over Spring framework.</p><table><thead><tr><th><p><b><strong>Feature</strong></b></p></th><th><p><b><strong>Spring</strong></b></p></th><th><p><b><strong>Spring Boot</strong></b></p></th></tr></thead><tbody><tr><th><p><b><strong>Ease of use</strong></b></p></th><td><p>More complex</p></td><td><p>Easier</p></td></tr><tr><th><p><b><strong>Production readiness</strong></b></p></th><td><p>Less production-ready</p></td><td><p>More production-ready</p></td></tr><tr><th><p><b><strong>Scalability</strong></b></p></th><td><p>Less scalable</p></td><td><p>More scalable</p></td></tr><tr><th><p><b><strong>Speed</strong></b></p></th><td><p>Slower</p></td><td><p>Faster</p></td></tr><tr><th>Customization</th><td>Less Customizable</td><td>More Customizable</td></tr></tbody></table><p><b><strong>To know more, refer to the article –&nbsp;</strong></b><a href=\"https://www.geeksforgeeks.org/difference-between-spring-and-spring-boot\"><b><strong>Difference between Spring and Spring Boot</strong></b></a></p></div></h3><h3>6.&nbsp;<b><strong>Explain the internal working of Spring Boot.</strong></b></h3><h3><div><p><b><strong>Here are the main steps involved in how Spring Boot works:</strong></b></p><ul><li>Start by creating a new Spring Boot project.</li><li>Add the necessary dependencies to your project.</li><li>Annotate the application with the appropriate annotations.</li><li>Run the application.</li></ul><p><b><strong>To know more about internal working of spring boot application, refer to this article –&nbsp;</strong></b><a href=\"https://www.geeksforgeeks.org/how-spring-boot-application-works-internally\">How Spring Boot Application works Internally?</a></p></div></h3><h3>7. What are the Spring Boot Starter Dependencies?</h3><h3><div><p>Spring Boot provides many starter dependencies. Some of them which are used the most in the Spring Boot application are listed below:</p><ul><li>Data JPA starter</li><li>Web starter</li><li>Security starter</li><li>Test Starter</li><li>Thymeleaf starter</li></ul></div></h3><h3>8.&nbsp;<b><strong>How does a spring application get started?</strong></b></h3><h3><div><p>A Spring application gets started by calling the&nbsp;<b><strong>main()</strong></b>&nbsp;method with&nbsp;<b><strong>@SpringBootApplication&nbsp;</strong></b>annotation in the&nbsp;<b><strong>SpringApplication</strong></b>&nbsp;class. This method takes a SpringApplicationBuilder object as a parameter, which is used to configure the application.</p><ul><li>Once the SpringApplication object is created, the&nbsp;<b><strong>run()</strong></b>&nbsp;method is called.</li><li>Once the application context is initialized, the run() method starts the application’s embedded web server.</li></ul><div><pre><code class=\"Bash\">import org.springframework.boot.SpringApplication; \nimport org.springframework.boot.autoconfigure.SpringBootApplication;\n@SpringBootApplication\npublic class MyApplication \n{ \n  public static void main(String[] args) {\n    SpringApplication.run(MyApplication.class, args);\n  }\n}\n</code></pre></div></div></h3><h3>9. What does the @SpringBootApplication annotation do internally?</h3><p>The&nbsp;<b><strong>@SpringBootApplication</strong></b>&nbsp;annotation combines three annotations. Those three annotations are:&nbsp;<b><strong>@Configuration, @EnableAutoConfiguration,&nbsp;</strong></b>and&nbsp;<b><strong>@ComponentScan</strong></b>.</p><ul><li><b><strong>@AutoConfiguration</strong></b>: This annotation automatically configuring beans in the class path and automatically scans the dependencies according to the application need.</li><li><b><strong>@ComponentScan</strong></b>: This annotation scans the components (@Component, @Service, etc.) in the package of annotated class and its sub-packages.</li><li><b><strong>@Configuration:&nbsp;</strong></b>This annotation configures the beans and packages in the class path.</li></ul><p>@SpringBootApplication automatically configures the application based on the dependencies added during project creation and bootstraps the application by using run() method inside the main class of an application.</p><pre><code class=\"Bash\">@SpringBootApplication = @Configuration + @EnableAutoConfiguration + @ComponentScan</code></pre><h3>10. What is Spring Initializr?</h3><p><b><strong>Spring Initializer</strong></b>&nbsp;is a tool that helps us to create skeleton of spring boot project or project structure by providing a maven or gradle file to build the application. It set up the framework from scratch.</p><h3>11. What are Spring Boot CLI and the most used CLI commands?</h3><p><b><strong>Spring Boot CLI</strong></b>&nbsp;is a command-line tool that can be used to&nbsp;<b><strong>create, run,&nbsp;</strong></b>and<b><strong>&nbsp;manage</strong></b>&nbsp;Spring Boot applications. It is a powerful tool that can help us to get started with Spring Boot quickly and easily. It is built on top of the Groovy programming language.</p><p>Most used&nbsp;<b><strong>CLI commands</strong></b>&nbsp;are:</p><ul><li>-run</li><li>-test</li><li>-jar</li><li>-war</li><li>–init</li><li>-help</li></ul><h2>Spring Boot Interview Questions for Intermediate</h2><h3>12.&nbsp;<b><strong>What are the basic Spring Boot Annotations?</strong></b></h3><ul><li><b><strong>@SpringBootApplication:&nbsp;</strong></b>This is the main annotation used to bootstrap a Spring Boot application. It combines three annotations:&nbsp;<b><strong>@Configuration</strong></b>,&nbsp;<b><strong>@EnableAutoConfiguration</strong></b>, and&nbsp;<b><strong>@ComponentScan</strong></b>. It is typically placed on the main class of the application.</li><li><b><strong>@Configuration:</strong></b>&nbsp;This annotation is used to indicate that a class contains configuration methods for the application context. It is typically used in combination with @Bean annotations to define beans and their dependencies.</li><li><b><strong>@Component:</strong></b>&nbsp;This annotation is the most generic annotation for any Spring-managed component. It is used to mark a class as a Spring bean that will be managed by the Spring container.</li><li><b><strong>@RestController:&nbsp;</strong></b>This annotation is used to define a RESTful web service controller. It is a specialized version of the @Controller annotation that includes the @ResponseBody annotation by default.</li><li><b><strong>@RequestMapping:&nbsp;</strong></b>This annotation is used to map HTTP requests to a specific method in a controller. It can be applied at the class level to define a base URL for all methods in the class, or at the method level to specify a specific URL mapping.</li></ul>');

-- ----------------------------
-- Table structure for doc
-- ----------------------------
DROP TABLE IF EXISTS `doc`;
CREATE TABLE `doc`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `ebook_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '电子书id',
  `parent` bigint(20) NOT NULL DEFAULT 0 COMMENT '父id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '顺序',
  `view_count` int(11) NULL DEFAULT 0 COMMENT '阅读数',
  `vote_count` int(11) NULL DEFAULT 0 COMMENT '点赞数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc
-- ----------------------------
INSERT INTO `doc` VALUES (1, 1, 0, 'Interview Questions and Answers', 1, 16, 2);
INSERT INTO `doc` VALUES (2, 1, 1, 'Part 1', 1, 15, 1);

-- ----------------------------
-- Table structure for ebook
-- ----------------------------
DROP TABLE IF EXISTS `ebook`;
CREATE TABLE `ebook`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `category1_id` bigint(20) NULL DEFAULT NULL COMMENT '分类1',
  `category2_id` bigint(20) NULL DEFAULT NULL COMMENT '分类2',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `cover` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `doc_count` int(11) NOT NULL DEFAULT 0 COMMENT '文档数',
  `view_count` int(11) NOT NULL DEFAULT 0 COMMENT '阅读数',
  `vote_count` int(11) NOT NULL DEFAULT 0 COMMENT '点赞数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电子书' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ebook
-- ----------------------------
INSERT INTO `ebook` VALUES (1, 'Spring Boot Tutorial', 200, 202, 'Spring Boot is a framework that simplifies the creation of stand-alone, production-grade Spring-based applications with minimal configuration.', NULL, 2, 31, 3);
INSERT INTO `ebook` VALUES (2, 'Vue Tutorial', 100, 101, '\nVue is a progressive JavaScript framework used for building user interfaces and single-page applications.', NULL, 0, 0, 0);
INSERT INTO `ebook` VALUES (3, 'Python Tutorial', 300, 301, 'Python is a versatile, high-level programming language known for its simplicity, readability, and broad applicability in web development, data analysis, artificial intelligence, and more.', NULL, 0, 0, 0);
INSERT INTO `ebook` VALUES (4, 'Mysql Tutorial', 400, 401, 'MySQL is a popular open-source relational database management system known for its reliability, performance, and ease of use.', NULL, 0, 0, 0);
INSERT INTO `ebook` VALUES (5, 'Oracle Tutorial', 500, 502, 'Oracle is a robust, scalable, and secure enterprise-grade relational database management system widely used for handling critical data and applications.', NULL, 0, 0, 0);

-- ----------------------------
-- Table structure for ebook_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `ebook_snapshot`;
CREATE TABLE `ebook_snapshot`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ebook_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '电子书id',
  `date` date NOT NULL COMMENT '快照日期',
  `view_count` int(11) NOT NULL DEFAULT 0 COMMENT '阅读数',
  `vote_count` int(11) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `view_increase` int(11) NOT NULL DEFAULT 0 COMMENT '阅读增长',
  `vote_increase` int(11) NOT NULL DEFAULT 0 COMMENT '点赞增长',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ebook_id_date_unique`(`ebook_id`, `date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电子书快照表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ebook_snapshot
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登陆名',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name_unique`(`login_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'test', 'song', 'e70e2222a9d67c4f2eae107533359aa4');

SET FOREIGN_KEY_CHECKS = 1;
