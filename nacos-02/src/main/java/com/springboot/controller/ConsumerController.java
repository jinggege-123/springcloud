package com.springboot.controller;

import com.springboot.config.OpenFeignService;
import com.springboot.pojo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @author hewei
 * @date 2022/6/16 15:43
 **/
@RestController
@RequestMapping("/consumer")
public class ConsumerController {


    @Autowired
    private OpenFeignService openFeignService;

    @GetMapping("/get/{id}")
    public String consumer(@PathVariable Integer id){
        return  openFeignService.get(id);
    }

    @GetMapping("/post1")
    public String post(){
        HashMap<String, String> map = new HashMap<>();
        map.put("id", "21");
        map.put("name", "qwer");
        return openFeignService.post(map);
    }


    @GetMapping("/order")
    public Order getOrder(){

        Order order = new Order(1, "liangjing");
        return openFeignService.getOrder(order);
    }



}
