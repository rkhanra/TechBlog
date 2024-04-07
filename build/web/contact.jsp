<%-- 
    Document   : contact
    Created on : 10-Feb-2024, 12:10:32?am
    Author     : Rohit Khanra
--%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>




<%@include file="normal_navbar.jsp" %>

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

    function redirectToDialer() {
        var phoneNumber = "+918328739231";
        window.location.href = "tel:" + phoneNumber;
    }

</script>

<style>
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
</style>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<div class="container">
    <div class="row">




        <div class="col">
            <div class="card">
                <div class="card-header bg-primary text-white"><i class="fa fa-envelope"></i> Raise a problem
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
                            <label for="message">Description</label>
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



        <script>

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


        </script>





        <div class="col-12 col-sm-4">
            <div class="card bg-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-home"></i> Reach US </div>
                <div class="card-body">
                    <p>3 rue des Champs Elysées</p>
                    <p>75008 PARIS</p>
                    <p>France</p>
                    <p>Email: <a href="javascript:void(0);" onclick="sendEmail();">rohitkhanra425@hotmail.com</a></p>

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

