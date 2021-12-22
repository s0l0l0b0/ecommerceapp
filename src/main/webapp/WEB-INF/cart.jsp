<%--
  Created by IntelliJ IDEA.
  User: sololobo
  Date: 12/17/21
  Time: 11:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart UI</title>
<%--    <link rel="stylesheet" type="text/css" href="./style.css">--%>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,900" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <style>
        body{
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom right, #E3F0FF, #FAFCFF);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .CartContainer{
            width: 70%;
            height: 90%;
            background-color: #ffffff;
            border-radius: 20px;
            box-shadow: 0px 10px 20px #1687d933;
        }

        .Header{
            margin: auto;
            width: 90%;
            height: 15%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .Heading{
            font-size: 20px;
            font-family: 'Open Sans';
            font-weight: 700;
            color: #2F3841;
        }

        .Action{
            font-size: 14px;
            font-family: 'Open Sans';
            font-weight: 600;
            color: #E44C4C;
            cursor: pointer;
            border-bottom: 1px solid #E44C4C;
        }

        .Cart-Items{
            margin: auto;
            width: 90%;
            height: 30%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .image-box{
            width: 15%;
            text-align: center;
        }
        .about{
            height: 100%;
            width: 24%;
        }
        .title{
            padding-top: 10px;
            line-height: 10px;
            font-size: 32px;
            font-family: 'Open Sans';
            font-weight: 800;
            color: #202020;
        }
        .subtitle{
            line-height: 10px;
            font-size: 18px;
            font-family: 'Open Sans';
            font-weight: 600;
            color: #909090;
        }

        .counter{
            width: 15%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .btn{
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #d9d9d9;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
            font-family: 'Open Sans';
            font-weight: 900;
            color: #202020;
            cursor: pointer;
        }
        .count{
            font-size: 20px;
            font-family: 'Open Sans';
            font-weight: 600;
            color: #202020;
        }

        .prices{
            height: 100%;
            text-align: right;
        }
        .amount{
            padding-top: 20px;
            font-size: 26px;
            font-family: 'Open Sans';
            font-weight: 800;
            color: #202020;
        }
        .save{
            padding-top: 5px;
            font-size: 14px;
            font-family: 'Open Sans';
            font-weight: 600;
            color: #1687d9;
            cursor: pointer;
        }
        .remove{
            padding-top: 5px;
            font-size: 14px;
            font-family: 'Open Sans';
            font-weight: 600;
            color: #E44C4C;
            cursor: pointer;
        }

        .pad{
            margin-top: 5px;
        }

        hr{
            width: 66%;
            float: right;
            margin-right: 5%;
        }
        .checkout{
            float: right;
            margin-right: 5%;
            width: 28%;
        }
        .total{
            width: 100%;
            display: flex;
            justify-content: space-between;
        }
        .Subtotal{
            font-size: 22px;
            font-family: 'Open Sans';
            font-weight: 700;
            color: #202020;
        }
        .items{
            font-size: 16px;
            font-family: 'Open Sans';
            font-weight: 500;
            color: #909090;
            line-height: 10px;
        }
        .total-amount{
            font-size: 36px;
            font-family: 'Open Sans';
            font-weight: 900;
            color: #202020;
        }
        .button{
            margin-top: 10px;
            width: 100%;
            height: 40px;
            border: none;
            background: linear-gradient(to bottom right, #B8D7FF, #8EB7EB);
            border-radius: 20px;
            cursor: pointer;
            font-size: 16px;
            font-family: 'Open Sans';
            font-weight: 600;
            color: #202020;
        }
    </style>
</head>
<body>
<div class="CartContainer">
    <div class="Header">
        <h3 class="Heading">Shopping Cart</h3>
        <h5 class="Action">Remove all</h5>
    </div>

    <c:forEach items="${products}" var="item">
    <div class="Cart-Items">
        <div class="image-box">
            <img src="${item.imgUrl}" style="height:120px" />
        </div>
        <div class="about">
            <h1 class="title">${item.name}</h1>
<%--            <h3 class="subtitle">250ml</h3>--%>
<%--            <img src="images/veg.png" style={{ height="30px" }}/>--%>
        </div>
        <div class="counter">
            <div class="btn" onclick="increaseQty(${item.id})" >+</div>
            <div class="count"  id="count">${cartProducts.get(item.id)}</div>
            <div class="btn" onclick="decreaseQty(${item.id})">-</div>
        </div>
        <div class="prices">
            <div class="amount">${item.price}</div>
            <div class="save"><u>Save for later</u></div>
            <div class="remove"><u>Remove</u></div>
        </div>
    </div>
    </c:forEach>

    <hr>
    <div class="checkout">
        <div class="total">
            <div>
                <div class="Subtotal">Sub-Total</div>
                <div class="items">2 items</div>
            </div>
            <div class="total-amount">$6.18</div>
        </div>
        <button class="button">Checkout</button></div>
</div>

<script type="application/javascript">
    function increaseQty(productId) {
        fetch("/quantityIncrement?productId=" + productId, {
            method: "POST"
        }).then(res => {
            if (res.ok){
                // window.location.reload()
                // refreshCount()
                $('#count').load(location.href + '#count');
            }
        })
            .catch(function (){
                alert("Error occurred!");
            });
    }
    function decreaseQty(productId) {
        fetch("/quantityDecrement?productId=" + productId, {
            method: "POST"
        }).then(res => {
            if (res.ok){
                window.location.reload()
            }
        })
            .catch(function (){
                alert("Error occurred!");
            });
    }

    function refreshCount(){
        $('#count').load(location.href + '#count');
    }
</script>
</body>
</html>