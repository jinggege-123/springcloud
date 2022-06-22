package com.springboot.config;

import feign.Contract;
import feign.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author hewei
 * @date 2022/6/17 16:22
 **/
@Configuration
public class OpenfeignConfig {

    @Bean
    Logger.Level feigbnLoggerLevel(){
        return Logger.Level.BASIC;
    }

    /**
      * 修改契约配置，支持Feign原生的注解
      * @return
      */
//   @Bean
    public Contract feignContract(){
        return new Contract.Default();
    }



}
