package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rohit Khanra
 */
public class DeleteAccountServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Fetch user from session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

            if (user == null) {
                out.println("error: User not logged in");
                return;
            }

            // Delete user from database
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean result = userDao.deleteUser(user.getId());

            if (result) {
                // Invalidate session
                session.removeAttribute("currentUser");
                session.invalidate();
                out.println("success");
            } else {
                out.println("error: Could not delete user");
            }
        } catch (Exception e) {
            e.printStackTrace();
            try (PrintWriter out = response.getWriter()) {
                out.println("error: " + e.getMessage());
            }
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
        return "DeleteAccountServlet handles user account deletion";
    }
}
