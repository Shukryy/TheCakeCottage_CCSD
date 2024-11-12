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
public class CustomerDao {

    private final Connection con;

    public CustomerDao() throws SQLException, ClassNotFoundException {
        con = DbCon.getConnection();
    }

    //add new customer
    public void addCustomer(Customer customer) throws SQLException {
        try {
            String mySQLQuery = "insert into customer(customerName, customerEmail, customerPassword, "
                    + "customerPhone, customerAddress, customerZip, customerState) "
                    + "values(?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, customer.getCustomerName());
            myPS.setString(2, customer.getCustomerEmail());
            myPS.setString(3, customer.getCustomerPassword());
            myPS.setString(4, customer.getCustomerPhone());
            myPS.setString(5, customer.getCustomerAddress());
            myPS.setString(6, customer.getCustomerZip());
            myPS.setString(7, customer.getCustomerState());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }

    //verify customer 
    public Customer authentication(String customerEmail, String customerPassword) throws SQLException {
        ResultSet rs = null;
        Customer customer = null;

        try {
            String mySQLQuery = "SELECT * FROM customer WHERE customerEmail=? AND customerPassword=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);

            ps.setString(1, customerEmail);
            ps.setString(2, customerPassword);

            rs = ps.executeQuery();

            while (rs.next()) {
                customer = new Customer();

                customer.setCustomerEmail(customerEmail);
                customer.setCustomerPassword(customerPassword);
                customer.setCustomerId(rs.getInt(1));
                customer.setCustomerName(rs.getString(2));
                customer.setCustomerPhone(rs.getString(5));
                customer.setCustomerAddress(rs.getString(6));
                customer.setCustomerZip(rs.getString(7));
                customer.setCustomerState(rs.getString(8));

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

        return customer;
    }

    //retrieve all customer
    public List<Customer> getAllCustomer() throws ClassNotFoundException, SQLException {
        List<Customer> customerList = new ArrayList<>();

        Customer customer;
        ResultSet rs = null;

        try {
            String sqlQuery = "select * from customer";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);

            while (rs.next()) {
                customer = new Customer();

                customer.setCustomerId(rs.getInt(1));
                customer.setCustomerName(rs.getString(2));
                customer.setCustomerEmail(rs.getString(3));
                customer.setCustomerPassword(rs.getString(4));
                customer.setCustomerPhone(rs.getString(5));
                customer.setCustomerAddress(rs.getString(6));
                customer.setCustomerZip(rs.getString(7));
                customer.setCustomerState(rs.getString(8));

                customerList.add(customer);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }

        return customerList;
    }

//    //retrieve member by id
//    public Member retrieveMemberByUserId(int memberID) throws ClassNotFoundException, SQLException {
//
//        Member member = new Member();
//
//        try {
//            PreparedStatement myPS = DbCon.getConnection()
//                    .prepareStatement("select * from member where memberID=?");
//
//            myPS.setInt(1, memberID);
//            ResultSet rs = myPS.executeQuery();
//
//            while (rs.next()) {
//                member.setMemberID(rs.getInt("memberID"));
//                member.setMemberName(rs.getString("memberName"));
//                member.setMemberIcno(rs.getString("memberIcno"));
//                member.setMemberPhone(rs.getString("memberPhone"));
//                member.setMemberAddress(rs.getString("memberAddress"));
//                member.setMemberZip(rs.getString("memberZip"));
//                member.setMemberState(rs.getString("memberState"));
//                member.setMemberEmail(rs.getString("memberEmail"));
//                member.setMemberPassword(rs.getString("memberPassword"));
//                member.setMemberStatus(rs.getString("memberStatus"));
//            }
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        } finally {
//            con.close();
//        }
//        return member;
//    }

    //update profile customer
    public void updateCustomer(Customer customer) {

        try {
            String myQ = "update customer set customerName=?, customerPhone=?, customerAddress=?, "
                    + "customerZip=?, customerState=?, customerEmail=?, customerPassword=? WHERE customerId=?";

            PreparedStatement myPS = con.prepareStatement(myQ);

            myPS.setString(1, customer.getCustomerName());
            myPS.setString(2, customer.getCustomerPhone());
            myPS.setString(3, customer.getCustomerAddress());
            myPS.setString(4, customer.getCustomerZip());
            myPS.setString(5, customer.getCustomerState());
            myPS.setString(6, customer.getCustomerEmail());
            myPS.setString(7, customer.getCustomerPassword());
            myPS.setInt(8, customer.getCustomerId());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }


    //Customer delete account
    public void deleteCustomer(Customer customer) {

        String myQ = "DELETE FROM customer WHERE customerId=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, customer.getCustomerId());

            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

//    //Committee delete Member
//    public void CommitteeDeleteMember(int memberID) {
//
//        int status = 0;
//        try {
//            String query = "delete from member where memberID=?";
//            PreparedStatement pst = con.prepareStatement(query);
//            //Parameter start with 1
//            pst.setInt(1, memberID);
//            pst.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }

    //count total Customer
    public int countCustomer() {
        String myQ = "SELECT COUNT(*) FROM customer";
        int record = 0;

        try {
            Statement stmt = con.createStatement();
            ResultSet rsExist = stmt.executeQuery(myQ);

            if (rsExist.next()) {
                record = rsExist.getInt(1);
            }

            rsExist.close();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return record;
    }

}
