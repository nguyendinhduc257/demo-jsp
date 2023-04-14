/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import model.ProductDAO;

/**
 *
 * @author LNA02
 */
@WebServlet(name = "ProductControllerServlet", urlPatterns = {"/ProductControllerServlet"})
public class ProductControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductControllerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductControllerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    listProducts(request, response);
                    break;
                case "ADD":
                    addProduct(request, response);
                    break;
                case "LOAD":
                    loadProduct(request, response);
                    break;
                case "UPDATE":
                    updateProduct(request, response);
                    break;
                case "DELETE":
                    deleteProduct(request, response);
                    break;
                default:
                    listProducts(request, response);
            }

        } catch (Exception ex) {
            Logger.getLogger(ProductControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // get Products from the the database
        ProductDAO productDAO = new ProductDAO();
        List<Product> list = productDAO.getProducts();
        // add these Products to the object request
        request.setAttribute("productlist", list);

        // send to the JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-product.jsp");

        dispatcher.forward(request, response);
    }
    
    public void addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
//read product info from the form
        String productName = request.getParameter("productName");
        String price = request.getParameter("price");
        String des = request.getParameter("des");
        String image = request.getParameter("image");
        //create a new product object

        Product product = new Product(productName, price, des, image);
        // Add the product to the database
        ProductDAO productDAO = new ProductDAO();
        productDAO.addProduct(product);
        // calling the product list jsp page
        listProducts(request, response);
    }
    


    private void loadProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //read Product id from the form data
        String theid = request.getParameter("id");

        //get Product from the database
        Product product = new ProductDAO().getProduct(theid);
        //place Product in the request attribute
        Product s = (Product) product;
        request.setAttribute("THE_PRODUCT", product);
        //send to jsp page: update-Product-form.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("update-product-form.jsp");
        dispatcher.forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // read Product info from the form data
        int id = Integer.parseInt(request.getParameter("id"));
        String productName = request.getParameter("productName");
        String price = request.getParameter("price");
        String image = request.getParameter("image");
        String des = request.getParameter("des");

        //create a new Product object
        Product product = new Product(id, productName, price, image, des);

        //perform update on database
        new ProductDAO().updateProduct(product);
        //send them back to the "list Product" page
        listProducts(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //read Product id from the form data
        String theid = request.getParameter("id");
        // delete Product from the database
        new ProductDAO().deleteProduct(theid);
        // send them back to the "list Product" pages
        listProducts(request, response);

    }
}
