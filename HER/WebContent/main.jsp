<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">

<title>응급실 가용 병상 조회 프로젝트</title>
</head>
<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");	
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp">응급실 가용 병상 조회</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class = "active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
				if(userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
			</ul>
			<%		
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><%=userID %>님 환영합니다.<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
		<div class = "jumbotron">
			<div class = "contianer">
				<h1>프로젝트 HER</h1>
				<p> 응급실 가용 병상 정보를 조회하는 프로젝트 웹사이트</p>
			</div>
		</div>
	</div>
	
	<div class = "container">
		<form action="list.jsp" target="iframe1">
			<table  align="center">
				<tr align="center"><td><h3>검색</h3><br></td></tr>
				<tr align="center"><td>
					<input type="text" name="si" required="required" autocomplete=”off” style="width:200px;">&nbsp; &nbsp;시 &nbsp;&nbsp;&nbsp;
					<input type="text" name="gungu" required="required" autocomplete=”off” style="width:200px;">&nbsp; &nbsp;군 / 구 &nbsp;
					<input type="submit" value="검색" class="btn btn-primary form-control" style="width:50px;"><br><br></td></tr>
				<tr align="center"><td>
					<iframe width="1100" height="700" id="iframe1" name="iframe1" frameborder="0"></iframe></td></tr>
			</table>
			
		</form>
	</div>
			
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>	
</body>

</html>