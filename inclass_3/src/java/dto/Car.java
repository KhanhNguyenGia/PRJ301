/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author jerry
 */
public class Car {
    private String id;
    private String name;
    private String description;
    private float price;
    private int speed;
    private boolean status;
    
        public Car() {
        this.id = "";
        this.name = "";
        this.description = "";
        this.price = -1;
        this.speed = -1;
        this.status = false;
    }

    public Car(String id, String name, String description, float price, int speed, boolean status) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.speed = speed;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
