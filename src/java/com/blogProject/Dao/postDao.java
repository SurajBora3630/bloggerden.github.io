package com.blogProject.Dao;

import com.blogProject.entities.catagories;
import com.blogProject.entities.posts;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class postDao {

    Connection con;

    public postDao(Connection con) {
        this.con = con;
    }

    public ArrayList<catagories> getAllCatagories() {
        ArrayList<catagories> list = new ArrayList<>();
        try {
            String query = "select * from catagories";
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(query);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                String refrenceLink = set.getString("refrenceLink");
                catagories c = new catagories(cid, name, description, refrenceLink);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    

////////////////////////////////////////////
    public boolean savePost(posts p) {
        boolean flag = false;
        try {
            String q = "insert into posts(pTitle,pContent,Pcode,pPic,catId,uId)values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getuId());
            pstmt.executeUpdate();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public List<posts> getAllPosts() {// get all posts
        List<posts> list = new ArrayList<>();
        try {

            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");  // to get the latest posts
            ResultSet set = p.executeQuery();
            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                String pContent = set.getString("pContent");
                Timestamp pDate = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int uId = set.getInt("uId");
                posts ppost = new posts(pid, pTitle, pContent, pCode, pPic, pDate, catId, uId);
                list.add(ppost);  // all details of a row will be added to list

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<posts> getPostByCatId(int catId) {// get posts of user
        List<posts> list = new ArrayList<>();
        try {
            PreparedStatement p = con.prepareStatement("select * from posts where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();
            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                String pContent = set.getString("pContent");
                Timestamp pDate = set.getTimestamp("pDate");

                int uId = set.getInt("uId");
                posts ppost = new posts(pid, pTitle, pContent, pCode, pPic, pDate, catId, uId);
                list.add(ppost);  // all details of a row will be added to list

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
   //////////////////////////////////////////////////////
    public posts getPostByPostId(int PostId)
    {
    posts post=null;
        try {
            String query= "select * from posts where pid=?";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setInt(1,PostId);
            ResultSet set=pstmt.executeQuery();
            if(set.next())
            {
               int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                String pContent = set.getString("pContent");
                Timestamp pDate = set.getTimestamp("pDate");
                int cid=set.getInt("catId");

                int uId = set.getInt("uId");
                 post = new posts(pid, pTitle, pContent, pCode, pPic, pDate, cid, uId); 
            
            
            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }
    
    return post;
    
    }
    
}
