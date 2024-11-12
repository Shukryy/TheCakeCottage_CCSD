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
public class PaymentDao {

    private final Connection con;

    public PaymentDao() throws SQLException, ClassNotFoundException {
        con = DbCon.getConnection();
    }

    //add Payment
    public void addPayment(Payment payment) throws SQLException {
        try {
            String mySQLQuery = "INSERT INTO payment(paymentType, paymentStatus, cartTotalAmount, cartId, customerId) VALUES(?, ?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, payment.getPaymentType());
            myPS.setString(2, payment.getPaymentStatus());
            myPS.setDouble(3, payment.getCartTotalAmount());
            myPS.setInt(4, payment.getCartId());
            myPS.setInt(5, payment.getCustomerId());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }

    //retrieve all Payment
    public List<Payment> getAllPayment() throws ClassNotFoundException, SQLException {
        List<Payment> paymenttList = new ArrayList<>();

        Payment payment;
        ResultSet rs = null;

        try {
            String sqlQuery = "select * from payment";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);

            while (rs.next()) {
                payment = new Payment();

                payment.setPaymentId(rs.getInt(1));
                payment.setCartTotalAmount(rs.getDouble(2));
                payment.setPaymentType(rs.getString(3));
                payment.setPaymentStatus(rs.getString(4));
                payment.setCartId(rs.getInt(5));
                payment.setCustomerId(rs.getInt(6));

                paymenttList.add(payment);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }

        return paymenttList;
    }

    //retrieve payment by customerId
    public Payment retrievePaymentByCustomerId(int customerId) throws ClassNotFoundException, SQLException {

        Payment payment = new Payment();

        try {
            PreparedStatement myPS = DbCon.getConnection()
                    .prepareStatement("select * from payment where customerId=?");

            myPS.setInt(1, customerId);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                payment.setPaymentId(rs.getInt("PaymentId"));
                payment.setCartTotalAmount(rs.getDouble("cartTotalAmount"));
                payment.setPaymentType(rs.getString("paymentType"));
                payment.setPaymentStatus(rs.getString("paymentStatus"));
                payment.setCartId(rs.getInt("cartId"));
                payment.setCustomerId(rs.getInt("customerId"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return payment;
    }

    //count total payment
    public int countPayment() {
        String myQ = "SELECT COUNT(*) FROM payment";
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
            Logger.getLogger(CartDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return record;
    }

}
