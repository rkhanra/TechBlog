/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;


import com.tech.blog.entities.Report;
import java.sql.*;
/**
 *
 * @author Rohit Khanra
 */
public class ReportDao {
    private Connection con;
    
    public ReportDao(Connection con){
        this.con = con;
    }
    
    //method to insert report to database
    public boolean saveReport(Report report){
        boolean f = false;
        
        try{
            String query = "INSERT INTO reports(rname, remail, message) VALUES (?, ?, ?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, report.getRname());
            pstmt.setString(2, report.getRemail());
            pstmt.setString(3, report.getMessage());
            
            pstmt.executeUpdate();
            f = true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
        
    }
    
    
}
