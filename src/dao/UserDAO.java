package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connect.DBConnect;
import model.Users;

public class UserDAO {
	// them user
	
	 public static boolean insertUser(Users u) {
	        Connection connection = DBConnect.getConnection();
	        String sql = "INSERT INTO USERS VALUES(?,?,?,?)";
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
	            ps.setString(1, u.getName());
	            ps.setString(2, u.getEmail());
	            ps.setString(3, u.getPhone());
	            ps.setInt(4, u.getAccountID());
	            ps.executeUpdate();
	            return true;
	        } catch (SQLException e) {
	        	e.printStackTrace();
	        }
	        return false;
	    }
	 
	 public static Users getUserByAccountID(int accountID)
		{
		    Connection connection = DBConnect.getConnection();
		    String sql = "select * from Users where Account_ID = '" + accountID + "'";
		    PreparedStatement ps;
			try {
				ps = connection.prepareCall(sql);
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					Users u  = new Users();
					u.setUserID(rs.getInt("Users_ID"));
					u.setName(rs.getString("Name"));
					u.setEmail(rs.getString("Email"));
					u.setPhone(rs.getString("Phone"));
					return u;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
	 
	 public static void main(String[] args) {
			System.out.println(getUserByAccountID(3)); 
		}
}
