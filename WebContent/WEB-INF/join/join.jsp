<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>join.jsp</title>

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
	app.controller("myController", function($scope,$location) {
		$scope.emps = [{
			email : "xxxx@google.com",
			password : "1234",
			name : "saldgjk"
		}];
		$scope.empSubmit = function() {
			var emp;
			$.ajax({
				type : "POST",
				url : "join/join",
				async: false,
				data : {
					email : $scope.email,
					password : $scope.password,
					name : $scope.name
				},
				success : function(result, status) {
					alert(status + " : " + JSON.stringify(result));
					if (result.status == true){
						alert("member 추가 성공...");
						$location.path("/home");
					} else {
						alert("member 추가 실패...");  
					}
					emp = {
							email : result.member.email,
		 					password : result.member.password,
		 					name : result.member.name
					} 
				},
				error : function(xhr, status) { 
					alert("에러입니다");
				}
			});
			$scope.emps.push(emp);
			$scope.email = "";
			$scope.password = "";
			$scope.name = "";
			
		};
		$scope.empDelete = function(index) {
			$scope.emps.splice(index, 1);
		};
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
	<div class="containe-fluid topnavcontainer"></div>

<!-- 		<table class="table table-bordered"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th></th> <th>email</th> <th>password</th> <th>name</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<!-- 				<tr data-ng-repeat="emp in emps">		 -->
<!-- 					<td> <button class="btn btn-default" data-ng-click="empDelete($index)">삭제{{$index}}</button> </td> <td>{{emp.email}}</td> <td>{{emp.password}}</td> <td>{{emp.name}}</td> -->
<!-- 				</tr> -->
<!-- 			</tbody> -->
			
<!-- 		</table> -->
<!-- 		<hr> -->
<!-- 			<p>	empForm.$dirty = {{empForm.$dirty}}</p> -->
<!-- 			<p>	empForm.$pristine = {{empForm.$pristine}}</p> -->
<!-- 			<p>	empForm.$valid = {{empForm.$valid}}</p> -->
<!-- 			<p>	empForm.$invalid = {{empForm.$invalid}}</p> -->
	<!-- 		<p>	empForm.$error = {{empForm.$error}}</p> -->
	<div class="container">
		<div class="jumbotron">
			<h1>회원가입</h1>
			<p>Refrigerator 회원가입을 환영합니다.</p>
			<hr>
			<form novalidate="novalidate" name="empForm" data-ng-submit="empSubmit()">
				<!-- email -->
				<div class="form-group">
					<label for="email">email</label>
					<input id="email" name="email" type="email" class="form-control" data-ng-model="email" data-ng-required="true" placeholder="Enter email"/>
				</div>
	<!-- 				<p>	empForm.email.$dirty = {{empForm.email.$dirty}}</p> -->
	<!-- 				<p>	empForm.email.$pristine = {{empForm.email.$pristine}}</p> -->
	<!-- 				<p>	empForm.email.$valid = {{empForm.email.$valid}}</p> -->
	<!-- 				<p>	empForm.email.$invalid = {{empForm.email.$invalid}}</p> -->
	<!-- 				<p>	empForm.email.$error = {{empForm.email.$error}}</p> -->
				<!-- password -->
				<div class="form-group">
					<label for="password">password</label>
					<input id="password" name="password" type="password" class="form-control" data-ng-model="password" data-ng-required="true" data-ng-minlength="5" placeholder="Enter password : 5자리 이상을 사용해주세요"/>
				</div>
	<!-- 				<p>	empForm.password.$dirty = {{empForm.password.$dirty}}</p> -->
	<!-- 				<p>	empForm.password.$pristine = {{empForm.password.$pristine}}</p> -->
	<!-- 				<p>	empForm.password.$valid = {{empForm.password.$valid}}</p> -->
	<!-- 				<p>	empForm.password.$invalid = {{empForm.password.$invalid}}</p> -->
	<!-- 				<p>	empForm.password.$error = {{empForm.password.$error}}</p> -->
				<!-- age -->
				<div class="form-group">
					<label for="name">Name</label>
					<input id="name" name="name" type="text" class="form-control" data-ng-model="name" data-ng-required="true" placeholder="Enter name"/>
				</div>
	<!-- 				<p>	empForm.name.$dirty = {{empForm.name.$dirty}}</p> -->
	<!-- 				<p>	empForm.name.$pristine = {{empForm.name.$pristine}}</p> -->
	<!-- 				<p>	empForm.name.$valid = {{empForm.name.$valid}}</p> -->
	<!-- 				<p>	empForm.name.$invalid = {{empForm.name.$invalid}}</p> -->
	<!-- 				<p>	empForm.name.$error = {{empForm.name.$error}}</p> -->
				<!-- submit -->
				<input type="submit" value="회원가입" class="btn btn-info btn-block" data-ng-disabled="!empForm.$valid"/>
			</form>
		</div>
		
	</div>
	
	<div class="container">
		<a href="/refrigeratorweb/m/home" class="btn btn-default btn-block">Home</a>
	</div>

</body>
</html>





















