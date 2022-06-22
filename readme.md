# 项目搭建
## 1、父maven项目搭建
### 1、引入依赖
~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.3.2.RELEASE</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <groupId>com.springboot</groupId>
    <artifactId>springcloud</artifactId>
    <packaging>pom</packaging>
    <version>1.0-SNAPSHOT</version>
    <modules>
        <module>nacos-01</module>
        <module>nacos-02</module>
        <module>gateway-demo</module>

    </modules>
    <properties>
        <spring-boot.version>2.3.2.RELEASE</spring-boot.version>
        <spring-cloud.version>Hoxton.SR9</spring-cloud.version>
        <spring-cloud-alibaba.version>2.2.5.RELEASE</spring-cloud-alibaba.version>
        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>
    </properties>

    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-dependencies</artifactId>
                <version>${spring-boot.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <dependency>
                <groupId>com.alibaba.cloud</groupId>
                <artifactId>spring-cloud-alibaba-dependencies</artifactId>
                <version>${spring-cloud-alibaba.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-dependencies</artifactId>
                <version>${spring-cloud.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>
</project>
~~~
##2、子项目搭建
 - 创建springboot项目，添加web依赖
 - 父项目添加 
 ~~~xml
  <modules>
     <module>nacos-01</module>
                <module>nacos-02</module>
                <module>gateway-demo</module>
            </modules>
~~~

#1、Nacos

## 1、引入依赖
~~~xml
 <dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-alibaba-nacos-discovery</artifactId>
</dependency>
~~~
## 2、启动类添加注解
~~~java
@EnableDiscoveryClient
~~~
## 3、搭建nacos集群
- 创建nacos数据库
~~~text
创建nacos数据库
运行conf/nacos-mysql.sql
~~~
- 编辑conf/application.properties
~~~properties
### 端口
 server.port=8848
### 数据库
 spring.datasource.platform=mysql
 db.num=1
 db.url=jdbc:mysql://11.101.4.116:3306/nacos?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useUnicode=true&useSSL=false&serverTimezone=UTC
 db.user=root
 db.password=123456
~~~
- 编辑集群配置文件cluster.conf
~~~text
11.101.4.116:8848
11.101.4.116:8850
11.101.4.116:8852
~~~
## 4、编辑yml配置文件
~~~yaml
server:
  port: 8085
spring:
  application:
    name: nacos-02
  main:
    allow-bean-definition-overriding: true

  cloud:
    nacos:
      discovery:
        server-addr: 11.101.4.116:8848,11.101.4.116:8850,11.101.4.116:8852
~~~

#2、nacos-config
##1、引入依赖
~~~xml
 <dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-alibaba-nacos-config</artifactId>
</dependency>
~~~
## 2、配置文件必须是bootstrap.yml
~~~yaml
spring:
  cloud:
    nacos:
      config:
        server-addr: 11.101.4.116:8848,11.101.4.116:8850,11.101.4.116:8852
#配置文件格式后缀        
        file-extension: yaml
# 指定配置文件的命名空间        
        namespace: 0d8c0105-8d08-4846-9426-ab1898c77bc1
#指定配置文件的分组        
        group: consumer-server
~~~
## 3、data id为项目名
spring.application.name  + spring.profiles.active . file-extension(后缀)

## 4、使用
- nacos添加配置
- java调用
~~~java
@Value("${order.number}")
    private String orderNum;
~~~

### 5、共享配置文件不同方式配置加载优先级：
~~~text
Nacos 配置中心目前提供以下三种配置能力从 Nacos 拉取相关的配置，当三种方式共同使用时，他们的一个优先级关系是:A < B < C：
- A：通过 spring.cloud.nacos.config.shared-configs[n].data-id 支持多个共享 Data Id 的配置
- B：通过 spring.cloud.nacos.config.extension-configs[n].data-id 的方式支持多个扩展 Data Id 的配置
- C：通过内部相关规则(spring.cloud.nacos.config.prefix、spring.cloud.nacos.config.file-extension、spring.cloud.nacos.config.group)自动生成相关的 Data Id 配置
~~~

# 3、Openfeign
## 1、引入依赖
~~~xml
 <dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-openfeign</artifactId>
</dependency>
~~~
##2、启动类添加注解
~~~java
@EnableFeignClients
~~~
##3、编写调用接口+@FeignClient
### 1、编写接口
~~~java
/**
 * contextId： 唯一标识
 * value：  服务名
 * path： 控制层主路由
 * */
@Configuration
@FeignClient(contextId = "prod1", value = "nacos-01" ,path="product" )
public interface OpenFeignService {

    @GetMapping("/get/{id}")
     String get(@PathVariable Integer id);

    @PostMapping("/post1")
     String post(@RequestParam Map<String ,String > map);

    @PostMapping("/order")
     Order getOrder(@RequestBody Order order);
}
~~~
### 2、调用
~~~java
  @Autowired
    private OpenFeignService openFeignService;

    @GetMapping("/get/{id}")
    public String consumer(@PathVariable Integer id){
        return  openFeignService.get(id);
    }
~~~
## 4、超时时间设置
~~~yaml
feign:
  client:
    config:
      default:
          connect-timeout: 5000
          read-timeout: 5000
~~~
## 5、日志设置
### 1、添加配置类
~~~java
@Configuration
public class OpenfeignConfig {

    @Bean
    Logger.Level feigbnLoggerLevel(){
        return Logger.Level.BASIC;
    }
}
~~~
### 2、添加日志级别
~~~properties
logging.level.com.zlp.feign.order.feign:debug
~~~



#4、Sentinel
##1、引入依赖
~~~xml
    <!-- sentinel-->
     <dependency>
         <groupId>com.alibaba.cloud</groupId>
         <artifactId>spring-cloud-starter-alibaba-sentinel</artifactId>
    </dependency>
     <!--加入actuator-->
    <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-actuator</artifactId>
    </dependency>
<!--        sentinel核心-->
    <dependency>
         <groupId>com.alibaba.csp</groupId>
         <artifactId>sentinel‐core</artifactId>
         <version>1.8.0</version>
    </dependency>
~~~

## 2、添加配置
~~~yaml
server:
  port: 8085
spring:
  application:
    name: nacos-02

  cloud:
    nacos:
      discovery:
        server-addr: 11.101.4.116:8848,11.101.4.116:8850,11.101.4.116:8852
    sentinel:
      transport:
        dashboard: localhost:8080
#默认 8719        
        port: 8720
## 暴露端点
## 为微服务设置 sentinel 控制台地址添加Sentinel后，需要暴露/actuator/sentinel端点,
#而Springboot默认是没有暴露该端点的，所以需要设置，
##测试 http://localhost:8085/actuator/sentinel
##查看流控规则
management:
  endpoints:
    web:
      exposure:
        include: '*'
~~~

## 3、流控
sentinel 控制台中设置流控规则
- 资源名:  接口的API  
- 针对来源:  默认是default，当多个微服务都调用这个资源时，可以配置微服务名来对指定的微服务设置阈值
- 阈值类型: 分为QPS和线程数 假设阈值为10
- QPS类型: 只得是每秒访问接口的次数>1就进行限流
- 线程数: 为接受请求该资源分配的线程数>1就进行限流
### QPS
复杂路径资源名前要加“/”
## 4、openFeign整合sentinel
对调用的接口进行处理，不是项目自身的接口
~~~yaml
feign:
#  openfeign整合sentinel
  sentinel:
    enabled: true
~~~
1、编写openfeign接口失败返回代码
~~~java

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
~~~
2、在feign接口上添加fallbackFactory属性
~~~java

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
~~~
##5、sentinel持久化模式
 | 推送方式 | 推送方式 | 优点 |  缺点 | 
 | :-----:| :----: | :----: | :----: |
 | 原始模式 | API 将规则推送至客户端并直接更新到内存中 ，扩展写数据源（WritableDataSource） | 简单，无任何依赖 | 不保证一致性；规则保存在内存中，重启即消失。严重不建议用于生产环境 |
 | Pull 模式 | 扩展写数据源（WritableDataSource）， 客户端主 动向某个规则管理中心定期轮询拉取规则，这个规则中心可以是 RDBMS、文件 等 | 简单，无任何依赖；规则持久化 |不保证一致性；实时性不保证，拉取过于频繁也可能会有性能问题。 |
 | Push 模式 | 扩展读数据源（ReadableDataSource），规则中心统一推送，客户端通过注册监听器的方式时刻监听变化，比如使用 Nacos、Zookeeper 等配置中心。这种方式有更好的实时性和一致性保证。生产环境下一般采用 push 模式的数据源。 | 规则持久化；一致性；快速  |引入第三方 |
###1、 基于nacos配置中心控制台实现推送
- 引入依赖
~~~xml
 <!--nacos 持久化-->
        <dependency>
            <groupId>com.alibaba.csp</groupId>
            <artifactId>sentinel-datasource-nacos</artifactId>
        </dependency>
~~~

- nacos添加配置

 1、data-id:my-sentinel-flow-rule
 2、格式json
~~~json
[
  {
    "clusterMode": false,
    "controlBehavior": 0,
    "count": 1.0,
    "grade": 1,
    "limitApp": "default",
    "maxQueueingTimeMs": 500,
    "resource": "sayHello",
    "strategy": 0,
    "warmUpPeriodSec": 10
  }
]
~~~
- 添加配置
~~~yaml
#sentinel config
    sentinel:
      transport:
        dashboard: localhost:8080
        port: 8720
#持久化        
      datasource:
        flow-rule: # 名字自定义
          nacos:
            server-addr: localhost:8850
            username: nacos
            password: nacos
            dataId: my-sentinel-flow-rule
            rule-type: flow
~~~
