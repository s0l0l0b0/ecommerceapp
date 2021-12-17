<%--
  Created by IntelliJ IDEA.
  User: sololobo
  Date: 12/17/21
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html>
<head>
  <title>Bikes</title>
  <!-- meta data -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <!--font-family-->
  <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

  <!-- For favicon png -->
  <link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>

  <!--font-awesome.min.css-->
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">

  <!--linear icon css-->
  <link rel="stylesheet" href="assets/css/linearicons.css">

  <!--animate.css-->
  <link rel="stylesheet" href="assets/css/animate.css">

  <!--owl.carousel.css-->
  <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
  <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">

  <!--bootstrap.min.css-->
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">

  <!-- bootsnav -->
  <link rel="stylesheet" href="assets/css/bootsnav.css" >

  <!--style.css-->
  <link rel="stylesheet" href="assets/css/style.css">

  <!--responsive.css-->
  <link rel="stylesheet" href="assets/css/responsive.css">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
<!--new-arrivals start -->
<section id="new-arrivals" class="new-arrivals">
  <div class="container">
    <div class="section-header">
      <h2>Bikes</h2>
    </div><!--/.section-header-->
    <div class="new-arrivals-content">
      <c:set var="perRowItemCount" value="4"/>
      <c:forEach items="${bikeList}" var="item" varStatus="i">
        <c:if test="${i.index%perRowItemCount eq 0}">
          <div class="row">
        </c:if>

        <div class="col-md-3 col-sm-4">
          <div class="single-new-arrival">
            <div class="single-new-arrival-bg">
              <img src="${item.imgUrl}" alt="${item.name}">
              <div class="single-new-arrival-bg-overlay"></div>
              <div class="sale bg-1">
                <p>sale</p>
              </div>
              <div class="new-arrival-cart">
                <p>
                  <span class="lnr lnr-cart"></span>
                  <a href="#">add <span>to </span> cart</a>
                </p>
                <p class="arrival-review pull-right">
                  <span class="lnr lnr-heart"></span>
                  <span class="lnr lnr-frame-expand"></span>
                </p>
              </div>
            </div>
            <h4><a href="#">${item.name}</a></h4>
            <p class="arrival-product-price">${item.price}</p>
          </div>
        </div>
        <c:if test="${(i.index+1)%perRowItemCount eq 0}">
          </div>
        </c:if>
      </c:forEach>
    </div>
  </div><!--/.container-->

</section><!--/.new-arrivals-->
<!--new-arrivals end -->


<!-- Include all js compiled plugins (below), or include individual files as needed -->

<script src="assets/js/jquery.js"></script>

<!--modernizr.min.js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

<!--bootstrap.min.js-->
<script src="assets/js/bootstrap.min.js"></script>

<!-- bootsnav js -->
<script src="assets/js/bootsnav.js"></script>

<!--owl.carousel.js-->
<script src="assets/js/owl.carousel.min.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>


<!--Custom JS-->
<script src="assets/js/custom.js"></script>

</body>
</html>
