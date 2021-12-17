<%--
  Created by IntelliJ IDEA.
  User: sololobo
  Date: 12/17/21
  Time: 3:19 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body{
            font-family: Calibri, Helvetica, sans-serif;
            background-color: pink;
        }
        .container {
            padding: 50px;
            background-color: lightblue;
        }

        input[type=text], input[type=password], textarea {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }
        input[type=text]:focus, input[type=password]:focus {
            background-color: orange;
            outline: none;
        }
        div {
            padding: 10px 0;
        }
        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }
        .registerbtn {
            background-color: #4CAF50;
            color: white;
            padding: 16px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }
        .registerbtn:hover {
            opacity: 1;
        }

        .registerbtn {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background-color: #328f8a;
            background-image: linear-gradient(45deg,#328f8a,#08ac4b);
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            /*-webkit-transition: all 0.3 ease;*/
            /*transition: all 0.3 ease;*/
            cursor: pointer}
    </style>
</head>
<body>
${error_msg}
<form action="${pageContext.request.contextPath}/registration" method="POST">
    <div class="container">
        <div style="text-align: center;">  <h1>REGISTRATION</h1> </div>
        <hr>
        <label> Username </label>
        <input type="text" name="userName" placeholder= "Username" required />

        <label for="email"><b>Email</b></label>
        <input id="email" type="text" placeholder="Enter Email" name="email" required>




        <label for="psw"><b>Password</b></label>
        <input id="psw" type="password" placeholder="Enter Password" name="password1" required>

        <label for="psw-repeat"><b>Re-type Password</b></label>
        <input id="psw-repeat" type="password" placeholder="Retype Password" name="password2" required>

        <label for="phone-number"><b>Phone number</b></label>
        <input id="phone-number" type="text" placeholder="Enter Phone Number" name="phoneNo" required>

        <label for="bank-name"><b>Bank Name</b></label>
        <input id="bank-name" type="text" placeholder="Enter Bank Name" name="bank" required>

        <label for="bank-acc-number"><b>Bank Account Number</b></label>
        <input id="bank-acc-number" type="text" placeholder="Enter Bank Account Number" name="bankAccN" required>

        <button type="submit" class="registerbtn">Register</button>

        <input
                type="hidden"
                name="${_csrf.parameterName}"
                value="${_csrf.token}"
        />
    </div>
</form>

</body>
</html>

