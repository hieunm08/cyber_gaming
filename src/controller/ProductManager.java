package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

/**
 * Servlet implementation class ProductManager
 */

public class ProductManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final ProductDAO productDAO = new ProductDAO();
	 // location to store file uploaded
    
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String productName = request.getParameter("productName");
		String productPrice = request.getParameter("productPrice");
		String productBrand = request.getParameter("productBrand");
		String productImage = request.getParameter("productImage");
		String productDescription = request.getParameter("productDescription");
		String categoryID =  request.getParameter("categoryID");
		String branchID =  request.getParameter("branchID");
		String productID = request.getParameter("productID");
		String action = request.getParameter("action");
		
		  try {
	        	if(action.equals("update")) {
	        		productDAO.updateProduct(new Product(Integer.parseInt(productID), productName, Double.parseDouble(productPrice), productImage, productDescription, productBrand ,Integer.parseInt(categoryID), Integer.parseInt(branchID)));
	       		 	response.sendRedirect("admin/product_manager.jsp");
	            } else if(action.equals("delete")) {
	            	productDAO.deleteProduct(Integer.parseInt(productID));
	            	response.sendRedirect("admin/product_manager.jsp");
	            }
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
		  
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String productName = request.getParameter("productName");
		String productPrice = request.getParameter("productPrice");
		String productBrand = request.getParameter("productBrand");
		String productImage = request.getParameter("productImage");
		String productDescription = request.getParameter("productDescription");
		String categoryID =  request.getParameter("categoryID");
		String branchID =  request.getParameter("branchID");
		String action = request.getParameter("action");
        

        try {
        	if(action.equals("submit")) {
        		productDAO.insertProduct(new Product(0, productName, Double.parseDouble(productPrice), productImage, productDescription, productBrand ,Integer.parseInt(categoryID), Integer.parseInt(branchID)));
       		 	response.sendRedirect("admin/product_manager.jsp");
            } else {
            	RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/product_manager.jsp");
        		requestDispatcher.forward(request, response);
            }
        } catch (Exception e) {
        	e.printStackTrace();
        }
	}

}
