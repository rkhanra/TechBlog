<%-- 
    Document   : account_deletion
    Created on : 25 May 2024, 8:41:58?pm
    Author     : Rohit Khanra
--%>

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <title>Are you sure to leave?</title>
    </head>
    <body>

        <form>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Name</label>
                <input type="text" class="form-control" name="name" id="name" aria-describedby="emailHelp">

            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email</label>
                <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp">

            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" id="password">
            </div>

            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Reason</label>
                <input type="text" class="form-control" name="reason" id="reason" aria-describedby="emailHelp">

            </div>
            <button type="submit" onclick="submitForm();" class="btn btn-primary">request for deletion</button>
        </form>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>

        <script>

            function submitForm() {

                // Validate form fields
                var name = $("#name").val().trim();
                var email = $("#email").val().trim();
                var password = $("#password").val().trim();
                var reason = $("#reason").val().trim();

                if (name === "" || email === "" || password === "" || reason === "") {
                    window.alert("Please fill in all required fields.");
                    return;
                }

                // Serialize form data
                var formData = $("#repform").serialize();

                // Set the form action to "ReportServlet" and method to "POST"
                $("#repform").attr("action", "AccountDeleteServlet");
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