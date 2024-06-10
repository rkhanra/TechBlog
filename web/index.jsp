<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>

        <!-- CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }

            #backgroundd{
                background-color: #CDCFD0;
            }

            /* Sticky navbar */
            #navbar {
                position: sticky;
                top: 0;
                z-index: 1000;
            }

            body::-webkit-scrollbar {
                width: 12px;
            }
            body::-webkit-scrollbar-track {
                background-color: transparent;
                border: 1.5px solid #7e7e7e;
                border-radius: 8px;
            }
            body::-webkit-scrollbar-thumb {
                background-color: #f1f1f1;
                border: 2px solid #616161;
                border-radius: 8px;
            }

            /*            .back {
                            background-color: #E5E5E5;
                        }*/

            .progress-container {
                width: 100%;
                position: fixed;
                top: 0;
                background-color: #929191;
                z-index: 99;
                display: none;
            }
            .progress-bar {
                height: 5px;
                background-color: red;
                width: 100%;
                z-index: 99;
            }

            .light-mode {
                /*                background-color: #c1e0f9;*/
                background-color: #E9ECEF;
                color: black;
            }
            .dark-mode {
                background-color: #333333;
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
                background-color: #1e1e1e;
                color: white;
            }
            .dark-mode .btn {
                background-color: #333;
                color: white;
                border: 1px solid #0f77ff;
            }
            .dark-mode #backgroundd{
                background-color: #1A1A1A;
            }
            .dark-mode #background{
                background-color: #212121;
            }
            .dark-mode #preview{
                background-color: #212121;
            }
            .dark-mode #ddmenu{
                background-color: #333333;
                color: white;
            }
        </style>
    </head>
    <body class="back light-mode">
        <!-- Navbar -->
        <!--cdn for alert-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script type="text/javascript">

            function showAlert() {
                Swal.fire({
                    title: 'Thanks',
                    text: 'for using our blog site!',
                    icon: 'success',
                    timer: "2500",
                    confirmButtonText: 'OK'
                });
            }

        </script>


        <!--<nav class="navbar navbar-expand-lg navbar-dark primary-background " style="background-color: #05f6fe;">-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background" id="navbar" style="background-color: #0F77FF; ">
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
                            <a class="dropdown-item" target="_blank" id="ddmenu" href="programming_languages.jsp">Programming Language</a>
                            <div class="dropdown-divider" id="ddmenu"></div>
                            <a class="dropdown-item" target="_blank" id="ddmenu" href="https://www.geeksforgeeks.org/learn-data-structures-and-algorithms-dsa-tutorial/">Data Structure</a>
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



        <div class="progress-container">
            <div class="progress-bar" id="myBar"></div>
        </div>

        <div class="content" >
            <div class="container-fluid p-0 m-0">
                <div class="jumbotron banner-background" id="backgroundd">
                    <div class="container">
                        <h3 class="display-3">Welcome to TechBlog</h3>
                        <p>Welcome to technical blog, world of technology. A programming language is a formal language, which comprises a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>
                        <p>Our goal is to spread software knowledge using a open community where user can create account and post based on their knowledge and other's can post as well as share their opinion on post's.</p>
                        <a class="btn btn-outline-dark btn-lg" href="register_page.jsp"> <span class="fa fa-user-plus"></span> Start! It's Free</a>
                        <a href="login_page.jsp" class="btn btn-outline-dark btn-lg"> <span class="fa fa-user-circle fa-spin"></span> Login</a>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row mb-2">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Java Programming</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="https://www.javatpoint.com/java-tutorial" target="_blank" class="btn btn-primary">Read more</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Javascript</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="https://www.geeksforgeeks.org/javascript/" target="_blank" class="btn btn-primary">Read more</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Fullstack Development</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="https://www.geeksforgeeks.org/what-is-full-stack-development/" target="_blank" class="btn btn-primary">Read more</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Advance Java</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="https://www.geeksforgeeks.org/what-is-advanced-java/" target="_blank" class="btn btn-primary">Read more</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Database Design</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="https://www.geeksforgeeks.org/database-design-in-dbms/" target="_blank" class="btn btn-primary">Read more</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Web Development</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="https://www.geeksforgeeks.org/web-development/" target="_blank" class="btn btn-primary">Read more</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
            <span class="d-block p-2 blog-preview-span text-dark bg-white text-center" id="preview" style="font-family: serif;">Blog Preview</span>

            <div class="d-flex justify-content-center mt-5">
                <a href="#bottom" id="scrollButton" class="p-2 rounded text-center">Check Oldest Blog &darr;</a>
            </div>
            <br><br>
            <%@include file="all_posts.jsp" %>
        </div>

        <p class="text-center mt-5 mb-5">
            <a href="index.jsp" id="backToTop">Back to top &#8593;</a>
        </p>

        <script>
            // Function to hide scroll buttons
            function hideScrollButtons() {
                document.getElementById("scrollButton").style.display = "none";
                document.getElementById("backToTop").style.display = "none";
            }

            // Check if "No Posts Available" message is displayed
            var noPostsMessage = "<h3 class=\"text-center\">No Posts Available</h3>";

            if (document.body.innerHTML.indexOf(noPostsMessage) !== -1) {
                hideScrollButtons();
            }


            //dark mode script
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
                    const blogPreviewSpan = document.querySelector('.blog-preview-span');
                    if (mode === 'dark') {
                        blogPreviewSpan.classList.remove('text-dark');
                        blogPreviewSpan.classList.add('text-light');
                        blogPreviewSpan.classList.remove('bg-white');
                        blogPreviewSpan.style.backgroundColor = '#1A1A1A';

                    } else {
                        blogPreviewSpan.classList.remove('text-light');
                        blogPreviewSpan.classList.add('text-dark');
                        blogPreviewSpan.classList.remove('bg-dark');
                        blogPreviewSpan.classList.add('bg-white');
                    }
                }

                // Update colors based on initial mode
                updateColors(currentMode);

                modeToggle.addEventListener('click', function () {
                    if (body.classList.contains('dark-mode')) {
                        body.classList.replace('dark-mode', 'light-mode');
                        localStorage.setItem('theme', 'light');
                        modeToggle.textContent = 'Dark Mode';
                        updateColors('light');
                    } else {
                        body.classList.replace('light-mode', 'dark-mode');
                        localStorage.setItem('theme', 'dark');
                        modeToggle.textContent = 'Light Mode';
                        updateColors('dark');
                    }
                });
            });


            //progress bar

            window.onscroll = function () {
                myFunction();
            };

            function myFunction() {
                var winScroll = document.documentElement.scrollTop || document.body.scrollTop;
                var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
                var scrolled = (winScroll / height) * 100;
                var progressBar = document.querySelector('.progress-bar');
                if (scrolled > 0) {
                    document.querySelector('.progress-container').style.display = "block";
                    progressBar.style.width = scrolled + "%";
                } else {
                    document.querySelector('.progress-container').style.display = "none";
                }
            }
        </script>

        <!-- JavaScript libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <div id="bottom"></div>
    </body>
</html>

