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
public class CartDao {

    private final Connection con;

    public CartDao() throws SQLException, ClassNotFoundException {
        con = DbCon.getConnection();
    }

    //add cart
    public void addCart(Cart cart) throws SQLException {
        try {
            String mySQLQuery = "INSERT INTO cart(cartTotalAmount, cartDetail, cartDateTime, customerId) VALUES(?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setDouble(1, cart.getCartTotalAmount());
            myPS.setString(2, cart.getCartDetail());
            myPS.setString(3, cart.getCartDateTime());
            myPS.setInt(4, cart.getCustomerId());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }

    //retrieve all cart
    public List<Cart> getAllCart() throws ClassNotFoundException, SQLException {
        List<Cart> cartList = new ArrayList<>();

        Cart cart;
        ResultSet rs = null;

        try {
            String sqlQuery = "SELECT * FROM cart c "
                    + "WHERE NOT EXISTS ("
                    + "    SELECT 1 "
                    + "    FROM payment p "
                    + "    WHERE p.cartId = c.cartId"
                    + ")";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);

            while (rs.next()) {
                cart = new Cart();

                cart.setCartId(rs.getInt(1));
                cart.setCartTotalAmount(rs.getDouble(2));
                cart.setCartDetail(rs.getString(3));
                cart.setCartDateTime(rs.getString(4));
                cart.setCustomerId(rs.getInt(5));

                cartList.add(cart);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }

        return cartList;
    }

//    //retrieve cart by id
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
    //count total Cart
    public int countCart() {
        String myQ = "SELECT COUNT(*) FROM cart";
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
