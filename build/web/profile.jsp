
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title><%=user.getName()%>'s profile</title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }

            body{
                background:url(img/bg.jpeg);
                background-size: cover;
                background-attachment: fixed;
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



            /*            PROGRESS BAR*/
            body,
            html {
                margin: 0;
                padding: 0;
                height: 100%;
                position: relative;
            }

            .progress-container {
                width: 100%;
                /* Adjust as needed */
                position: fixed;
                top: 0;
                background-color: #d2d1d1;
                z-index:99;
                display: none;
            }

            .progress-bar {
                height: 5px;
                /* Adjust as needed */
                color: red;
                background-color: #749597;
                width: 100%;
                z-index:99;
            }

            .modal-blur {
                backdrop-filter: blur(5px);
                background-color: rgba(0, 0, 0, 0.5); /* Adjust the opacity as needed */
            }

            /*            LIGHT AND DARK MODE*/
            body.dark-mode {
                background-color: #212121;
                color: #fff;
                background:url(img/dbg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            .navbar.dark-mode {
                background-color: #333;
            }
            .list-group-item.dark-mode {
                background-color: #333;
                color: #fff;
            }
            .modal-content.dark-mode {
                background-color: #333;
                color: #fff;
            }
            .form-control.dark-mode,
            .btn-outline-primary.dark-mode {
                background-color: #333;
                color: #fff;
                border-color: #666;
            }
            .dark-mode input[type=file]::file-selector-button{
                background-color: #333;
                color: #fff;
            }
            .dark-mode .btn {
                background-color: #333;
                color: white;
                border: 1px solid #0f77ff;
            }
            .dark-mode #deleteAccount{
                background-color: #333;
                border: 1px solid red;
            }
            .dark-mode #warning{
                background-color: #333333;
                color: #F0B509;
            }
            .dark-mode .dropdown-item {
                background-color: #333333;
                color: #ffffff;
            }
            .dark-mode .dropdown-menu{
                background-color: #333333;
            }
            .selected-item {
                border: 2px solid #0F77FF;
                border-radius: 5px;
            }
            /* Add any other elements you want to style in dark mode */
        </style></head>
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
                        <a class="nav-link" href="index.jsp"> <span class="fa fa-bell-o"></span> Code World <span class="sr-only">(current)</span></a>
                    </li>

                    <!--                    <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="	fa fa-check-square-o"></span> Categories
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                <a class="dropdown-item" target="_blank" href="programming_languages.jsp">Programming Language</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" target="_blank" href="https://www.geeksforgeeks.org/learn-data-structures-and-algorithms-dsa-tutorial/">Data Structure</a>
                                            </div>
                                        </li>-->
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp   "> <span class="	fa fa-address-card-o"></span> Contact</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" > <span class="	fa fa-asterisk"></span> Do Post</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="contributors.jsp"> <span class="fa fa-users "></span> Our contributers </a>

                    </li>

                </ul>

                <ul class="navbar-nav mr-right">

                    <li class="nav-item"> 
                        <a id="mode-toggle-btn" class="nav-link">Toggle Theme </a>
                    </li>

                    <li class="nav-item">

                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal">  <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;width: 30px; height: 30px; object-fit: cover;  " >
                            <%= user.getName()%> </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-sign-out"></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>



        <!--end of navbar-->
        <!-- Profile Picture Modal -->
        <div class="modal fade modal-blur" id="profile-pic-modal" tabindex="-1" role="dialog" aria-labelledby="profilePicModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" class="modal-dialog d-flex justify-content-center align-items-center">
                <div class="modal-content"> 
                    <div class="modal-header ">
                        <h5 class="modal-title mx-auto" id="profilePicModalLabel"><%= user.getName()%></h5>
                        <!--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>-->
                    </div>
                    <div class="modal-body">
                        <img id="profile-pic" src="" class="img-fluid" alt="Profile Picture">
                    </div>
                </div>
            </div>
        </div>
        <!-- End Profile Picture Modal -->



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



        <div class="progress-container">
            <div class="progress-bar" id="myBar"></div>
        </div>

        <!--//banner-->
        <div class="content">
            <!--main body of the page-->

            <main>
                <div class="container">
                    <div class="row mt-4">
                        <!--first col-->
                        <div class="col-md-4">
                            <!-- Categories dropdown -->
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="categoriesDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Categories
                                </button>
                                <div class="dropdown-menu" aria-labelledby="categoriesDropdown">
                                    <!-- All Posts -->
                                    <a class="dropdown-item active" href="#" onclick="getPosts(0, this)">All Posts</a>
                                    <!-- Loop through categories -->
                                    <%                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list1 = d.getAllCategories();
                                        for (Category cc : list1) {
                                    %>
                                    <a class="dropdown-item" href="#" onclick="selectCategory(this, <%= cc.getCid()%>)"><%= cc.getName()%></a>
                                    <% }%>
                                </div>
                            </div>
                        </div>




                        <!--second col-->
                        <div class="col-md-8" >
                            <!--posts-->
                            <div class="container text-center" id="loader">
                                <i class="fa fa-refresh fa-4x fa-spin"></i>
                                <h3 class="mt-2">Loading...</h3>
                            </div>

                            <div class=" tableBody container-fluid" id="post-container">

                            </div>

                        </div>

                    </div>

                </div>

            </main>

            <br><br>
            <!--            <div class="d-flex justify-content-center align-items-center" >
                            <a type="button" id="back-to-top-btn" href="#" class="btn btn-primary primary-background"  >Back to top &#8593;</a>
                        </div>
                        <br>-->

            <!--end main body of the page-->




            <!--profile modal-->



            <!-- Modal -->
            <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header primary-background text-white text-center">
                            <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container text-center">
                                <span class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal">
                                    <img src="pics/<%= user.getProfile()%>" 
                                         class="img-fluid" style="border-radius:50%;width: 150px; height: 150px; object-fit: cover;  "
                                         id="profile-pic-thumbnail">
                                    <br>
                                    <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>
                                </span>
                                <!--//details-->

                                <div id="profile-details">
                                    <table class="table">

                                        <tbody>
                                            <tr>
                                                <th scope="row"> ID :</th>
                                                <td> <%= user.getId()%></td>

                                            </tr>
                                            <tr>
                                                <th scope="row"> Email : </th>
                                                <td><%= user.getEmail()%></td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Gender :</th>
                                                <td><%= user.getGender()%></td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Status :</th>
                                                <td><%= user.getAbout()%></td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Registered on :</th>
                                                <td><%= user.getDateTime().toString()%></td>

                                            </tr>
                                        </tbody>
                                    </table>


                                </div>

                                <!--                                 Add this link wherever you want in your HTML 
                                                                <a href="myposts.jsp?userid=<%= user.getId()%>&userName=<%=user.getName()%>" class="btn btn-outline-primary">My Posts</a>-->


                                <!--profile edit-->

                                <div id="profile-edit" style="display: none;">
                                    <h3 class="mt-2">Please Edit Carefully</h3>
                                    <form action="EditServlet" method="post" enctype="multipart/form-data">
                                        <table class="table">
                                            <tr>
                                                <td>ID :</td>
                                                <td><%= user.getId()%></td>
                                            </tr>
                                            <tr>
                                                <td>Email :</td>
                                                <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                                            </tr>
                                            <tr>
                                                <td>Name :</td>
                                                <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                            </tr>
                                            <tr>
                                                <td>Password :</td>
                                                <td> <input type="password" class="form-control" id="exampleInputPassword1" name="user_password" value="<%= user.getPassword()%>" > </td>
                                                <td> <i onclick="passwordReveal()" class="fa fa-eye"> </i> </td> 
                                            </tr>

                                            <tr>
                                                <td>Gender :</td>
                                                <td> <%= user.getGender().toUpperCase()%> </td>
                                            </tr>
                                            <tr>
                                                <td>About  :</td>
                                                <td>
                                                    <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%>
                                                    </textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>New Profile:</td>
                                                <td>
                                                    <input type="file" name="image" class="" >
                                                </td>
                                            </tr>
                                        </table>

                                        <div colspan="2"> (file size should be under 2MB) </div>
                                        <br>

                                        <div class="container">
                                            <button type="submit" class="btn btn-outline-primary">Save</button>
                                        </div>
                                    </form>


                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row w-100">
                                <div class="col-auto">
                                    <button type="button" id="deleteAccount" class="btn btn-danger d-flex flex-row" onclick="deleteaccount();">delete account</button>
                                </div>
                                <div class="col-auto ml-auto">
                                    <!-- Add this link wherever you want in your HTML -->
                                    <a href="myposts.jsp?userid=<%= user.getId()%>&userName=<%=user.getName()%>" class="btn btn-outline-primary">My Posts</a>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <!--end of profile modal-->

            <!--add post modal-->



            <!-- Modal -->
            <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <form id="add-post-form" action="AddPostServlet" method="post">

                                <div class="form-group">
                                    <select class="form-control" name="cid">
                                        <option selected disabled>---Select Category---</option>

                                        <%
                                            PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                            ArrayList<Category> list = postd.getAllCategories();
                                            for (Category c : list) {
                                        %>
                                        <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control" required />
                                </div>

                                <div class="form-group">
                                    <textarea name="pContent" id="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content | Kinedly use <br> for new line and &amp;nbsp; for indents" required ></textarea>
                                </div>
                                <div class="form-group">
                                    <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Select your pic..</label>
                                    <br>
                                    <input type="file" name="pic" >
                                </div>

                                <!-- Divider and Warning Text Box -->
                                <hr class="my-4">
                                <div class="alert alert-warning" id="warning" role="alert">
                                    Kinedly use  &lt;br&gt; for new line and &amp;nbsp; for indents <br>
                                    Warning: Make sure that your post  dosen't contains any misleading topic. Once you submit the post, you cannot delete or modify the content later. 
                                </div>

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-primary">Post </button>
                                </div>



                            </form>


                        </div>

                    </div>
                </div>
            </div>


            <!--END add post modal-->







            <!--javascripts-->
            <script
                src="https://code.jquery.com/jquery-3.4.1.min.js"
                integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
            <script src="js/myjs.js" type="text/javascript"></script>

            <script>
                                        function deleteaccount() {
                                            swal({
                                                title: "Are you sure?",
                                                text: "Once deleted, you will not be able to recover this account!",
                                                icon: "warning",
                                                buttons: true,
                                                dangerMode: true,
                                            })
                                                    .then((willDelete) => {
                                                        if (willDelete) {
                                                            $.ajax({
                                                                url: "DeleteAccountServlet",
                                                                type: "POST",
                                                                success: function (response) {
                                                                    if (response.trim() === "success") {
                                                                        swal("Poof! Your account has been deleted!", {
                                                                            icon: "success",
                                                                        }).then(() => {
                                                                            window.location = "index.jsp";
                                                                        });
                                                                    } else {
                                                                        swal("Error! Something went wrong. Please try again.", {
                                                                            icon: "error",
                                                                        });
                                                                    }
                                                                },
                                                                error: function () {
                                                                    swal("Error! Something went wrong. Please try again.", {
                                                                        icon: "error",
                                                                    });
                                                                }
                                                            });
                                                        } else {
                                                            swal("Your account is safe!");
                                                        }
                                                    });
                                        }
            </script>

            <script>
                $(document).ready(function () {
                    let editStatus = false;
                    let lastProfilePicUrl = ""; // Variable to store the URL of the last profile picture

                    $('#edit-profile-button').click(function () {
                        if (editStatus == false) {
                            $("#profile-details").hide()
                            $("#profile-edit").show();
                            editStatus = true;
                            $(this).text("Back")
                        } else {
                            $("#profile-details").show()
                            $("#profile-edit").hide();
                            editStatus = false;
                            $(this).text("Edit")
                        }
                    });

                    // Function to validate file size before form submission
                    $("#edit-profile-form").on("submit", function (event) {
                        var profileImage = $("input[name='image']")[0].files[0];
                        if (profileImage && profileImage.size > 2 * 1024 * 1024) { // 500KB in bytes
                            swal("Error", "Profile image size exceeds 500KB limit", "error");
                            event.preventDefault(); // Prevent form submission
                        } else {
                            // Store the URL of the current profile picture before form submission
                            lastProfilePicUrl = $("#profile-img").attr("src");
                        }
                    });

                    // Function to reset file input field if invalid file is selected
                    $('input[name="image"]').on('change', function () {
                        var profileImage = $(this)[0].files[0];
                        if (profileImage && profileImage.size > 2 * 1024 * 1024) {
                            // Clear the file input field
                            $(this).val('');
                            swal("Error", "Profile image size exceeds 2MB limit", "error");
                        }
                    });

                    // Function to restore last profile picture if form submission fails
                    $("#edit-profile-form").on("reset", function () {
                        $("#profile-img").attr("src", lastProfilePicUrl);
                    });
                });

            </script>


            <!--now add post js-->
            <script>
    $(document).ready(function (e) {
        $("#add-post-form").on("submit", function (event) {
            // Prevent the default form submission
            event.preventDefault();

            // Get the pContent textarea and modify its content
            var pContent = document.getElementById('pContent');
            var content = pContent.value;
            content = content.replace(/\n/g, '<br>');
            content = content.replace(/^ +/gm, function(match) {
                return match.replace(/ /g, '&nbsp;');
            });
            pContent.value = content;

            // Validate form data
            var category = $("select[name='cid']").val();
            var title = $("input[name='pTitle']").val();
            var content = $("textarea[name='pContent']").val();
            var picInput = $("input[name='pic']");
            var picFile = picInput[0].files[0];

            if (category === null || category === '' || title === '' || content === '') {
                swal("Error", "Please fill in all required fields", "error");
                return;
            }

            var form = new FormData(this);

            if (picFile) {
                // Picture selected, check if a file with the same name already exists
                var picName = picFile.name;

                console.log("Checking if the picture name exists...");

                $.ajax({
                    url: "AddPostServlet",
                    type: 'POST',
                    data: { picName: picName },
                    success: function (data) {
                        console.log("CheckPictureNameServlet response:", data);
                        if (data.trim() === 'exists') {
                            // Rename the file
                            var newPicName = generateUniqueName(picName);
                            form.delete("pic");
                            form.append("pic", renameFile(picFile, newPicName));

                            console.log("File renamed to:", newPicName);
                        }
                        // Proceed with the form submission
                        submitForm(form);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error("Error checking picture name:", textStatus, errorThrown);
                        swal("Error!!", "Something went wrong, try again...", "error");
                    }
                });
            } else {
                // No picture selected, proceed with form submission
                submitForm(form);
            }
        });
    });

                function generateUniqueName(fileName) {
                    var timestamp = new Date().getTime();
                    var fileExtension = fileName.split('.').pop();
                    var fileNameWithoutExt = fileName.substring(0, fileName.lastIndexOf('.'));
                    return fileNameWithoutExt + "_" + timestamp + "." + fileExtension;
                }

                function renameFile(file, newFileName) {
                    var blob = file.slice(0, file.size, file.type);
                    return new File([blob], newFileName, {type: file.type});
                }

                function submitForm(form) {
                    console.log("Submitting the form...");
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log("AddPostServlet response:", data);
                            if (data.trim() === 'done') {
                                swal("Good job!", "Saved successfully", "success")
                                        .then(() => {
                                            location.reload(true);
                                        });
                            } else {
                                swal("Error!!", "Something went wrong, try again...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.error("Error submitting form:", textStatus, errorThrown);
                            swal("Error!!", "Something went wrong, try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                }
            </script>





            <!--loading post using ajax-->
            <script>
                function getPosts(catId, temp) {
                    $("#loader").show();
                    $("#post-container").hide()

                    $(".c-link").removeClass('active')


                    $.ajax({
                        url: "load_posts.jsp",
                        data: {cid: catId},
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#loader").hide();
                            $("#post-container").show();
                            $('#post-container').html(data)
                            $(temp).addClass('active')

                        }
                    })

                }
//                actual for loading
//                $(document).ready(function (e) {
//
//                    let allPostRef = $('.c-link')[0]
//                    getPosts(0, allPostRef)
//                })

//                added after dropdown for loading
                $(document).ready(function () {
                    // Load all posts initially
                    let allPostRef = $('.dropdown-item')[0];
                    getPosts(0, allPostRef);
                });
            </script>
        </div>
        <div id="bottom"></div>

    </body>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Set the timeout duration in milliseconds (10 minutes in this case)
            const timeoutDuration = 600000;

            let logoutTimeout;

            function startLogoutTimer() {
                logoutTimeout = setTimeout(() => {
                    // Perform logout action here
                    logoutUser();
                }, timeoutDuration);
            }

            function resetLogoutTimer() {
                // Reset the timeout on user activity
                clearTimeout(logoutTimeout);
                startLogoutTimer();
            }

            function logoutUser() {
                // Use AJAX to call your LogoutServlet
                const xhr = new XMLHttpRequest();
                xhr.open('GET', 'LogoutServlet', true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        // Redirect or perform logout action after successful response
                        Swal.fire({
                            title: 'Auto Logout',
                            text: 'You have been logged out due to inactivity.',
                            icon: 'info',
                            confirmButtonText: 'OK',
                            onClose: () => {
                                window.location.href = 'login_page.jsp';
                            }
                        });
                    }
                };
                xhr.send();
            }

            // Add event listeners for user activity (you can customize these based on your needs)
            document.addEventListener('mousemove', resetLogoutTimer);
            document.addEventListener('keypress', resetLogoutTimer);

            // Start the initial logout timer
            startLogoutTimer();
        });
    </script>

    <script>
        window.onscroll = function () {
            myFunction()
        };

        function myFunction() {
            var winScroll = document.documentElement.scrollTop || document.body.scrollTop;
            var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            var scrolled = (winScroll / height) * 100;
            var progressBar = document.querySelector('.progress-bar');
            if (scrolled > 0) {
                // If scrolled down, show progress bar
                document.querySelector('.progress-container').style.display = "block";
                progressBar.style.width = scrolled + "%";
            } else {
                // If at the top, hide progress bar
                document.querySelector('.progress-container').style.display = "none";
            }
        }


        // JavaScript to handle profile picture modal
        $(document).ready(function () {
            // When clicking on the profile picture thumbnail, show the full-size picture in the modal
            $('#profile-pic-thumbnail').on('click', function () {
                var profilePicUrl = $(this).attr('src');
                $('#profile-pic').attr('src', profilePicUrl);
                $('#profile-pic-modal').modal('show');
            });
        });

        // JavaScript to handle background blur effect
        $(document).ready(function () {
            // When the profile picture modal is shown
            $('#profile-pic-modal').on('show.bs.modal', function () {
                // Add the 'modal-blur' class to the body
                $('body').addClass('modal-blur');
            });

            // When the profile picture modal is hidden
            $('#profile-pic-modal').on('hidden.bs.modal', function () {
                // Remove the 'modal-blur' class from the body
                $('body').removeClass('modal-blur');
            });
        });


        //show password
        function passwordReveal() {
            var x = document.getElementById("exampleInputPassword1");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>

</html>

<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        const body = document.body;
        const navbar = document.querySelector('.navbar');
        const listGroupItems = document.querySelectorAll('.list-group-item');
        const modalContent = document.querySelectorAll('.modal-content');
        const formControls = document.querySelectorAll('.form-control');
        const btnOutlinePrimary = document.querySelectorAll('.btn-outline-primary');
        const modeToggleBtn = document.getElementById('mode-toggle-btn'); // Get the mode toggle button

        // Apply dark mode if it was previously enabled
        if (localStorage.getItem('theme') === 'dark') {
            enableDarkMode();
        } else {
            disableDarkMode(); // Ensures the correct mode is applied if the value is 'light'
        }

        function enableDarkMode() {
            body.classList.add('dark-mode');
            navbar.classList.add('dark-mode');
            listGroupItems.forEach(item => item.classList.add('dark-mode'));
            modalContent.forEach(item => item.classList.add('dark-mode'));
            formControls.forEach(item => item.classList.add('dark-mode'));
            btnOutlinePrimary.forEach(item => item.classList.add('dark-mode'));
            modeToggleBtn.innerText = 'Light Mode'; // Change button text to Light Mode

            localStorage.setItem('theme', 'dark');
        }

        function disableDarkMode() {
            body.classList.remove('dark-mode');
            navbar.classList.remove('dark-mode');
            listGroupItems.forEach(item => item.classList.remove('dark-mode'));
            modalContent.forEach(item => item.classList.remove('dark-mode'));
            formControls.forEach(item => item.classList.remove('dark-mode'));
            btnOutlinePrimary.forEach(item => item.classList.remove('dark-mode'));
            modeToggleBtn.innerText = 'Dark Mode'; // Change button text to Dark Mode

            localStorage.setItem('theme', 'light');
        }

        document.getElementById('mode-toggle-btn').addEventListener('click', () => {
            if (body.classList.contains('dark-mode')) {
                disableDarkMode();
            } else {
                enableDarkMode();
            }
        });
    });
</script>
<script>
    function selectCategory(element, cid) {
        // Remove active class and selected-item class from all dropdown items
        var dropdownItems = document.querySelectorAll('.dropdown-item');
        dropdownItems.forEach(function (item) {
            item.classList.remove('active', 'selected-item');
        });

        // Add active class and selected-item class to the selected item
        element.classList.add('active', 'selected-item');

        // Call getPosts function with the selected category ID
        getPosts(cid, element);
    }
</script>