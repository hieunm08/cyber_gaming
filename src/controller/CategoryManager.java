package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.txw2.Document;

import dao.CategoryDAO;
import model.Category;

/**
 * Servlet implementation class CategoryManager
 */
public class CategoryManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final CategoryDAO categoryDAO = new CategoryDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String action = request.getParameter("action");
        String categoryID = request.getParameter("categoryID");
        String categoryName = request.getParameter("categoryName");
        try {
        	if(action.equals("update")) {
        		if(categoryName.length()>0) {
            		 categoryDAO.updateCategory(new Category(Integer.parseInt(categoryID), categoryName));
            		 response.sendRedirect("admin/category_manager.jsp");
        		}
            } else if(action.equals("delete")) {
            	categoryDAO.deleteCategory(Integer.parseInt(categoryID));
            	response.sendRedirect("admin/category_manager.jsp");
            }else {
            	RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/category_manager.jsp");
        		requestDispatcher.forward(request, response);
            }
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String categoryName = request.getParameter("categoryName");
		String action = request.getParameter("action");
        

        try {
        	if(action.equals("submit") && categoryName.length()>0) {
        		categoryDAO.insertCategory(new Category(0, categoryName));
       		 	response.sendRedirect("admin/category_manager.jsp");
        		
            } else {
            	RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/category_manager.jsp");
        		requestDispatcher.forward(request, response);
            }
        } catch (Exception e) {
        	e.printStackTrace();
        }
   
}
}
