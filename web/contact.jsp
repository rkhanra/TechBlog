<%-- 
    Document   : contact
    Created on : 10-Feb-2024, 12:10:32?am
    Author     : Rohit Khanra
--%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title> Contact US </title>



        <nav class="navbar navbar-expand-lg navbar-dark" id="navbar">
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
                        <a id="modeToggle" class="nav-link">Toggle Dark Mode</a>
                    </li>

                </ul>

            </div>
        </nav>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!--script for mail redirection  and dailer      -->

<script>

                    function sendEmail() {
                        var isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
                        var email = "rohitkhanra425@hotmail.com";

                        if (isMobile) {
                            // Redirect to Gmail on mobile
                            window.location.href = "https://mail.google.com/mail/?view=cm&fs=1&to=" + email;
                        } else {
                            // Open default mail client on desktop
                            window.location.href = "mailto:" + email;
                        }
                    }

                    //contact script

                    function redirectToDialer() {
                        var phoneNumber = "+918328739231";
                        window.location.href = "tel:" + phoneNumber;
                    }
                    function submitForm() {
                        // Check if the terms and conditions checkbox is checked
                        if (!$("input[name='check']").prop("checked")) {
                            window.alert("Please agree to the terms and conditions.");
                            return;
                        }

                        // Validate form fields
                        var name = $("#name").val().trim();
                        var email = $("#email").val().trim();
                        var message = $("#message").val().trim();

                        if (name === "" || email === "" || message === "") {
                            window.alert("Please fill in all required fields.");
                            return;
                        }

                        // Serialize form data
                        var formData = $("#repform").serialize();

                        // Set the form action to "ReportServlet" and method to "POST"
                        $("#repform").attr("action", "ReportServlet");
                        $("#repform").attr("method", "POST");

                        // Check if the form has been submitted
                        if ($("#repform").data("submitted")) {
                            window.alert("Form already submitted!");
                        } else {
                            // Submit the form
                            document.getElementById("repform").submit();

                            // Mark the form as submitted
                            $("#repform").data("submitted", true);

                            // Clear form fields
                            $("#repform")[0].reset();
                        }
                    }

                    document.addEventListener('DOMContentLoaded', function () {
                        const modeToggle = document.getElementById('modeToggle');
                        const body = document.body;

                        // Load user's preference from localStorage
                        const currentMode = localStorage.getItem('theme') || 'light-mode';
                        console.log('Current Mode:', currentMode); // Log the current mode

                        // Function to update colors based on mode
                        function updateColors(mode) {
                            if (mode === 'dark') {
                                body.classList.remove('light-mode');
                                body.classList.add('dark-mode');
                                modeToggle.textContent = 'Light Mode';

                            } else {
                                body.classList.remove('dark-mode');
                                body.classList.add('light-mode');
                                modeToggle.textContent = 'Dark Mode';

                            }
                        }

                        // Update colors based on initial mode
                        updateColors(currentMode);

                        // Function to toggle mode
                        function toggleMode() {
                            const newMode = body.classList.contains('dark-mode') ? 'light' : 'dark';
                            localStorage.setItem('theme', newMode);
                            updateColors(newMode);
                            console.log('New Mode:', newMode); // Log the new mode
                        }

                        // Event listener for mode toggle button
                        modeToggle.addEventListener('click', toggleMode);
                    });




</script>


<style>
    /* Light Mode */
    .light-mode {
        background-color: #E5E5E5;
        color: black;
    }
    .light-mode #navbar{
        background-color: #0F77FF;
    }
    .light-mode .navbar {
        background-color: #E5E5E5;
        color: black;
    }
    .light-mode .card, .light-mode .card-header, .light-mode .card-body {
        background-color: #f8f9fa;
        color: black;
    }
    .light-mode .btn {
        background-color: #E5E5E5;
        color: black;
    }
    .light-mode #background {
        background-color: #ffffff;
    }

    /* Dark Mode */
    .dark-mode {
        background-color: #212121;
        color: white;
    }
    .dark-mode .navbar {
        background-color: #333333;
        color: white;
    }
    .dark-mode .card, .dark-mode .card-body {
        background-color: #333333;
        color: white;
    }
    .dark-mode #header{
        background-color: #282828;
    }
    .dark-mode .btn {
        background-color: #333;
        color: white;
    }
    .dark-mode #background {
        background-color: #212121;
    }
    .dark-mode .form-control {
        background-color: #333333;
        color: white;
    }
    .dark-mode #ddmenu{
        background-color: #333333;
        color: white;
    }

</style>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<br>
<div class="container">
    <div class="row">




        <div class="col">
            <div class="card">
                <div class="card-header" id="header"><i class="fa fa-envelope"></i> Raise a problem
                </div>
                <div class="card-body">
                    <form action="ReportServlet" method="post" id="repform" >
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" name="rname" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter your name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" name="remail" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter your email" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="message">Description *</label>
                            <textarea class="form-control" name="message" id="message" rows="6" required></textarea>
                        </div>
                        <div class="form-check">
                            <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1" required>
                            <label class="form-check-label" for="exampleCheck1" >agree terms and conditions</label>
                        </div> <br>
                        <div class="mx-auto">
                            <button id="submit-btn" type="submit" onclick="submitForm();" class="btn btn-primary text-right">Report an issue</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>


        <div class="col-12 col-sm-4">
            <div class="card mb-3">
                <div class="card-header text-uppercase" id="header"><i class="fa fa-home"></i> Reach US </div>
                <div class="card-body">
                    <p>Rohit Khanra</p>
                    <p>Taraswar, 712415</p>
                    <p>India</p>
                    <p>Email: <a href="javascript:void(0);" onclick="sendEmail();">rohitkhanra420@gmail.com</a></p>

                    <a onclick="redirectToDialer();" <span>Tel.  </span> +918328739231</a>

                </div>

            </div>

        </div>
    </div>
</div>

<!-- Footer -->
<footer class="text-light">
    <div class="container">
        <div class="row">

            <div class="col-12 copyright mt-3">
                <!--                <p class="float-left mt-5 mb-5 ">
                                    <a href="#">Back to top</a>
                                </p>-->

                <p class="text-center mt-5 mb-5">
                    <a href="index.jsp"> * Back to Main * </a>
                </p>   

            </div>
        </div>
    </div>
</footer>

