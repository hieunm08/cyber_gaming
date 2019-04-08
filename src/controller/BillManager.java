package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BillDAO;

/**
 * Servlet implementation class BillManager
 */
public class BillManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final BillDAO billDAO = new BillDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BillManager() {
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
		
		String billStatus = request.getParameter("billStatus");
		String receiverDate = request.getParameter("receiverDate");
		String billID = request.getParameter("billID");
		billDAO.updateBill(billStatus, receiverDate, Integer.parseInt(billID));
		response.sendRedirect("admin/bill_manager.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
