<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>home.jsp</title>

<c:url var="jquery" value="/jquery"/>
<c:url var="bootstrap" value="/bootstrap-3.3.4"/>
<c:url var="angular" value="/angular-1.3.15"/>
<c:url var="images" value="/images"/>

<link rel="stylesheet" href="${bootstrap}/css/bootstrap.min.css"/>

<script type="text/javascript" src="${jquery}/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="${bootstrap}/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${angular}/angular.min.js"></script>
<script type="text/javascript" src="${angular}/angular-sanitize.min.js"></script>
<script type="text/javascript" src="${angular}/angular-animate.min.js"></script>
<script type="text/javascript" src="${angular}/angular-route.min.js"></script>

<script type="text/javascript">
	var app = angular.module("myApp", ["ngSanitize", "ngAnimate", "ngRoute"]);
	app.controller("myController", function($scope) {
		if ("${msg}" != "") {
			alert("${msg}");	
		}
	});

</script>
<style type="text/css">
	.topsection {
	    width:100%;
	    overflow:auto;
	    padding:20px 30px 10px 28px;
	}
	.topsection img {
	    float:left;
	    vertical-align:bottom;
	}
	.topsection div {
	    float:right;
	    padding-top:14px;
	    letter-spacing:4px;
	    font-family:Arial !important;
	}
	.topnavcontainer {
		height : 10px;
	    background-color:#33CCFF;
	}
</style>

</head>
<body data-ng-controller="myController">
	
	<div class="topsection">
<%-- 		<a href='http://www.w3schools.com'><img id='topLogo' src="${images}/back.png" alt='W3Schools.com' class='img-responsive'></a> --%>
  		<div>Refrigerator Management App</div>
	</div>
	<div class="containe-fluid topnavcontainer"></div>

	<div class="container">
		<div class="jumbotron">
	    	<form class="form" action="login" method="post">
				<div class="form-group form-block">
			      	<input type="email" class="form-control" name="email" id="email" placeholder="Enter email">
			      	<input type="password" class="form-control" name="password" id="password" placeholder="Enter password">
	    		</div>
				<button type="submit" class="btn btn-info btn-block">로그인</button>
			</form>
			<hr>
			<a href="/refrigeratorweb/m/join" class="btn btn-default">회원가입</a>
	  	</div>
	</div>

</body>
</html>





















