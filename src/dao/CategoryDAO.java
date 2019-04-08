package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnect;
import model.Category;

public class CategoryDAO {
	public ArrayList<Category> getListCategory() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM Category";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<>();
        while (rs.next()) {
            Category category = new Category();
            category.setCategoryID(rs.getInt("Category_ID"));
            category.setCategoryName(rs.getString("Category_Name"));
            list.add(category);
        }
        return list;
    }
	
	public boolean insertCategory(Category c) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO Category VALUES(?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getCategoryName());
            ps.executeUpdate() ;
            return true;
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return false;
    }

    public boolean updateCategory(Category c) {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE Category SET Category_Name = ? WHERE Category_ID = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getCategoryName());
            ps.setInt(2, c.getCategoryID());
            ps.executeUpdate() ;
            return true;
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return false;
    }

    public boolean deleteCategory(int categoryID) {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM Category WHERE Category_ID = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, categoryID);
            ps.executeUpdate() ;
            return true;
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return false;
    }
	
	public static void main(String[] args) throws SQLException {
		CategoryDAO cd = new CategoryDAO();
		cd.updateCategory(new Category(3, "Phụ kiện"));
		
	}
}
