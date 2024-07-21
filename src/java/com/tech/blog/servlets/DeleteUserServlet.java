package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        boolean result = userDao.deleteUser(userId);
        
        // Set status as a session attribute
        String status = result ? "success" : "error";
        request.getSession().setAttribute("deleteStatus", status);

        // Redirect back to the admin page
        response.sendRedirect("admin.jsp");
    }
}
