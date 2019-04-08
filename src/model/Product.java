package model;

public class Product {
	private int productID;
	private String productName;
	private double price;
	private String productImage;
	private String productDescription;
	private String brand; 
	private int categoryID;
	private int branchID;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int productID, String productName, double price, String productImage, String productDescription,
			String brand, int categoryID, int branchID) {
		super();
		this.productID = productID;
		this.productName = productName;
		this.price = price;
		this.productImage = productImage;
		this.productDescription = productDescription;
		this.brand = brand;
		this.categoryID = categoryID;
		this.branchID = branchID;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public int getBranchID() {
		return branchID;
	}

	public void setBranchID(int branchID) {
		this.branchID = branchID;
	}
	

}
