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

//    function openAutoCloseAlert() {
//        Swal.fire({
//            title: "Thanks",
//            text: "For using our blog site closing soon.",
//            icon:"success",
//            timer: 2500,
//            onOpen: function () {
//                Swal.showLoading();
//            }
//        }).then(function (result) {
//            if (result.dismiss === "timer") {
//                console.log("I was closed by the timer");
//            }
//        });
//    }
//
//    $("#kt_sweetalert_demo_11").click(function (e) {
//        openAutoCloseAlert();
//    });
</script>



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

        </ul>

    </div>
</nav>

