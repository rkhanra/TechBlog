/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Rohit Khanra
 */
public class AdminDao {

    private Connection con;

    public AdminDao(Connection con) {
        this.con = con;
    }

    public Admin getAdminByIdAndPassword(String adminId, String adminPassword, String adminPasscode, String adminEmail) {
        Admin admin = null;
        try {
            String query = "SELECT * FROM admin WHERE admin_id=? AND admin_password=? AND admin_passcode=? AND admin_email=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, adminId);
            pstmt.setString(2, adminPassword);
            pstmt.setString(3, adminPasscode);
            pstmt.setString(4, adminEmail);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                admin = new Admin();
                admin.setAdminId(rs.getString("admin_id"));
                admin.setAdminPassword(rs.getString("admin_password"));
                admin.setAdminPasscode(rs.getString("admin_passcode"));
                admin.setAdminEmail(rs.getString("admin_email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }

}
