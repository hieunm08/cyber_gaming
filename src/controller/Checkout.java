package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BillDAO;
import dao.BillDetailDAO;
import model.Bill;
import model.BillDetail;
import model.Cart;
import model.Item;
import model.Users;

/**
 * Servlet implementation class Checkout
 */

public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final BillDAO billDAO = new BillDAO();
	private static final BillDetailDAO billDetailDAO = new BillDetailDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Checkout() {
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
		response.setCharacterEncoding("UTF-8");

		String receiver = request.getParameter("receiver");
		// String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String payment = request.getParameter("payment");
		String note = request.getParameter("note");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		Users user = (Users) session.getAttribute("user");

		try {
			Bill bill = new Bill();
			int billID = billDAO.LayIdTang() + 1;
			bill.setBillID(billID);
			bill.setReceiver(receiver);
			bill.setReceiverPhone(phone);
			bill.setReceiverAdd(address);
			bill.setDate(new Timestamp(System.currentTimeMillis()));
			bill.setBillStatus("Chờ xác nhận");
			bill.setPayment(payment);
			bill.setNote(note);
			bill.setTotal(cart.total());
			bill.setUserID(user.getUserID());
			billDAO.insertBill(bill);
			for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {
				billDetailDAO.insertBillDetail(new BillDetail(0, list.getValue().getProduct().getPrice(),
						list.getValue().getQuantity(), billID, list.getValue().getProduct().getProductID()));
			}
			cart = new Cart();
			session.setAttribute("cart", cart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("index.jsp");
	}

}
