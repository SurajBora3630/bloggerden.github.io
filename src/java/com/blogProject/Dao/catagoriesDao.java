/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blogProject.Dao;

import com.blogProject.entities.catagories;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class catagoriesDao {
     Connection con;

    public catagoriesDao(Connection con) {
        this.con = con;
    }
     

   

     
     
//// methods     
    public catagories getCatagoryNameByCatagoryId(int cid)
    { 
    catagories catagory=null;
        try {
String q="select * from catagories where cid=?";
PreparedStatement pstmt=con.prepareStatement(q);
pstmt.setInt(1, cid);
ResultSet set=pstmt.executeQuery();

if(set.next())
{catagory=new catagories();
    String name=set.getString("name");
    String description=set.getString("description");
    String refrenceLink=set.getString("refrenceLink");
    catagory.setName(name);
    catagory.setDescription(description);
    catagory.setRefrenceLink(refrenceLink);

}
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    return catagory;
    }
}
