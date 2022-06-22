package com.springboot.config;

import com.springboot.pojo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * contextId： 唯一标识
 * value：  服务名
 * path： 控制层主路由
 * */
@Configuration
@FeignClient(contextId = "prod1", value = "nacos-01" ,path="product" ,configuration = OpenfeignConfig.class, fallbackFactory = StockFeignServiceFallbackFactory.class)
public interface OpenFeignService {



    @GetMapping("/get/{id}")
     String get(@PathVariable Integer id);

    @PostMapping("/post1")
     String post(@RequestParam Map<String ,String > map);

    @PostMapping("/order")
     Order getOrder(@RequestBody Order order);
}
