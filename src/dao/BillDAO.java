package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import connect.DBConnect;
import model.Bill;
import model.Product;

public class BillDAO {
	
	

    public ArrayList<Bill> getListBill()  throws SQLException{
           Connection connection = DBConnect.getConnection();
           String sql = "SELECT * FROM Bill ";
           PreparedStatement ps = connection.prepareCall(sql);
           ResultSet rs = ps.executeQuery();
           ArrayList<Bill> list = new ArrayList<>();
           while (rs.next()) {
        	   
               Bill bill = new Bill();
               
               bill.setBillID(rs.getInt("Bill_ID"));
               bill.setReceiver(rs.getString("Receiver"));
               bill.setReceiverAdd(rs.getString("Receiver_Address"));
               bill.setReceiverPhone(rs.getString("Receiver_Phone"));
               bill.setReceiverDate(rs.getString("Receiver_Date"));
               bill.setDate(rs.getTimestamp("Bill_Date"));
               bill.setBillStatus(rs.getString("Bill_Status"));
               bill.setPayment(rs.getString("Payment"));
               bill.setTotal(rs.getDouble("Total"));
               bill.setNote(rs.getString("Note"));
               bill.setUserID(rs.getInt("Users_ID"));
               
               list.add(bill);
           }
           return list;
   }
    
    public ArrayList<Bill> getListBillByUser(int userID)  throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM Bill WHERE Users_ID = '" + userID + "' order by Bill_ID DESC";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Bill> list = new ArrayList<>();
        while (rs.next()) {
     	   
            Bill bill = new Bill();
            
            bill.setBillID(rs.getInt("Bill_ID"));
            bill.setReceiver(rs.getString("Receiver"));
            bill.setReceiverAdd(rs.getString("Receiver_Address"));
            bill.setReceiverPhone(rs.getString("Receiver_Phone"));
            bill.setReceiverDate(rs.getString("Receiver_Date"));
            bill.setDate(rs.getTimestamp("Bill_Date"));
            bill.setBillStatus(rs.getString("Bill_Status"));
            bill.setPayment(rs.getString("Payment"));
            bill.setTotal(rs.getDouble("Total"));
            bill.setNote(rs.getString("Note"));
            bill.setUserID(rs.getInt("Users_ID"));
            
            list.add(bill);
        }
        return list;
}
	
	 public void insertBill(Bill bill) throws SQLException {
	        Connection connection = DBConnect.getConnection();
	        String sql = "INSERT INTO bill VALUES(?,?,?,?,?,?,?,?,?,?)";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ps.setString(1, bill.getReceiver());
	        ps.setString(2, bill.getReceiverAdd());
	        ps.setString(3, bill.getReceiverPhone());
	        ps.setString(4, bill.getReceiverDate());
	        ps.setTimestamp(5, bill.getDate());
	        ps.setString(6, bill.getBillStatus());
	        ps.setString(7, bill.getPayment());
	        ps.setDouble(8, bill.getTotal());
	        ps.setString(9, bill.getNote());
	        ps.setInt(10, bill.getUserID());
	        ps.executeUpdate();
	    }
	 
	   public boolean updateStatusBill(String billStatus, int billID) {
	        
	        Connection connection = DBConnect.getConnection();
	        String sql = "UPDATE Bill SET Bill_Status = ? WHERE Bill_ID = ?";
	        
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
		         ps.setString(1, billStatus);
		         ps.setInt(2, billID);
		         ps.executeUpdate();
		         return true;
		        } catch (SQLException e) {
		        	e.printStackTrace();
		        }
	        return false;
	    }
	   
	   public boolean updateBill(String billStatus, String receiverDate, int billID) {
	        
	        Connection connection = DBConnect.getConnection();
	        String sql = "UPDATE Bill SET Bill_Status = ?, Receiver_Date = ? WHERE Bill_ID = ?";
	        
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
		         ps.setString(1, billStatus);
		         ps.setString(2, receiverDate);
		         ps.setInt(3, billID);
		         ps.executeUpdate();
		         return true;
		        } catch (SQLException e) {
		        	e.printStackTrace();
		        }
	        return false;
	    }

	 
	// id tang
		public static int LayIdTang(){
				Connection connection = DBConnect.getConnection();
				int i = 0;
				try {
					Statement stm = connection.createStatement();
					String sql = "Select MAX(Bill_ID) FROM Bill";
					ResultSet rs = stm.executeQuery(sql);
					while(rs.next()){
						i = rs.getInt(1);			
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return i;
			}
		
		
	 
	 public static void main(String[] args) throws SQLException {
		//new BillDAO().insertBill(new Bill(0	, "hiếu", "hà nội", "09233", new Timestamp(System.currentTimeMillis()), 2000, "a", 3));
		 BillDAO b = new BillDAO();
		/*for(Bill lb : b.getListBill()) {
			System.out.println(lb.getReceiverAdd());
		}*/
		// b.updateStatusBill("Chờ xác nhận",1);
		 b.updateBill("Đang giao hàng", "12/10/2018", 2);
	}
}
