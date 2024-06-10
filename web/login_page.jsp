<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Paqe</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
/*            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }*/

            .light-mode {
                background-color: #E5E5E5; /* BG*/
                color: black;
            }
            .dark-mode {
                background-color: #212121;
                color: white;
            }
            .dark-mode .navbar {
                background-color: #333333;
                border-color: #444;
            }
            .dark-mode .card {
                background-color: #333333;
                color: white;
            }
            .dark-mode .banner-background {
                background-color: #333333;
                color: white;
            }
            .dark-mode .btn {
                background-color: #333333;
                color: white;
            }
            .dark-mode .form-control{
                background-color: #333333;
                color: #ffffff;
            }
            .dark-mode #background{
                background-color: #212121;
            }
            .dark-mode #ddmenu{
                background-color: #333333;
                color: white;
            }

        </style>

    </head>
    <body>

        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>   Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link"  onclick="showAlert()"  > <span class="fa fa-bell-o"></span> Code World <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="	fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" id="ddmenu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" id="ddmenu" target="_blank" href="programming_languages.jsp">Programming Language</a>
                            <div class="dropdown-divider" id="ddmenu"></div>
                            <a class="dropdown-item" id="ddmenu" target="_blank" href="https://www.geeksforgeeks.org/learn-data-structures-and-algorithms-dsa-tutorial/">Data Structure</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp"> <span class="	fa fa-address-card-o"></span> Contact US</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login_page.jsp"> <span class="fa fa-user-circle "></span> Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register_page.jsp"> <span class="fa fa-user-plus "></span> Sign up</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="contributors.jsp"> <span class="fa fa-users "></span> Our contributers </a>

                    </li>

                </ul>
                <ul class="navbar-nav mr-right">

                    <li class="nav-item">
                        <a id="modeToggle" class="btn-primary nav-link">Toggle Dark Mode</a>
                    </li>

                </ul>

            </div>
        </nav>


        <main class="d-flex align-items-center banner-background" id="background" style="height: 70vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">

                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p>Login here</p>
                            </div>

                            <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert <%= m.getCssClass()%>" role="alert">
                                <%= m.getContent()%>
                            </div> 


                            <%
                                    session.removeAttribute("msg");
                                }

                            %>



                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        <i onclick="myFunction()" class="fa fa-eye"> </i>

                                    </div>

                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>

                            </div>


                        </div>



                    </div>


                </div>

            </div>

        </main>



        <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
                                            document.addEventListener('DOMContentLoaded', function () {
                                                const modeToggle = document.getElementById('modeToggle');
                                                const body = document.body;

                                                // Load user's preference from localStorage
                                                const currentMode = localStorage.getItem('theme') || 'light';
                                                body.classList.add(currentMode + '-mode');

                                                // Update button text
                                                modeToggle.textContent = currentMode === 'dark' ? 'Light Mode' : 'Dark Mode';

                                                // Function to update colors based on mode
                                                function updateColors(mode) {
                                                    if (mode === 'dark') {
                                                        body.classList.remove('light-mode');
                                                        body.classList.add('dark-mode');
                                                    } else {
                                                        body.classList.remove('dark-mode');
                                                        body.classList.add('light-mode');
                                                    }
                                                }

                                                // Update colors based on initial mode
                                                updateColors(currentMode);

                                                modeToggle.addEventListener('click', function () {
                                                    const newMode = body.classList.contains('dark-mode') ? 'light' : 'dark';
                                                    localStorage.setItem('theme', newMode);
                                                    updateColors(newMode);
                                                    modeToggle.textContent = newMode === 'dark' ? 'Light Mode' : 'Dark Mode';
                                                });
                                            });



//show password
                                            function myFunction() {
                                                var x = document.getElementById("exampleInputPassword1");
                                                if (x.type === "password") {
                                                    x.type = "text";
                                                } else {
                                                    x.type = "password";
                                                }
                                            }

        </script>

    </body>
</html>
