<%--
  Created by IntelliJ IDEA.
  User: sololobo
  Date: 12/25/21
  Time: 2:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: Arial;
            font-size: 17px;
            padding: 8px;
        }

        * {
            box-sizing: border-box;
        }

        .row {
            display: -ms-flexbox; /* IE10 */
            display: flex;
            -ms-flex-wrap: wrap; /* IE10 */
            flex-wrap: wrap;
            margin: 0 -16px;
        }

        .col-25 {
            -ms-flex: 25%; /* IE10 */
            flex: 25%;
        }

        .col-50 {
            -ms-flex: 50%; /* IE10 */
            flex: 50%;
        }

        .col-75 {
            -ms-flex: 75%; /* IE10 */
            flex: 75%;
        }

        .col-25,
        .col-50,
        .col-75 {
            padding: 0 16px;
        }

        .container {
            background-color: #f2f2f2;
            padding: 5px 20px 15px 20px;
            border: 1px solid lightgrey;
            border-radius: 3px;
        }

        input[type=text] {
            width: 100%;
            margin-bottom: 20px;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        label {
            margin-bottom: 10px;
            display: block;
        }

        .icon-container {
            margin-bottom: 20px;
            padding: 7px 0;
            font-size: 24px;
        }

        .btn {
            background-color: #04AA6D;
            color: white;
            padding: 12px;
            margin: 10px 0;
            border: none;
            width: 100%;
            border-radius: 3px;
            cursor: pointer;
            font-size: 17px;
        }

        .btn:hover {
            background-color: #45a049;
        }

        a {
            color: #2196F3;
        }

        hr {
            border: 1px solid lightgrey;
        }

        span.price {
            float: right;
            color: grey;
        }

        /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
        @media (max-width: 800px) {
            .row {
                flex-direction: column-reverse;
            }
            .col-25 {
                margin-bottom: 20px;
            }
        }
    </style>
    <title>Checkout</title>
</head>
<body>

<h2>Responsive Checkout Form</h2>
<p>Resize the browser window to see the effect. When the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other.</p>

<div class="row">
    <div class="col-75">
        <div class="container">
<%--            <form action="/action_page.php">--%>

                <div class="row">
                    <div class="col-50">
                        <h3>Billing Address</h3>

                        <label><i class="fa fa-user"></i> Full Name: ${user.userName}</label>
                        <label><i class="fa fa-mobile"></i> Email: ${user.email}</label>
                        <label><i class="fa fa-envelope"></i> Contact No.: ${user.phoneNo}</label>
                        <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                        <input type="text" id="adr" name="address" placeholder="542 W. 15th Street">
                        <label for="city"><i class="fa fa-institution"></i> City</label>
                        <input type="text" id="city" name="city" placeholder="New York">

                        <div class="row">
                            <div class="col-50">
                                <label for="state">State</label>
                                <input type="text" id="state" name="state" placeholder="NY">
                            </div>
<%--                            <div class="col-50">--%>
<%--                                <label for="zip">Zip</label>--%>
<%--                                <input type="text" id="zip" name="zip" placeholder="10001">--%>
<%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-50">
                        <%--@declare id="fname"--%><h3>Payment</h3>
                        <label for="fname">Accepted Cards</label>
                        <div class="icon-container">
                            <i class="fa fa-cc-visa" style="color:navy;"></i>
                            <i class="fa fa-cc-amex" style="color:blue;"></i>
                            <i class="fa fa-cc-mastercard" style="color:red;"></i>
                            <i class="fa fa-cc-discover" style="color:orange;"></i>
                        </div>
                        <label>Name on Card: ${user.userName}</label>
                        <label>Credit card number: ${user.bankAccNo}</label>
<%--                        <label for="expmonth">Exp Month</label>--%>
<%--                        <input type="text" id="expmonth" name="expmonth" placeholder="September">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-50">--%>
<%--                                <label for="expyear">Exp Year</label>--%>
<%--                                <input type="text" id="expyear" name="expyear" placeholder="2018">--%>
<%--                            </div>--%>
<%--                            <div class="col-50">--%>
<%--                                <label for="cvv">CVV</label>--%>
<%--                                <input type="text" id="cvv" name="cvv" placeholder="352">--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>

                </div>
<%--                <label>--%>
<%--                    <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing--%>
<%--                </label>--%>
                <input type="submit" value="Continue to checkout" class="btn">
<%--            </form>--%>
        </div>
    </div>

    <div class="col-25">

        <div class="container">

            <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i>${totalItem}<b></b></span></h4>
            <c:set var="subTotal" value="0" />
            <c:set var="totalItem" value="0"/>
            <c:forEach items="${products}" var="item">
            <p><a href="#">${item.name} </a> - $${item.price} X ${cartProducts.get(item.id)}

                <span class="price">$${cartProducts.get(item.id) * item.price}</span>
                <span class="price"></span></p>

                <c:set var="subTotal" value="${subTotal + cartProducts.get(item.id) * item.price}" />
                <c:set var="totalItem" value="${totalItem + cartProducts.get(item.id)}"/>
            </c:forEach>

            <p>Total <span class="price" style="color:black"><b>$${subTotal}</b></span></p>


        </div>

    </div>
</div>

</body>
</html>

