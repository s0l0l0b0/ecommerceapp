<%--
  Created by IntelliJ IDEA.
  User: sololobo
  Date: 12/27/21
  Time: 11:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Admin Panel</title>

    <style>
        * {
            box-sizing: border-box;
        }

        .row {
            margin-left:-5px;
            margin-right:-5px;
        }

        .column {
            float: left;
            width: 50%;
            padding: 5px;
        }

        /* Clearfix (clear floats) */
        .row::after {
            content: "";
            clear: both;
            display: table;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            border: 1px solid #ddd;
        }

        th, td {
            text-align: left;
            padding: 16px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #searchBook, #searchUser {
            /*background-image: url('/css/searchicon.png');*/
            background-position: 10px 10px;
            background-repeat: no-repeat;
            width: 100%;
            font-size: 16px;
            padding: 12px 20px 12px 40px;
            border: 1px solid #ddd;
            margin-bottom: 12px;
        }
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }
    </style>
</head>

<body>
<h1 style="text-align: center">Admin Panel</h1>

<div>
    <form action="/logout" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout">
    </form>
    <%--    <form action="add_new_book" method="post">--%>
    <%--        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
    <%--        <input type="submit" value="Add New Book">--%>
    <%--    </form>--%>
    <button>
        <a href="/addNewProduct">Add New Product</a>
    </button>

</div>

<div class="row">
    <div class="column">
        <table id="userTable">
            <center><h2>Users</h2></center>
            <input type="text" id="searchUser" onkeyup="toFindUser()"
                   placeholder="Search for user by email..." title="Type in a name">

            <tr>
                <th>ID</th>
                <th>User Name</th>
                <th>User Role</th>
                <th>Email</th>
<%--                <th>Active Status</th>--%>
            </tr>

            <c:forEach items="${user}" var="item">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.userName}</td>
                    <td>${item.role}</td>
<%--                    <td><a href="/userBorrowLog?userEmail=${item.email}" class="btn btn-green">${item.email}</a></td>--%>
                                            <td>${item.email}</td>
<%--                    <td>--%>
<%--                        <label class="switch">--%>
<%--                            <input onclick="toSetActiveInactiveUser(${item.id})" id="activeSlider"--%>
<%--                                   type="checkbox" ${item.isActive == 'true'? "checked":""}>--%>
<%--                            <span class="slider round"></span>--%>
<%--                        </label>--%>
<%--                    </td>--%>
                </tr>
            </c:forEach>

        </table>
    </div>


    <div class="column">
        <center><h2>Products</h2></center>
        <input type="text" id="searchBook" onkeyup="toFindBook()" placeholder="Search for books by name..." title="Type in a name">
        <table id="bookTable">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>category</th>
                <th>Detail</th>
                <th>Rate</th>
                <th>Image URL</th>
            </tr>
            <c:forEach items="${product}" var="item">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.name}</td>
                    <td>${item.price}</td>
                    <td>${item.productCategory}</td>
                    <td>${item.detail}</td>
                    <td>${item.rate}</td>
                    <td>${item.imgUrl}</td>
                    <th><button>
                        <a href="/editProduct?id=${item.id}">Edit Product</a></button>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>


<script>
    function toFindUser() {
        let input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchUser");
        filter = input.value.toUpperCase();
        table = document.getElementById("userTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[3];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    function toFindBook() {
        let input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchBook");
        filter = input.value.toUpperCase();
        table = document.getElementById("bookTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
    function toSetActiveInactiveUser(userId){
        fetch("/activateInactive?userId="+userId)

            .catch(function() {
                alert("Error occurred!");
            });
    }

</script>
</body>
</html>
