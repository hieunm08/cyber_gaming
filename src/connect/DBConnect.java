
package connect;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {
    
    public static Connection getConnection(){
        Connection conn = null;
        try {
        	String conStr = "jdbc:sqlserver://localhost:1433; databaseName=shop;integratedSecurity=true";
        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(conStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    
    public static void main(String[] args) {
        System.out.println(getConnection());
    }
    
}
