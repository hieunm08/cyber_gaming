package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnect;
import model.Branch;

public class BranchDAO {
	public ArrayList<Branch> getListBranch() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM Branch";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Branch> list = new ArrayList<>();
        while (rs.next()) {
        	Branch b = new Branch();
            b.setBranchID(rs.getInt("Branch_ID"));
            b.setBranchName(rs.getString("Branch_Name"));
            b.setCategoryID(rs.getInt("Category_ID"));
            list.add(b);
        }
        return list;
    }

}
