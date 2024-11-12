/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.*;
import model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet(name = "PaymentController", urlPatterns = {"/PaymentController"})
public class PaymentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "addPayment":
                    addPayment(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/ShopCustomer.jsp");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    //add Cart
    private void addPayment(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, ServletException, IOException, ClassNotFoundException {

        //get all data from signup
        String paymentType = req.getParameter("paymentType");
        String paymentStatus = req.getParameter("paymentStatus");
        double cartTotalAmount = Double.parseDouble(req.getParameter("cartTotalAmount"));
        int cartId = Integer.parseInt(req.getParameter("cartId"));
        int customerId = Integer.parseInt(req.getParameter("customerId"));

        //keep data into javabeans
        Payment newPayment = new Payment();

        newPayment.setPaymentType(paymentType);
        newPayment.setPaymentStatus(paymentStatus);
        newPayment.setCartTotalAmount(cartTotalAmount);
        newPayment.setCartId(cartId);
        newPayment.setCustomerId(customerId);

        //pass the bean to DAO
        PaymentDao payment = new PaymentDao();

        payment.addPayment(newPayment);

        //save the bean as attribute and pass to view
        req.setAttribute("payment", newPayment);
        resp.sendRedirect("PaymentSuccessCustomer.jsp");
    }

}
