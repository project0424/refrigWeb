<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>route.jsp</title>

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
	
	app.config(function($routeProvider) {
// 		$routeProvider.when('/home', {
// 										templateUrl : 'home.jsp',
// 										controller : 'homeController'
// 							})
// 					  .when('/userList', {
// 											templateUrl : 'userList.jsp',
// 											controller : 'userListCtrl'
// 							})
// 					  .otherwise({redirectTo : '/home'});
		var emp = {
				templateUrl : "emp.jsp",
				controller : "empController"
		};
		var city = {
				templateUrl : "city.jsp",
				controller : "cityController"
		};
		$routeProvider.when('/emp', emp);
		$routeProvider.when('/city', city);
		$routeProvider.otherwise({redirectTo : '/emp'});
	});
	
	app.controller("myController", function($scope) {
		alert("myController");
	});
	
	app.controller("empController", function($scope) {
		alert("empController");
		$scope.message = "직원리스트";
	});
	
	app.controller("cityController", function($scope) {
		alert("cityController");
		$scope.message = "도시리스트"; 
	});

</script>
<style type="text/css">

</style>

</head>
<body data-ng-controller="myController">

<div class="container">
	<a href="#emp" class="btn">emp list</a>
	<a href="#city" class="btn btn-primary">city list</a>
	<hr>
	<ng-view>
		
	</ng-view>
</div>

</body>
</html>





















