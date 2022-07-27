package com.blogProject.Dao;

import com.blogProject.entities.User;
import java.sql.*;

public class userDao {

    private Connection con;

    public userDao(Connection con) {
        this.con = con;
    }

    // to insert user to database
    public boolean saveUser(User user) {
        boolean f = false;
        try {

            String query = "insert into user (name,email,password,gender,about,securityques) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.setString(6, user.getSecurityans());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {

            e.printStackTrace();
        }
        return f;

    }

    // get user by user email and user password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = " select * from user where email=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();
                // putting data into user
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                user.setSecurityans("securityques");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    // in case if user forgot id or password
    public User getUserBySecurityAnswer(String securityans) {
        User user = null;
        try {
            String query = " select * from user where securityques=?";
            PreparedStatement pstmt = con.prepareStatement(query);
           pstmt.setString(1, securityans);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();
                // putting data into user
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                user.setSecurityans(set.getString("securityques"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean updateUser(User user)
    {  boolean flag=false;
        try {
            String query=" update user set name=?,password=?,about=?,profile=?,email=? where id=?  ";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getPassword());
            pstmt.setString(3,user.getAbout());
           pstmt.setString(4,user.getProfile());
                    pstmt.setString(5,user.getEmail());
            pstmt.setInt(6,user.getId());
            pstmt.executeUpdate();
            flag=true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public User getUserByUserId(int uid)
    {
    User user=null;
          try {
String q="select * from user where id=? ";
PreparedStatement pstmt=con.prepareStatement(q);
pstmt.setInt(1, uid);
ResultSet set=pstmt.executeQuery();
if(set.next())
{
    user=new User();
 user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                user.setSecurityans(set.getString("securityques"));


}
        } catch (Exception e) {
            e.printStackTrace();
        } 
    
    
    return user;
    }

}
