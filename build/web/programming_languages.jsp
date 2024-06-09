<%-- 
    Document   : programming_languages
    Created on : 10-Feb-2024, 12:17:34?pm
    Author     : Rohit Khanra
--%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title> Programming Languages </title>
<%--<%@include file="normal_navbar.jsp" %>--%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!--NAVBAR-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>   Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link"  onclick="showAlert()"  > <span class="fa fa-bell-o"></span> Code With Pain <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="	fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" target="_blank" href="programming_languages.jsp">Programming Language</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" target="_blank" href="https://www.geeksforgeeks.org/learn-data-structures-and-algorithms-dsa-tutorial/">Data Structure</a>
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
                    <li class="nav-item">
                        <a id="modeToggle" class="nav-link">Toggle Dark Mode</a>
                    </li>
                </ul>

            </div>
        </nav>




<!-- Theme Toggle Button -->
<!--<div class="container mt-3 text-right">
    <button id="modeToggle" class="btn btn-secondary">    </button>
</div>-->

<div class="container">
    <div class="row mb-2">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Programming Languages</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="https://www.coursera.org/articles/types-programming-language" target="_blank" class="btn btn-primary">Read more</a>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Programming Languages - ALL</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="https://en.wikipedia.org/wiki/List_of_programming_languages" target="_blank" class="btn btn-primary">Read more</a>
                </div>
            </div>
        </div>
    </div>
</div>

<p class="text-center mt-5 mb-5">
    <a href="index.jsp">Back to Main</a>
</p>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

<style>
/* Body styles for light and dark mode */
body.light-mode {
/*    background-color: #212121;  
    color: #fff;*/
}

body.dark-mode {
    background-color: #212121;  
    color: white;
}

/* Card styles for light and dark mode */
.card.light-mode, .card-header.light-mode, .card-body.light-mode {
/*    background-color: white;
    color: black;*/
}

.dark-mode .card{
    background-color: #333333;  
    color: white;
}

/* Margin for secondary buttons */
.btn-secondary {
/*    margin-left: 10px;*/
}

/* Dark mode specific styles */
.dark-mode .navbar {
/*    background-color: #333333;  dark gray 
    border-color: #444;  lighter gray */
}

.dark-mode .banner-background {
/*    background-color: #1e1e1e;  almost black 
    color: white;*/
}

.dark-mode .btn {
    background-color: #333333;  
    color: white;
    border: 1px solid #of77ff;
}

/* Hover effect for buttons in dark mode */
.dark-mode .btn:hover {
/*    background-color: #555;  slightly lighter gray 
    color: white;*/
}

/* Accent color for links in light mode */
.light-mode a {
/*    color: #007bff;  Bootstrap's primary blue color */
}

</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const toggleButton = document.getElementById('modeToggle');
        const body = document.body;

        // Load saved theme from localStorage
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
</script>
