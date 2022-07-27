
package com.blogProject.helper;
import java.sql.*;

public class connectionProvider {
    private static Connection con;

    public static Connection getConnection() {
        try{
            if(con==null)   // only create connection when con is null
            {
        Class.forName("com.mysql.cj.jdbc.Driver");// loading driver
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/enigmaBlog"
                ,"root","4184100");
            }
        
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
        return con;
    }
    
    
}
