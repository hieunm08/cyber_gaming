package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import dao.UserDAO;
import model.Account;
import model.Users;

/**
 * Servlet implementation class Login
 */

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		Users u = new Users();
		Account ac = new Account();
		try {
			if (AccountDAO.CheckLogin(username, password)) {
				int role = AccountDAO.getAccByUsername(username).getUserRole();
				if (role == 0) {
					session.setMaxInactiveInterval(100000);
					session.setAttribute("username", "admin");
					response.sendRedirect("admin/index.jsp");
					u = UserDAO.getUserByAccountID(ac.getAccountID());
					if (u != null) {
						session.setAttribute("user", u);
					}
				} else {
					
					session.setMaxInactiveInterval(100000);
					session.setAttribute("username", username);
					ac = AccountDAO.getAccByUsername(username);
					u = UserDAO.getUserByAccountID(ac.getAccountID());
					if (u != null) {
						session.setAttribute("user", u);
					}
					response.sendRedirect("index.jsp");
				}
			} else {
				request.setAttribute("message", "Tài khoản hoặc mật khẩu không chính xác");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
				requestDispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
