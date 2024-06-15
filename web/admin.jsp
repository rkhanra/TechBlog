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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <script>
        // JavaScript function to check if login message is displayed
        function checkLoginMessage() {
            var loginMessageDiv = document.querySelector('.login-message');
            if (!loginMessageDiv || loginMessageDiv.innerText.trim() === '') {
                // Redirect to error page or login page if login message is not displayed
                window.location.href = 'error_page.jsp'; // Replace with your error page URL
            }
        }
        
        // Call the function when the page loads
        window.onload = checkLoginMessage;
    </script>
</head>
<body>
    <div>
        <%
            // Check if loginMessage attribute exists in request
            String loginMessage = (String) request.getAttribute("loginMessage");
            if (loginMessage != null && !loginMessage.isEmpty()) {
        %>
        <div class="login-message">
            <%= loginMessage %>
        </div>
        <% } %>

        <div class="container">
            <div class="row">
                <%  // Get the list of users
                    UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                    List<User> userList = userDao.getAllUsers();
                    if (userList != null && !userList.isEmpty()) {
                        for (User user : userList) {
                %>
                <div class="col-md-3">
                    <div class="card mb-3" style="width: 18rem;">
                        <img style="object-fit: cover; height: 150px; width: auto" src="pics/<%= user.getProfile()%>" id="card-img-top" alt="<%= user.getName()%>'s profile picture">
                        <div class="card-body">
                            <p>ID: <%= user.getId()%></p>
                            <p><%= user.getName()%></p>
                            <p class="card-text"><%= user.getEmail()%></p>
                            <p>Pass: <%= user.getPassword()%> </P>
                            <a href="mailto:<%= user.getEmail()%>">Contact</a>
                            <a href="user_posts.jsp?userid=<%= user.getId()%>&username=<%= user.getName()%>">Posts</a>
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

    </body>
</html>
