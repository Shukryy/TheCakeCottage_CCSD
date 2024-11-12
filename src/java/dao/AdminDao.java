/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.*;
import model.*;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class AdminDao {
    
    private final Connection con;

    public AdminDao() throws SQLException, ClassNotFoundException {
        con = DbCon.getConnection();
    }


    //verify admin 
    public Admin authentication(String adminEmail, String adminPassword) throws SQLException {
        ResultSet rs = null;
        Admin admin = null;

        try {
            String mySQLQuery = "select * from admin where adminEmail=? and adminPassword=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);

            ps.setString(1, adminEmail);
            ps.setString(2, adminPassword);

            rs = ps.executeQuery();

            while (rs.next()) {
                admin = new Admin();

                admin.setAdminEmail(adminEmail);
                admin.setAdminPassword(adminPassword);
                admin.setAdminId(rs.getInt(1));
                admin.setAdminName(rs.getString(2));
                admin.setAdminPhone(rs.getString(5));
                admin.setAdminAddress(rs.getString(6));
                admin.setAdminZip(rs.getString(7));
                admin.setAdminState(rs.getString(8));

            }
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }
            con.close();
        }

        return admin;
    }  
    
//update profile admin
    public void updateAdmin(Admin admin) {

        try {
            String myQ = "update admin set adminName=?, adminPhone=?, adminAddress=?, adminZip=?, "
                    + "adminState=?, adminEmail=?, adminPassword=? WHERE adminId=?";

            PreparedStatement myPS = con.prepareStatement(myQ);

            myPS.setString(1, admin.getAdminName());
            myPS.setString(2, admin.getAdminPhone());
            myPS.setString(3, admin.getAdminAddress());
            myPS.setString(4, admin.getAdminZip());
            myPS.setString(5, admin.getAdminState());
            myPS.setString(6, admin.getAdminEmail());
            myPS.setString(7, admin.getAdminPassword());
            myPS.setInt(8, admin.getAdminId());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}

    

