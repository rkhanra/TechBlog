<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.tech.blog.entities.Message" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Bootstrap CSS -->    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Admin Login</title>
    <link href="css/admin.css" rel="stylesheet" type="text/css"/>
    <script src="js/admin.js" type="text/javascript"></script>
</head>
<body>
    <main class="d-flex align-items-center" id="background" style="height: 70vh">
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card" id="dark">    
                        <div class="card-body">
                            <form action="RedirectionToAdmin" class="dark" method="post">
                                <div class="form-group">
                                    <label for="adminid">Admin ID</label>
                                    <input name="adminid" required class="form-control" id="adminid" placeholder="" id="dark">
                                </div>
                                <div class="form-group">
                                    <label for="adminemail">Email</label>
                                    <input name="adminemail" required type="email" class="form-control" id="adminEmail" placeholder="" id="dark">
                                </div>
                                <div class="form-group">
                                    <label for="adminpassword">Password</label>
                                    <input name="adminpassword" required type="password" class="form-control" id="adminPassword" placeholder="" id="dark">
                                </div>
                                <div class="form-group">
                                    <label for="adminpasscode">Pass Code</label>
                                    <input name="adminpasscode" required type="text" class="form-control" id="adminpasscode" placeholder="" id="dark">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-outline-primary">Submit</button>
                                </div>
                            </form>
                            <%
                                String error = request.getParameter("error");
                                if (error != null) {
                            %>
                            <div class="alert alert-danger mt-3" role="alert">
                                <%= error%>
                            </div>
                            <%
                                }
                                String message = request.getParameter("message");
                                if (message != null) {
                            %>
                            <div class="alert alert-success mt-3" role="alert">
                                <%= message%>
                            </div>
                            <%
                                }
                            %>
                            <div class="text-center mt-3">
                                <button id="modeToggle" class="btn btn-outline-secondary">Dark Mode</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
