/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dbcontext.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LNA02
 */
public class ProductDAO {

    public List<Product> getProducts() {
        List<Product> sl = new ArrayList<>();
        ConnectDB db = ConnectDB.getInstance();
        String sql = "Select * from productlist";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String productName = rs.getString(2);
                String price = rs.getString(3);
                String image = rs.getString(4);
                String des = rs.getString(5);
                Product product = new Product(id, productName, price, image, des);
                sl.add(product);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE,null, ex);
        }
        return sl;
    }

    public void addProduct(Product product) {
        // create sql for insert
        String sql = "Insert into productlist(productName, price,des, image) values (?,?,?,?);";
        ConnectDB db = ConnectDB.getInstance();

        Connection con;

        try {
            con = db.openConnection();
            try (PreparedStatement statement = con.prepareStatement(sql)) {
                statement.setString(1, product.getProductName());
                statement.setString(2, product.getPrice());
                statement.setString(3, product.getDes());
                statement.setString(4, product.getImage());
                
                
                statement.execute();
            }
            con.close();

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }


    public void updateProduct(Product product) {
        String sql = " UPDATE productlist\n" + "SET productName=?, price=?, des = ?, image = ?\n" + "WHERE id = ?";
        ConnectDB db = ConnectDB.getInstance();
        Connection con;
        try {
            con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, product.getProductName());
            statement.setString(2, product.getPrice());
            statement.setString(3, product.getImage());
            statement.setString(4, product.getDes());
            statement.setInt(5, product.getId());
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Product getProduct(String idd) {
        List<Product> sl = new ArrayList<>();
        int id = Integer.parseInt(idd);
        ConnectDB db = ConnectDB.getInstance();

        Product product = null;
        String sql = "Select * from productlist where id=?";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {

                String productName = rs.getString(2);
                String price = rs.getString(3);
                String des = rs.getString(4);
                String image = rs.getString(5);
                
                
                product = new Product(id, productName, price, image, des);

            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    public void deleteProduct(String idd) {
        // create the connection

        try {
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            // prepare the statement in order to excute the sql comments
            String sql = "DELETE FROM productlist WHERE id=?";
            PreparedStatement statement = con.prepareStatement(sql);
            // convert String id to int id
            int id = Integer.parseInt(idd);
            // set parameter in the sql
            statement.setInt(1, id);
            // execute the sql
            statement.execute();
            con.close();
            statement.close();

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
