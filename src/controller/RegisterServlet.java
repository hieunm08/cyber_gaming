package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import dao.UserDAO;
import model.Account;
import model.Users;

/**
 * Servlet implementation class Register
 */

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name, username, password, phone, email;		
		name = request.getParameter("fullname");
		username = request.getParameter("username");
		password = request.getParameter("password");
		try {
			if(AccountDAO.checkUserName(username))
			{
				request.setAttribute("message", "Tài khoản đã tồn tại");
				RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
				dispatcher.forward(request, response);
			}
			else {
				Users u = new Users();		
				phone = request.getParameter("phone");
				email = request.getParameter("email");		
				u.setName(name);;
				u.setPhone(phone);
				u.setEmail(email);
				Account ac = new Account();
				ac.setUserName(username);
				ac.setUserPassword(password);
				AccountDAO.insertAcc(ac);
				UserDAO.insertUser(u);
				response.sendRedirect("login.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
