package com.example.springboot.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

@Configuration
@EnableSwagger2WebMvc
public class Knife4jConfiguration {

    @Bean(value = "dockerBean")
    public Docket dockerBean() {
        //指定使用Swagger2规范
        Docket docket = new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(new ApiInfoBuilder()
                        //描述字段支持Markdown语法
                        .title("图书管理系统接口文档")
                        .description("# Knife4j RESTful APIs")
                        .termsOfServiceUrl("https://www.spring.io")
                        .contact(new Contact("ZhaiJinPei", "https://github.com/ZhaiJinPei/library-management-system", "2145619745@qq.com"))
                        .version("1.0.1").license("Apache 2.0").licenseUrl("http://www.apache.org/licenses/LICENSE-2.0.html")
                        .build())
                //分组名称
                .groupName("api")
                .select()
                //这里指定Controller扫描包路径
                .apis(RequestHandlerSelectors.basePackage("com.example.springboot"))
                .paths(PathSelectors.any())
                .build();
        return docket;
    }
}
