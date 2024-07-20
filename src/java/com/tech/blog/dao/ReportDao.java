/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Report;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rohit Khanra
 */
public class ReportDao {

    private Connection con;

    public ReportDao(Connection con) {
        this.con = con;
    }

    //method to insert report to database
    public boolean saveReport(Report report) {
        boolean f = false;

        try {
            String query = "INSERT INTO reports(rname, remail, message) VALUES (?, ?, ?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, report.getRname());
            pstmt.setString(2, report.getRemail());
            pstmt.setString(3, report.getMessage());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    // Method to retrieve all reports from the database
    public List<Report> getAllReports() {
        List<Report> reports = new ArrayList<>();

        try {
            String query = "SELECT * FROM reports";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String rname = rs.getString("rname");
                String remail = rs.getString("remail");
                String message = rs.getString("message");

                Report report = new Report(rname, remail, message);
                reports.add(report);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return reports;
    }

    // Method to delete a report by its ID
    public boolean deleteReportById(int id) {
        boolean f = false;

        try {
            String query = "DELETE FROM reports WHERE id = ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, id);

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}
