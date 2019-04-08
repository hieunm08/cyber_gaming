package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnect;
import model.BillDetail;

public class BillDetailDAO {
	 public void insertBillDetail(BillDetail bd) throws SQLException {
	        Connection connection = DBConnect.getConnection();
	        String sql = "INSERT INTO BillDetail VALUES(?,?,?,?)";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ps.setDouble(1, bd.getBillPrice());
	        ps.setInt(2, bd.getQuantityDetail());
	        ps.setInt(3, bd.getBillID());
	        ps.setInt(4, bd.getProductID());
	        ps.executeUpdate();
	    }
	 
	  public ArrayList<BillDetail> getBillDetailByBillID(int billID) throws SQLException {
	            Connection connection = DBConnect.getConnection();
	            String sql = "SELECT * FROM BillDetail WHERE Bill_ID = '" + billID + "'";
	            PreparedStatement ps = connection.prepareCall(sql);
	            ResultSet rs = ps.executeQuery();
	            ArrayList<BillDetail> list = new ArrayList<>();
	            while (rs.next()) {
	                BillDetail bd = new BillDetail();
	                bd.setBillDetailID(rs.getInt("BillDetail_ID"));   
	                bd.setBillPrice(rs.getDouble("Price"));
	                bd.setQuantityDetail(rs.getInt("Quantity"));
	                bd.setBillID(rs.getInt("Bill_ID"));
	                bd.setProductID(rs.getInt("Product_ID"));
	                
	                list.add(bd);
	            }
	            return list;
	  }
	 
	 public static void main(String[] args) throws SQLException {
		//new BillDetailDAO().insertBillDetail(new BillDetail(1, 500000, 2, 2, 1));
		 BillDetailDAO bdd = new BillDetailDAO();
		 for(BillDetail l : bdd.getBillDetailByBillID(4)) {
			 System.out.println(l.getQuantityDetail());
		 };
	}

}
