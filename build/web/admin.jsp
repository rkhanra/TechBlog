<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="com.tech.blog.dao.UserDao" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entities.User" %>
<%@ page errorPage="error_page.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="css/admin.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            .admin-actions {
                position: absolute;
                top: 10px;
                right: 10px;
            }
        </style>

        <script>
            function confirmDeletion(form) {
                // Show confirmation alert
                if (confirm("Are you sure you want to delete this user?")) {
                    form.submit();
                }
            }

            function showAlert(message) {
                alert(message);
            }

            function checkDeleteResult() {
                var status = '<%= session.getAttribute("deleteStatus")%>';
                if (status) {
                    var message = status === 'success' ? 'User deleted successfully.' : 'Welcome to admin console';
                    showAlert(message);
                    // Clear the session attribute after displaying the alert
            <% session.removeAttribute("deleteStatus"); %>
                }
            }

            window.onload = checkDeleteResult;
        </script>
    </head>
    <body>
        <form action="AdminLogoutServlet" method="post">
            <button type="submit">Logout</button>
        </form>
        <%
            // Set a session attribute before redirecting to reports.jsp
            session.setAttribute("fromAdmin", "true");
        %>
        <div class="admin-actions">
            <a href="reports.jsp" class="btn btn-primary">Reports</a>
        </div>
        <div>
            <%
                response.setHeader("Cache-Control", "no-cache, no-store");

                String loginMessage = (String) request.getAttribute("loginMessage");
                if (loginMessage != null && !loginMessage.isEmpty()) {
            %>
            <div class="login-message">
                <%= loginMessage%>
            </div>
            <% } %>
            <div class="container">
                <div class="row">
                    <%
                        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                        List<User> userList = userDao.getAllUsers();
                        if (userList != null && !userList.isEmpty()) {
                            for (User user : userList) {
                    %>
                    <div class="col-md-4 mb-2"> <!-- Increased width to col-md-4 for wider cards -->
                        <div class="card" style="width: 100%;" id="dark"> <!-- Set width to 100% for full-width cards -->
                            <img style="object-fit: cover; height: 200px; width: 100%;" src="pics/<%= user.getProfile()%>" class="card-img-top" alt="<%= user.getName()%>'s profile picture"> <!-- Adjusted height and width of image -->
                            <div class="card-body">
                                <p>ID: <%= user.getId()%></p>
                                <p><%= user.getName()%></p>
                                <p class="card-text"><%= user.getEmail()%></p>
                                <p>Password: <%= user.getPassword()%></p>
                                <div class="d-flex justify-content-between align-items-center mt-3">
                                    <div>
                                        <a href="mailto:<%= user.getEmail()%>" class="btn btn-outline-primary mr-2">Contact</a> <!-- Added margin to Contact button -->
                                        <a href="user_posts.jsp?userid=<%= user.getId()%>&username=<%= user.getName()%>" class="btn btn-outline-primary mr-2">Posts</a> <!-- Added margin to Posts button -->
                                    </div>
                                    <form action="DeleteUserServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="userId" value="<%= user.getId()%>">
                                        <button type="button" class="btn btn-outline-danger" style="margin-left: 2px;" onclick="confirmDeletion(this.form)">Delete Account</button> <!-- Adjusted margin left -->
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <div class="col-md-12">
                        <p>No users found</p>
                    </div>
                    <% }%>
                </div>
            </div>

        </div>
    </body>
</html>
