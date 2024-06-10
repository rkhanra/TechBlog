<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
            /* Apply styles to the entire webpage scrollbar */
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

            /* Dark mode styles */
            .light-mode {
                background-color: #E5E5E5;  /* BG*/
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
            /* Dark mode scrollbar styles */
            .dark-mode body::-webkit-scrollbar-track {
                background-color: #333;
                border: 1.5px solid #444;
            }

            .dark-mode body::-webkit-scrollbar-thumb {
                background-color: #555;
                border: 2px solid #333;
            }
            .dark-mode #ddmenu{
                background-color: #333333;
                color: white;
            }
        </style>
    </head>
    <body>

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

        <main class="banner-background" id="background" style="padding-bottom: 80px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register here
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                    <i onclick="myFunction()" class="fa fa-eye"> </i>

                                    <small id="passwordHelp" class="form-text text-muted">Password must be at least 6 characters long and include a combination of uppercase, lowercase, number, and symbol.</small>
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio" id="gender" name="gender" value="male"> Male
                                    <input type="radio" id="gender" name="gender" value="famale"> Female
                                </div>
                                <div class="form-group">
                                    <textarea name="about" class="form-control" id="" rows="5" placeholder="Enter something about yourself"></textarea>
                                </div>
                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree to terms and conditions</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait..</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
                                        $(document).ready(function () {
                                            console.log("loaded........");

                                            function validatePassword(password) {
                                                const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>~`])[A-Za-z\d!@#$%^&*(),.?":{}|<>~`]{6,}$/;
                                                return regex.test(password);
                                            }


                                            $('#reg-form').on('submit', function (event) {
                                                event.preventDefault();

                                                const password = $('#exampleInputPassword1').val();

                                                if (!validatePassword(password)) {
                                                    swal("Password must be at least 6 characters long and include a combination of uppercase, lowercase, number, and symbol.");
                                                    return;
                                                }

                                                let form = new FormData(this);

                                                $("#submit-btn").hide();
                                                $("#loader").show();

                                                // Send register servlet
                                                $.ajax({
                                                    url: "RegisterServlet",
                                                    type: 'POST',
                                                    data: form,
                                                    success: function (data, textStatus, jqXHR) {
                                                        console.log(data);

                                                        $("#submit-btn").show();
                                                        $("#loader").hide();

                                                        if (data.trim() === 'done') {
                                                            swal("Registered successfully..We are going to redirect to login page\n Please remember your email and password we don't allow to reset it yet")
                                                                    .then((value) => {
                                                                        window.location = "login_page.jsp";
                                                                    });
                                                        } else {
                                                            swal(data);
                                                        }
                                                    },
                                                    error: function (jqXHR, textStatus, errorThrown) {
                                                        $("#submit-btn").show();
                                                        $("#loader").hide();
                                                        swal("Something went wrong..try again");
                                                    },
                                                    processData: false,
                                                    contentType: false
                                                });
                                            });
                                        });
        </script>
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
