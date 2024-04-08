<%-- 
    Document   : contributors
    Created on : 07-Apr-2024, 10:41:54?pm
    Author     : Rohit Khanra
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.util.*"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>

<style>
    .body{
        background-color: hsla(272, 39%, 87%, 1);
    }
    h1{
        text-align: center;
        padding: 10px;
        font-family: sans-serif;
    }
    /* Table style */
    table {
        width: 100%;
        border-collapse: collapse;
        overflow-x: auto;
        border: 1px solid black;
    }

    th, td {
        padding: 8px;
        text-align: left;

    }
    th {
        background-color: hsla(273, 39%, 74%, 1);
        text-align: center;
        border: 1px solid black;
    }
    /* Avatar style */
    .avatar {
        border-radius: 50%;
        width: 30px;
        height: 30px;
        object-fit: cover;
    }
    tr, td{
        text-align: center;
        border: 1px solid black;

    }

    /* Modal style */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5); /* Black background with opacity */

    }
    .modal-content {
        position: relative;
        margin: auto;
        width: 50%;
        max-width: 400px;
        background-color: #fefefe;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        animation-name: modalopen;
        animation-duration: 0.4s;
    }

    @keyframes modalopen {
        from {
            opacity: 0
        }
        to {
            opacity: 1
        }
    }

    .close {
        position: absolute;
        right: 10px;
        top: 5px;
        color: #aaa;
        font-size: 20px;
        font-weight: bold;
        cursor: pointer;
    }


    /*    BLUR*/
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5); /* Black background with opacity */
        backdrop-filter: blur(5px); /* Apply blur effect to the background */
    }

    .modal-content {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 50%;
        max-width: 400px;
        background-color: #fefefe;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        animation-name: modalopen;
        animation-duration: 0.4s;
    }

    @keyframes modalopen {
        from {
            opacity: 0
        }
        to {
            opacity: 1
        }
    }

    .close {
        position: absolute;
        right: 10px;
        top: 5px;
        color: #aaa;
        font-size: 20px;
        font-weight: bold;
        cursor: pointer;
    }

</style>



<%
    // Get the list of users
    UserDao userDao = new UserDao(ConnectionProvider.getConnection());
    List<User> userList = userDao.getAllUsers();

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="body">
        <h1>Our Contributors</h1>

        <table border="1">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>About</th>
                    <th>Joined on</th>
                    <th>Avatar</th>

                </tr>
            </thead>
            <tbody>
                <%                    if (userList != null && !userList.isEmpty()) {
                        for (User user : userList) {
                %>
                <tr>
                    <td><%= user.getName()%></td>
<!--                    <td><%= user.getEmail()%></td>-->
                    <td onclick="copyEmail('<%= user.getEmail()%>')"><%= user.getEmail()%></td>

                    <td> <%= user.getAbout()%> </td>
                    <td> <%= user.getDateTime()%> </td>
                    <td>
                        <!-- Add onclick event to trigger modal -->
                        <img src="pics/<%= user.getProfile()%>"
                             class="avatar"
                             onclick="openModal('pics/<%= user.getProfile()%>')">
                    </td>

                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5">No users found</td>
                </tr>
                <% }%>
            </tbody>
        </table>

        <!-- The Modal -->
        <div id="avatarModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <img id="modalImg" style="width:100%">
            </div>
        </div>


    </body>
    <!-- JavaScript function to copy email address to clipboard -->
    <script>
        function copyEmail(email) {
            navigator.clipboard.writeText(email)
                    .then(() => {
                        console.log('Email copied to clipboard: ' + email);
                        alert('Email copied to clipboard: ' + email);
                    })
                    .catch(err => {
                        console.error('Failed to copy email: ', err);
                    });
        }


        // Function to open modal with clicked avatar image
// Function to open modal with clicked avatar image
        function openModal(imageSrc) {
            var modal = document.getElementById('avatarModal');
            var modalImg = document.getElementById('modalImg');
            modal.style.display = "block";
            modalImg.src = imageSrc;
        }

// Function to close modal
        function closeModal() {
            var modal = document.getElementById('avatarModal');
            modal.style.display = "none";
        }

// Close modal when clicking outside of it
        window.onclick = function (event) {
            var modal = document.getElementById('avatarModal');
            if (event.target === modal) {
                modal.style.display = "none";
            }
        }

    </script>
</html>
