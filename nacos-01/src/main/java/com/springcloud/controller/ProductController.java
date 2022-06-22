package com.springcloud.controller;

import com.springcloud.pojo.Order;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @author hewei
 * @date 2022/6/16 15:44
 **/

@RestController
@RequestMapping("product")
public class ProductController {
    @Value("${server.port}")
    private String port;

    @GetMapping("/get/{id}")
    public String get(@PathVariable Integer id){
//        try {
//            TimeUnit.SECONDS.sleep(5000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
        return "hello world "+id+port ;
    }

    @PostMapping("/post1")
    public String post(@RequestParam Map<String ,String > map){
        String s1 = map.get("id");
        String s2 = map.get("name");
        return s1+s2+port;
    }


    @PostMapping("/order")
    public Order getOrder(@RequestBody Order order){
        try {
            TimeUnit.SECONDS.sleep(3);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        order.setName(order.getName()+"!!!");
        return order;
    }


}
