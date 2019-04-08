package model;

import javax.persistence.*;

@Entity
@Table(name="Users")
public class Users {
	@Id
	@GeneratedValue	
	@Column(name = "User_ID")
	private int userID;
	@Column(name="Name")
	private String Name;
	@Column(name="Email")
	private String Email;
	@Column(name="Phone")
	private String Phone;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Account_ID")
	private Account account;
 
	public Users() {
		// TODO Auto-generated constructor stub
	}

	public Users(int userID, String name, String email, String phone, Account accountID) {
		super();
		this.userID = userID;
		Name = name;
		Email = email;
		Phone = phone;
		this.account = accountID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public Account getAccountID() {
		return account;
	}

	public void setAccountID(Account accountID) {
		this.account = accountID;
	}
	
	
}
