package com.springboot.config;

import com.springboot.pojo.Order;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class StockFeignServiceFallbackFactory implements FallbackFactory<OpenFeignService> {
    @Override
    public OpenFeignService create(Throwable throwable) {
        return new OpenFeignService() {
            @Override
            public String get(Integer id) {
                return "降级了";
            }

            @Override
            public String post(Map<String, String> map) {
                return "降级了";
            }

            @Override
            public Order getOrder(Order order) {
                return null;
            }
        };
    }
}
