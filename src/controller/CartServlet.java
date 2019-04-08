package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import model.Cart;
import model.Item;
import model.Product;

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final ProductDAO productDAO = new ProductDAO();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String ProductID = request.getParameter("productID");
		Cart cart = (Cart) session.getAttribute("cart");
		
		try {
			int product_id = Integer.parseInt(ProductID);
			Product product = productDAO.getProduct(product_id);
			if (action.equals("add")) {
				if(cart.getCartItems().containsKey(product_id)){
					cart.insertToCart(Integer.parseInt(ProductID),new Item(product, cart.getCartItems().get(product_id).getQuantity()));
				}else {
					cart.insertToCart(product_id, new Item(product,1));
				}
				
			}else if(action.equals("remove")) {
				  	cart.removeCart(product_id);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("cart", cart);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
		
	}

}
