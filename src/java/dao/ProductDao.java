/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DbCon;
import model.*;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
public class ProductDao {

    private final Connection con;

    //connection database
    public ProductDao() throws SQLException, ClassNotFoundException {
        con = DbCon.getConnection();
    }

    //add new Product

    public void addProduct(Product product) throws SQLException, IOException {
        try {
            String mySQLQuery = "insert into product(productName, productCategory, productPrice, productImage, adminId) values(?, ?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, product.getProductName());
            myPS.setString(2, product.getProductCategory());
            myPS.setDouble(3, product.getProductPrice());

            Part filePart = product.getProductImage();
            InputStream inputStream = null;

            if (filePart != null) {
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                myPS.setBlob(4, inputStream);
            }

            myPS.setInt(5, product.getAdminId());

            myPS.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
    }

    //retrieve all Product
    public List<Product> getAllProduct() throws ClassNotFoundException, SQLException {

        List<Product> product = new ArrayList<>();

        String mySQLQuery = "SELECT * FROM product ORDER BY productId ASC";

        try ( Connection connection = DbCon.getConnection();  PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productId");
                String productName = rs.getString("productName");
                String productCategory = rs.getString("productCategory");
                Double productPrice = rs.getDouble("productPrice");
                product.add(new Product(productId, productName, productCategory, productPrice));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return product;
    }
    
     //retrieve Product by adminID
    public List<Product> retrieveAllProductById(int adminId) throws ClassNotFoundException, SQLException {

        List<Product> product = new ArrayList<>();

        String mySQLQuery = "select * from product where adminId=" + adminId;

        try ( Connection connection = DbCon.getConnection();  PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productId");
                String productName = rs.getString("productName");
                String productCategory = rs.getString("productCategory");
                Double productPrice = rs.getDouble("productPrice");
                product.add(new Product(productId, productName, productCategory, productPrice));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return product;
    }

    //retrieve Product by ProductId
    public Product retrieveProductById(int productId) throws ClassNotFoundException, SQLException {

        Product product = new Product();

        try {
            PreparedStatement myPS = DbCon.getConnection()
                    .prepareStatement("select * from product where productId=?");

            myPS.setInt(1, productId);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                product.setProductId(rs.getInt("productId"));
                product.setProductName(rs.getString("productName"));
                product.setProductCategory(rs.getString("productCategory"));
                product.setProductPrice(rs.getDouble("productPrice"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return product;
    }

    //admin update Product
     public void updateProduct(Product product) throws SQLException, IOException, ClassNotFoundException {
         try {
             String myQ = "update product set productImage=?, productName=?, productCategory=?, productPrice=? where productId=?";
             PreparedStatement myPS = con.prepareStatement(myQ);
             Part filePart = product.getProductImage();
             InputStream inputStream = null;
             inputStream = filePart.getInputStream();
             // fetches input stream of the upload file for the blob column
             myPS.setBlob(1, inputStream);
             myPS.setString(2, product.getProductName());
             myPS.setString(3, product.getProductCategory());
             myPS.setDouble(4, product.getProductPrice());
             myPS.setInt(5, product.getProductId());
             myPS.executeUpdate();
         } catch (SQLException e) {
             System.out.println(e.getMessage());
         } finally {
             con.close();
         }
     }
    
    //admin delete Product
     public void deleteProduct(Product product) {
         String myQ = "delete from product where productId=?";
         try {
             PreparedStatement myPs = con.prepareStatement(myQ);
             myPs.setInt(1, product.getProductId());
             myPs.executeUpdate();
         } catch (SQLException ex) {
             Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
         }
     }
     
    //count total hebahan
    // public int countHebahan() {
    //     String myQ = "SELECT COUNT(*) FROM announcement";
    //     int record = 0;
    //     try {
    //         Statement stmt = con.createStatement();
    //         ResultSet rsExist = stmt.executeQuery(myQ);
    //         if (rsExist.next()) {
    //             record = rsExist.getInt(1);
    //         }
    //         rsExist.close();
    //         stmt.close();
    //     } catch (SQLException ex) {
    //         Logger.getLogger(HebahanDao.class.getName()).log(Level.SEVERE, null, ex);
    //     }
    //     return record;
    // }
}
