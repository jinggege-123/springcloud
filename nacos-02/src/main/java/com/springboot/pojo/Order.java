package com.springboot.pojo;

/**
 * @author hewei
 * @date 2022/6/17 15:44
 **/
public class Order {
    private  Integer id;
    private String name;

    public Order(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Order() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
