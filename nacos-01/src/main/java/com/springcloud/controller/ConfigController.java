package com.springcloud.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author hewei
 * @date 2022/6/17 10:25
 **/

@RestController
@RefreshScope
@RequestMapping("/config")
public class ConfigController {

    @Value("${order.title}")
    private String orderTitle;



    @GetMapping("/get")
    public String get(){
        return "order config+"+orderTitle;
    }





}
