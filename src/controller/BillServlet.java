package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BillDAO;
import dao.BillDetailDAO;
import dao.ProductDAO;
import model.Bill;
import model.Users;

/**
 * Servlet implementation class BillServlet
 */
public class BillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final BillDAO billDAO = new BillDAO();
	private static final BillDetailDAO billDetailDAO = new BillDetailDAO();
	private static final ProductDAO productDAO = new ProductDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Bill bill = new Bill();
		String billID = request.getParameter("billID");
		bill.setBillStatus("Hủy");
		billDAO.updateStatusBill(bill.getBillStatus(), Integer.parseInt(billID));
		response.sendRedirect("bill.jsp");
	}

}
