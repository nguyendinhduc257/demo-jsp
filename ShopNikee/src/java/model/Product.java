/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LNA02
 */
public class Product {
    
    private int id;
    private String productName;
    private String price;
    private String des;
    private String image;


    public Product() {
    }

    public Product(int id, String productName, String price, String des, String image) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.des = des;
        this.image = image;
    }

    public Product( String productName, String price, String des, String image) {  
        this.productName = productName;
        this.price = price;
        this.des = des;
        this.image = image;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", productName=" + productName + ", price=" + price + ", des=" + des + ", image=" + image + '}';
    }

    
    
    
    
}
