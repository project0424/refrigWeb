<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<title>main.jsp</title>

<c:url var="jquery" value="/jquery"/>
<c:url var="bootstrap" value="/bootstrap-3.3.4"/>
<c:url var="angular" value="/angular-1.3.15"/>

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
	});
	app.config(function($routeProvider) {
		var page1 = {
				templateUrl : "page1",
				controller : "page1Controller"
		};
		var page2 = {
				templateUrl : "page2",
				controller : "page2Controller"
		};
		var page3 = {
				templateUrl : "page3",
				controller : "page3Controller"
		};
		$routeProvider.when('/page1', page1);
		$routeProvider.when('/page2', page2);
		$routeProvider.when('/page3', page3);
		$routeProvider.otherwise({redirectTo :'/page1'});
	});
	
	app.controller("homeController", function($scope) {
	});
	app.controller("page1Controller", function($scope) {
		$scope.message = "Page1";
	});
	app.controller("page2Controller", function($scope) {
		$scope.message = "Page2";
	});
	app.controller("page3Controller", function($scope) {
		$scope.message = "Page3";
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
  		<div>Refrigerator Management App</div>
	</div>

	<nav class="navbar navbar-inverse">
	  	<div class="container-fluid" >
		    <div class="navbar-header">
			    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>                        
		      	</button>
		    	<a class="navbar-brand" href="#home">Main</a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		    	<ul class="nav navbar-nav">
<!-- 			        <li class="active"><a href="#">Home</a></li> -->
<!-- 			        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a></li> -->
			        <li><a href="#page1">Page 1</a></li>
			        <li><a href="#page2">Page 2</a></li>
			        <li><a href="#page3">Page 3</a></li>
		      	</ul>
		      	<ul class="nav navbar-nav navbar-right">
			        <li><a href="/refrigeratorweb/m/home"><span class="glyphicon glyphicon-log-out"></span>Log-out</a></li>
		      	</ul>
		    </div>
	 	</div>
	</nav>
	<div class="container-fluid">
		<ng-view>
		
		</ng-view>
	</div>
	
	
</body>
</html>





















