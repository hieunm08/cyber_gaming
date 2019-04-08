package model;

import java.sql.Timestamp;

public class Bill {
	private int billID;
	private String receiver;
	private String receiverAdd;
	private String receiverPhone;
	private String receiverDate;
	private Timestamp date;
	private String billStatus;
	private String payment;
	private double total;
	private String note;
	private int userID;
	
	public Bill() {
		// TODO Auto-generated constructor stub
	}

	public Bill(int billID, String receiver, String receiverAdd, String receiverPhone, String receiverDate,
			Timestamp date, String billStatus, String payment, double total, String note, int userID) {
		super();
		this.billID = billID;
		this.receiver = receiver;
		this.receiverAdd = receiverAdd;
		this.receiverPhone = receiverPhone;
		this.receiverDate = receiverDate;
		this.date = date;
		this.billStatus = billStatus;
		this.payment = payment;
		this.total = total;
		this.note = note;
		this.userID = userID;
	}

	public int getBillID() {
		return billID;
	}

	public void setBillID(int billID) {
		this.billID = billID;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getReceiverAdd() {
		return receiverAdd;
	}

	public void setReceiverAdd(String receiverAdd) {
		this.receiverAdd = receiverAdd;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public String getReceiverDate() {
		return receiverDate;
	}

	public void setReceiverDate(String receiverDate) {
		this.receiverDate = receiverDate;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getBillStatus() {
		return billStatus;
	}

	public void setBillStatus(String billStatus) {
		this.billStatus = billStatus;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	
	
	
	
	

}
