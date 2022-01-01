<%--
  Created by IntelliJ IDEA.
  User: sololobo
  Date: 12/31/21
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />

    <title>Invoice</title>

    <link rel='stylesheet' type='text/css' href='/static/css/style.css' />
    <link rel='stylesheet' type='text/css' href='/static/css/print.css' media="print" />
    <script type='text/javascript' src='/staticjs/jquery-1.3.2.min.js'></script>
    <script type='text/javascript' src='/static/js/example.js'></script>

</head>

<body>

<div id="page-wrap">
    <br>
    <h1 style="text-align: center">INVOICE</h1><br><br>

    <div id="identity">
        <table id="address">
            <tr>
                <td class="meta-head">Name</td>
                <td><textarea>${order.user.userName}</textarea></td>
            </tr>
            <tr>
                <td class="meta-head">Contact_No.</td>
                <td><textarea>${order.shippingPhoneNo}</textarea></td>
            </tr>
            <tr>
                <td class="meta-head">Address</td>
                <td><textarea>${order.shippingAdd}</textarea></td>
            </tr>
        </table>


    </div>

    <div id="customer">
        <table id="meta">
            <tr>
                <td class="meta-head">Invoice #</td>
                <td><textarea>${order.id}</textarea></td>
            </tr>
            <tr>

                <td class="meta-head">Date</td>
                <td><textarea id="date">December 15, 2009</textarea></td>
            </tr>
        </table>

    </div>

    <table id="items">
        <tr>
            <th>Item</th>
            <th>Description</th>
            <th>Unit Cost</th>
            <th>Quantity</th>
            <th>Price</th>
        </tr>
        <c:forEach items="${order.orderProducts}" var="item">
        <tr class="item-row">
            <td class="item-name">${item.product.name}</td>
            <td class="description">${item.product.productCategory}</td>
            <td><textarea class="cost">${item.product.price}</textarea></td>
            <td><textarea class="qty">${item.quantity}</textarea></td>
            <td><span class="price">$650.00</span></td>
        </tr>
        </c:forEach>
        <tr>
            <td colspan="2" class="blank"> </td>
            <td colspan="2" class="total-line">Subtotal</td>
            <td class="total-value"><div id="subtotal">$875.00</div></td>
        </tr>
        <tr>

            <td colspan="2" class="blank"> </td>
            <td colspan="2" class="total-line">Discount</td>
            <td class="total-value"><div id="total">$0.00</div></td>
        </tr>
        <tr>
            <td colspan="2" class="blank"> </td>
            <td colspan="2" class="total-line">Shipping Charge</td>

            <td class="total-value"><textarea id="paid">$0.00</textarea></td>
        </tr>
        <tr>
            <td colspan="2" class="blank"> </td>
            <td colspan="2" class="total-line balance">Total</td>
            <td class="total-value balance"><div class="due">$875.00</div></td>
        </tr>


    </table>

    <div id="terms">
        <h5>Terms</h5>
        <textarea>NET 30 Days. Finance Charge of 1.5% will be made on unpaid balances after 30 days.</textarea>
    </div>

</div>

</body>

</html>