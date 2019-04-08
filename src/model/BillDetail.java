package model;

public class BillDetail {
	private int billDetailID;
	private double billPrice;
	private int quantityDetail;
	private int billID;
	private int productID;
	
	public BillDetail() {
		// TODO Auto-generated constructor stub
	}

	public BillDetail(int billDetailID, double billPrice, int quantityDetail, int billID, int productID) {
		super();
		this.billDetailID = billDetailID;
		this.billPrice = billPrice;
		this.quantityDetail = quantityDetail;
		this.billID = billID;
		this.productID = productID;
	}

	public int getBillDetailID() {
		return billDetailID;
	}

	public void setBillDetailID(int billDetailID) {
		this.billDetailID = billDetailID;
	}

	public double getBillPrice() {
		return billPrice;
	}

	public void setBillPrice(double billPrice) {
		this.billPrice = billPrice;
	}

	public int getQuantityDetail() {
		return quantityDetail;
	}

	public void setQuantityDetail(int quantityDetail) {
		this.quantityDetail = quantityDetail;
	}

	public int getBillID() {
		return billID;
	}

	public void setBillID(int billID) {
		this.billID = billID;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}
	
	

}
