/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connection;
import java.sql.*;

/**
 *
 * @author User
 */

public class DbCon {
    
    // database url = jdbc:mysql://localhost:<port_no>/<name_of_database_on_xampp>
    private static final String URL = "jdbc:mysql://localhost:3306/tcc";
    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    
    // xampp password, check your xampp username and password for mysql
    private static final String USERNAME = "admin";
    private static final String PASSWORD = "admin";
    
    private static Connection conn;
    
    public static Connection getConnection() throws ClassNotFoundException{
        try {
            Class.forName(DRIVER_NAME);
            
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e){
            e.getMessage();
        }
        return conn;
    }
}
   

