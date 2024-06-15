package com.tech.blog.servlets;

import com.tech.blog.dao.AdminDao;
import com.tech.blog.entities.Admin;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RedirectionToAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String adminId = request.getParameter("adminid");
        String adminEmail = request.getParameter("adminemail");
        String adminPassword = request.getParameter("adminpassword");
        String adminPasscode = request.getParameter("adminpasscode");

        // Create AdminDao object
        AdminDao adminDao = new AdminDao(ConnectionProvider.getConnection());

        // Retrieve admin from the database
        Admin admin = adminDao.getAdminByIdAndPassword(adminId, adminPassword, adminPasscode, adminEmail);

        // Validate credentials
        if (admin != null) {
            // Credentials are valid, set message as request attribute
            request.setAttribute("loginMessage", "Login successful!");

            // Forward to admin.jsp
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
        } else {
            // Invalid credentials, redirect back to login page with error message
            response.sendRedirect(request.getContextPath() + "/goAdmin.jsp?error=Invalid credentials");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Admin login servlet";
    }
}
