package com.springcloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class Nacos01Application {

    public static void main(String[] args) {
        SpringApplication.run(Nacos01Application.class, args);
    }

}
