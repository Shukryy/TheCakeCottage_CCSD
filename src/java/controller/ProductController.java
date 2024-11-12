/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.*;
import dao.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
@MultipartConfig(maxFileSize = 16177215)
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IllegalStateException, SQLException, ClassNotFoundException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "addProduct":
                    addProduct(request, response);
                    break;

                case "updateProduct":
                    updateProduct(request, response);
                    break;

                case "deleteProduct":
                    deleteProduct(request, response);
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
        } catch (IllegalStateException | SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (IllegalStateException | SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
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

    //admin add Product
    private void addProduct(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        //get all data from form
        String productName = req.getParameter("productName");
        String productCategory = req.getParameter("productCategory");
        String productPrice = req.getParameter("productPrice");
        Part productImage = req.getPart("productImage");
        int adminId = Integer.parseInt(req.getParameter("adminId"));

        //keep data into javabeans
        Product newProduct = new Product();

        newProduct.setProductName(productName);
        newProduct.setProductCategory(productCategory);
        newProduct.setProductPrice(Double.parseDouble(productPrice));
        newProduct.setProductImage(productImage);
        newProduct.setAdminId(adminId);

        //pass the bean to DAO
        ProductDao productDao = new ProductDao();
        productDao.addProduct(newProduct);

        List<Product> listProduct = productDao.retrieveAllProductById(adminId);

        HttpSession session = req.getSession();
        session.setAttribute("list", listProduct);

        //save the bean as attribute and pass to view
        resp.sendRedirect("AdminDashboard.jsp");
    }

    //committee update Product
    private void updateProduct(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        ProductDao productDao = new ProductDao();

        String productName = req.getParameter("productName");
        String productCategory = req.getParameter("productCategory");
        String productPrice = req.getParameter("productPrice");
        Part productImage = req.getPart("productImage");
        int productId = Integer.parseInt(req.getParameter("productId"));
        int adminId = Integer.parseInt(req.getParameter("adminId"));

        if (productImage.getName().isEmpty()) {
            Product product = productDao.retrieveProductById(productId);
            productImage = product.getProductImage();
        }

        Product product = new Product();

        product.setProductName(productName);
        product.setProductCategory(productCategory);
        product.setProductPrice(Double.parseDouble(productPrice));
        product.setProductImage(productImage);
        product.setProductId(productId);
        product.setAdminId(adminId);

        productDao.updateProduct(product);

        HttpSession session = req.getSession();
        session.setAttribute("product", product);

        resp.sendRedirect("AdminUpdateProduct.jsp");

    }

    //committee delete Product
    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, ServletException, IOException, ClassNotFoundException {

        int productId = Integer.parseInt(req.getParameter("productId"));

        Product product = new Product();

        product.setProductId(productId);

        ProductDao productDao = new ProductDao();

        productDao.deleteProduct(product);

        resp.sendRedirect("AdminUpdateProduct.jsp");

    }
}
