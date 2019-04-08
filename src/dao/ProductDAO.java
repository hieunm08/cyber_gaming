package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnect;
import model.Product;

public class ProductDAO {
	

	public ArrayList<Product> getListProduct() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM Product";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            
            Product product = new Product();
           
            product.setProductID(rs.getInt("Product_ID"));
            product.setProductName(rs.getString("Product_Name"));
            product.setPrice(rs.getDouble("Product_Price"));
            product.setProductImage(rs.getString("Product_Image"));
            product.setProductDescription(rs.getString("Product_Description"));
            product.setBrand(rs.getString("Brand"));
            product.setCategoryID(rs.getInt("Category_ID"));
            product.setBranchID(rs.getInt("Branch_ID"));
          
            list.add(product);
        }
        return list;
    }
	
	
	
	public ArrayList<Product> getListProductByCategory(int categoryID) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM Product WHERE Category_ID = '" + categoryID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            
            Product product = new Product();
           
            product.setProductID(rs.getInt("Product_ID"));
            product.setProductName(rs.getString("Product_Name"));
            product.setPrice(rs.getDouble("Product_Price"));
            product.setProductImage(rs.getString("Product_Image"));
            product.setProductDescription(rs.getString("Product_Description"));
            product.setBrand(rs.getString("Brand"));
            product.setCategoryID(rs.getInt("Category_ID"));
            product.setBranchID(rs.getInt("Branch_ID"));
          
            list.add(product);
        }
        return list;
    }
	
	//san pham moi
	public ArrayList<Product> getListProductNews() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT TOP 4 * FROM Product order by Product_ID DESC";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            
            Product product = new Product();
           
            product.setProductID(rs.getInt("Product_ID"));
            product.setProductName(rs.getString("Product_Name"));
            product.setPrice(rs.getDouble("Product_Price"));
            product.setProductImage(rs.getString("Product_Image"));
            product.setProductDescription(rs.getString("Product_Description"));
            product.setBrand(rs.getString("Brand"));
            product.setCategoryID(rs.getInt("Category_ID"));
            product.setBranchID(rs.getInt("Branch_ID"));
          
            list.add(product);
        }
        return list;
    }
	
	//chi tiet san pham
	
	public Product getProduct(int ProductID) throws SQLException {
	     Connection connection = DBConnect.getConnection();
	     String sql = "SELECT * FROM Product WHERE Product_ID = '" + ProductID + "'";
	     PreparedStatement ps = connection.prepareCall(sql);
	     ResultSet rs = ps.executeQuery();
	     Product product = new Product();
	     while (rs.next()) {
	    	 	product.setProductID(rs.getInt("Product_ID"));
	            product.setProductName(rs.getString("Product_Name"));
	            product.setPrice(rs.getDouble("Product_Price"));
	            product.setProductImage(rs.getString("Product_Image"));
	            product.setProductDescription(rs.getString("Product_Description"));
	            product.setBrand(rs.getString("Brand"));
	            product.setCategoryID(rs.getInt("Category_ID"));
	            product.setBranchID(rs.getInt("Branch_ID"));
	     }
	     return product;
	}
	
	public ArrayList<Product> searchProductByName(String productName) throws SQLException
	{
		
		Connection connection = DBConnect.getConnection();
        String sql = "Select * from Product where Product_Name like N'%" + productName + "%'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            
            Product product = new Product();
           
            product.setProductID(rs.getInt("Product_ID"));
            product.setProductName(rs.getString("Product_Name"));
            product.setPrice(rs.getDouble("Product_Price"));
            product.setProductImage(rs.getString("Product_Image"));
            product.setProductDescription(rs.getString("Product_Description"));
            product.setBrand(rs.getString("Brand"));
            product.setCategoryID(rs.getInt("Category_ID"));
            product.setBranchID(rs.getInt("Branch_ID"));
          
            list.add(product);
        }
        return list;
    }
	
	
	 public ArrayList<Product> getListProductByNav(int categoryID, int firstResult, int maxResult) throws SQLException{
	        Connection connection = DBConnect.getConnection();
	        String sql = "SELECT * FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY Category_ID ORDER BY Product_ID DESC) AS RowNum FROM Product) AS MyDerivedTable WHERE Category_ID = '" + categoryID + "' and MyDerivedTable.RowNum BETWEEN ? AND ? ";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ps.setInt(1, firstResult);
	        ps.setInt(2, maxResult);
	        ResultSet rs = ps.executeQuery();
	        ArrayList<Product> list = new ArrayList<>();
	        while (rs.next()) {
	            Product product = new Product();
	            product.setProductID(rs.getInt("Product_ID"));
	            product.setProductName(rs.getString("Product_Name"));
	            product.setPrice(rs.getDouble("Product_Price"));
	            product.setProductImage(rs.getString("Product_Image"));
	            product.setProductDescription(rs.getString("Product_Description"));
	            product.setBrand(rs.getString("Brand"));
	            product.setCategoryID(rs.getInt("Category_ID"));
	            product.setBranchID(rs.getInt("Branch_ID"));
	            
	            list.add(product);
	        }
	        return list;
	    }
	
	 public int countProductByCategory(int categoryID) throws SQLException{
	        Connection connection = DBConnect.getConnection();
	        String sql = "SELECT count(Product_ID) FROM Product WHERE Category_ID = '" + categoryID + "'";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        int count = 0;
	        while (rs.next()) {
	            count = rs.getInt(1);
	        }
	        return count;  
	    }
	 
	 public boolean insertProduct(Product p) {
	        Connection connection = DBConnect.getConnection();
	        String sql = "INSERT INTO Product VALUES(?,?,?,?,?,?,?)";
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
	         ps.setString(1, p.getProductName());
	         ps.setDouble(2, p.getPrice());
	         ps.setString(3, "images/products/"+p.getProductImage());
	         ps.setString(4, p.getProductDescription());
	         ps.setString(5, p.getBrand());
	         ps.setInt(6, p.getCategoryID());
	         ps.setInt(7, p.getBranchID());
	         ps.executeUpdate();
	         return true;
	        } catch (SQLException e) {
	        	e.printStackTrace();
	        }
	        return false;
	    }

	    public boolean updateProduct(Product p) {
	        
	        Connection connection = DBConnect.getConnection();
	        String sql = "UPDATE Product SET  Product_Name=?, Product_Price=?, Product_Image=?, Product_Description=?, Brand=?, Category_ID=?, Branch_ID = ? WHERE Product_ID = ?";
	        
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
		         ps.setString(1, p.getProductName());
		         ps.setDouble(2, p.getPrice());
		         ps.setString(3, "images/products/"+p.getProductImage());
		         ps.setString(4, p.getProductDescription());
		         ps.setString(5, p.getBrand());
		         ps.setInt(6, p.getCategoryID());
		         ps.setInt(7, p.getBranchID());
		         ps.setInt(8, p.getProductID());
		         ps.executeUpdate();
		         return true;
		        } catch (SQLException e) {
		        	e.printStackTrace();
		        }
	        return false;
	    }

	    public boolean deleteProduct(int productID) {
	        Connection connection = DBConnect.getConnection();
	        String sql = "DELETE FROM Product WHERE Product_ID = ?";
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
	            ps.setLong(1, productID);
	            ps.executeUpdate();
	            return true;
	        } catch (SQLException e) {
	        	e.printStackTrace();
	        }
        return false;
	    }
	public static void main(String[] args) throws SQLException {
		ProductDAO p = new ProductDAO();
		//p.insertProduct(new Product(0, "test", 100000, "images", "á", "adidas", 1, 1));
		//p.updateProduct(new Product(28, "thay", 200000, "thay", "kaka", "nike", 2, 2));
		//p.deleteProduct(28);
		System.out.println(p.getListProductByNav(1, 1, 6));
	}
}
