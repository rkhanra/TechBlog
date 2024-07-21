package com.tech.blog.dao;

import com.tech.blog.entities.Report;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReportDao {

    private Connection con;

    public ReportDao(Connection con) {
        this.con = con;
    }

    // Method to save a report to the database
    public boolean saveReport(Report report) {
        boolean success = false;
        String query = "INSERT INTO reports(rname, remail, message) VALUES (?, ?, ?)";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, report.getRname());
            pstmt.setString(2, report.getRemail());
            pstmt.setString(3, report.getMessage());

            int rowsAffected = pstmt.executeUpdate();
            success = rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    // Method to retrieve all reports from the database
    public List<Report> getAllReports() {
        List<Report> reports = new ArrayList<>();
        String query = "SELECT * FROM reports";

        try (PreparedStatement pstmt = con.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String rname = rs.getString("rname");
                String remail = rs.getString("remail");
                String message = rs.getString("message");
                Timestamp rdate = rs.getTimestamp("rdate");
                boolean processed = rs.getBoolean("processed");

                Report report = new Report(id, rname, remail, message, rdate, processed);
                reports.add(report);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reports;
    }

    // Method to mark a report as processed
    public boolean markReportAsProcessed(int id) {
        boolean success = false;
        String query = "UPDATE reports SET processed = 1 WHERE id = ?";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            success = rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    // Method to delete a report by its ID
    public boolean deleteReportById(int id) {
        boolean success = false;
        String query = "DELETE FROM reports WHERE id = ?";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            success = rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }
}
