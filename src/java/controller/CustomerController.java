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
@WebServlet(name = "CustomerController", urlPatterns = {"/CustomerController"})
public class CustomerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "register":
                    registerCustomer(request, response);
                    break;

                case "login":
                    retrieveLogin(request, response);
                    break;

                case "update":
                    updateCustomer(request, response);
                    break;

                case "delete":
                    deleteCustomer(request, response);
                    break;

                case "signout":
                    signOut(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "index.jsp");
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
            Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
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

    //register Customer
    private void registerCustomer(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, ServletException, IOException, ClassNotFoundException {

        //get all data from signup
        String customerName = req.getParameter("customerName");
        String customerPhone = req.getParameter("customerPhone");
        String customerAddress = req.getParameter("customerAddress");
        String customerZip = req.getParameter("customerZip");
        String customerState = req.getParameter("customerState");
        String customerEmail = req.getParameter("customerEmail");
        String customerPassword = req.getParameter("customerPassword");
        
        //keep data into javabeans
        Customer newCustomer = new Customer();

        newCustomer.setCustomerName(customerName);
        newCustomer.setCustomerPhone(customerPhone);
        newCustomer.setCustomerAddress(customerAddress);
        newCustomer.setCustomerZip(customerZip);
        newCustomer.setCustomerState(customerState);
        newCustomer.setCustomerEmail(customerEmail);
        newCustomer.setCustomerPassword(customerPassword);

        //pass the bean to DAO
        CustomerDao customer = new CustomerDao();
        customer.addCustomer(newCustomer);

        //save the bean as attribute and pass to view
        req.setAttribute("customer", newCustomer);
        resp.sendRedirect("login.jsp");
    }

    //retrieve for 2 user (login)
    private void retrieveLogin(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException,
        IOException, ClassNotFoundException {

    // Check if the login form is submitted
    if (req.getParameter("action") != null) {

        String Email = req.getParameter("loginEmail");
        String Password = req.getParameter("loginPassword");

        AdminDao adminDao = new AdminDao();
        CustomerDao customerDao = new CustomerDao();

        int loginAttempts = 0; // Initialize login attempts counter

        // Retrieve the login attempts from the session
        HttpSession session = req.getSession();
        if (session.getAttribute("loginAttempts") != null) {
            loginAttempts = (int) session.getAttribute("loginAttempts");
        }

        try {
            Admin admin = adminDao.authentication(Email, Password);
            Customer customer = customerDao.authentication(Email, Password);

            if (admin != null) {
                session.setAttribute("admin", admin);
                resp.sendRedirect("AdminDashboard.jsp"); 
            } else if (customer != null) {
                session.setAttribute("customer", customer);
                resp.sendRedirect("HomePageCustomer.jsp"); 
            } else {
                loginAttempts++; // Increment the login attempts counter
                session.setAttribute("loginAttempts", loginAttempts);

                if (loginAttempts >= 3) {
                    req.setAttribute("error", "Email or Password is Invalid! You have attempted 3 times. <br> "
                            + "Please contact our admin if you encounter any issues.");
                } else {
                    req.setAttribute("error", "Email or Password is Invalid!");
                }

                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.forward(req, resp);
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}

    //update profile customer
    private void updateCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException, ClassNotFoundException {

        String customerName = request.getParameter("customerName");
        String customerPhone = request.getParameter("customerPhone");
        String customerAddress = request.getParameter("customerAddress");
        String customerZip = request.getParameter("customerZip");
        String customerState = request.getParameter("customerState");
        String customerEmail = request.getParameter("customerEmail");
        String customerPassword = request.getParameter("customerPassword");
        int customerId = Integer.parseInt(request.getParameter("customerId"));

        Customer customer = new Customer();

        customer.setCustomerName(customerName);
        customer.setCustomerPhone(customerPhone);
        customer.setCustomerAddress(customerAddress);
        customer.setCustomerZip(customerZip);
        customer.setCustomerState(customerState);
        customer.setCustomerEmail(customerEmail);
        customer.setCustomerPassword(customerPassword);
        customer.setCustomerId(customerId);

        CustomerDao customerDao = new CustomerDao();

        customerDao.updateCustomer(customer);

        HttpSession session = request.getSession();
        session.setAttribute("customer", customer);

        response.sendRedirect("ProfileCustomer.jsp");
    }
   

    //delete Customer
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException, ClassNotFoundException {

        int customerId = Integer.parseInt(request.getParameter("customerId"));

        Customer customer = new Customer();

        customer.setCustomerId(customerId);

        CustomerDao customerDao = new CustomerDao();

        customerDao.deleteCustomer(customer);

        HttpSession session = request.getSession();
        session.invalidate();

        response.sendRedirect("index.jsp");

    }


    //logout
    private void signOut(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {

        req.getSession().removeAttribute("customer");

        resp.sendRedirect("login.jsp");
    }

}
