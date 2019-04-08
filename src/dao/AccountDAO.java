package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import connect.DBConnect;
import model.Account;
import util.HibernateUtil;


public class AccountDAO {
	// kt username đã tồn tại
	
	 public static boolean checkUserName(String username) throws SQLException{
		 	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		 	Transaction transaction = null;   
		    String sql = "SELECT * FROM Account WHERE UserName = '" + username + "'";
		    try {
		        transaction = session.beginTransaction();
		        Query query = session.createSQLQuery(sql);
		        Account ac = (Account) query.uniqueResult();
		        transaction.commit();
		        if(ac!=null) {
		        	return true;
		        }
		    } catch (Exception ex) {
		    	if (transaction != null) {
	                transaction.rollback();
	            }
	            ex.printStackTrace();
		    }
		    return false;
		    }
	 // add account
	 public static boolean insertAcc(Account ac) {
	       Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	       Transaction transaction = null;
	        try {
	           transaction = session.beginTransaction();
	           session.save(ac);
	            return true;
	        } catch (Exception ex) {
	        	if (transaction != null) {
	                transaction.rollback();
	            }
	            ex.printStackTrace();
	        }
	        return false;
	    }
	 
	 // id tang
	public static int LayIdTang(){
			Connection connection = DBConnect.getConnection();
			int i = 0;
			try {
				Statement stm = connection.createStatement();
				String sql = "Select MAX(Account_ID) FROM Account";
				ResultSet rs = stm.executeQuery(sql);
				while(rs.next()){
					i = rs.getInt(1);			
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return i;
		}
	
	//kt dang nhap
	public static boolean CheckLogin(String username, String password) {
		Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
		String sql = "select * from Account where UserName='" + username + "' and User_Password='" + password + "'";
		try {
			transaction = session.beginTransaction();
			Query query = session.createSQLQuery(sql);
			transaction.commit();
			Account ac = (Account) query.uniqueResult();
			if(ac!=null) {
				return true;
			}
		} catch (Exception e) {
			 if (transaction != null) {
	                transaction.rollback();
	            }
	            e.printStackTrace();
		}
		return false;
	}
	
	
	public static Account getAccByUsername(String username)
	{
		Connection con = DBConnect.getConnection();
		try {
			Statement stm = con.createStatement();
			String sql = "select * from Account where UserName='"+username+"'";
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()){
				Account ac = new Account();
				ac.setAccountID(rs.getInt("Account_ID"));
				ac.setUserName(rs.getString("UserName"));
				ac.setUserPassword(rs.getString("User_Password"));
				ac.setUserRole(rs.getInt("User_Role"));
				return ac;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static void main(String[] args) {
		System.out.println(getAccByUsername("phuong")); 
	}
	
}
