package model;

public class Branch {
	private int branchID;
	private String branchName;
	private int categoryID;
	
	public Branch() {
		// TODO Auto-generated constructor stub
	}

	public Branch(int branchID, String branchName, int categoryID) {
		super();
		this.branchID = branchID;
		this.branchName = branchName;
		this.categoryID = categoryID;
	}

	public int getBranchID() {
		return branchID;
	}

	public void setBranchID(int branchID) {
		this.branchID = branchID;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	
	

}
