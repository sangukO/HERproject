<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">

<title>응급실 가용 병상 조회 프로젝트</title>
<style type = "text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>
</head>
<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");	
		}
		int pageNumber = 1;
		String search = request.getParameter("search"); 
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
				<li><a href="main.jsp">메인</a></li>
				<li class = "active"><a href="bbs.jsp">게시판</a></li>
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
	
	<div class = "container">
		<form class="navbar-form navbar-right" method="get" action="bbsSearch.jsp">
			<div class="form-group">
				<input type="text" name="search" class="form-control" placeholder="병원명을 입력하세요.">
			</div>
			<button type="submit" class="btn btn-default">검색</button>
		</form>
	</div>
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align:center;">번호</th>
						<th style="background-color:#eeeeee; text-align:center;">제목</th>
						<th style="background-color:#eeeeee; text-align:center;">작성자</th>
						<th style="background-color:#eeeeee; text-align:center;">작성일</th>
						<th style="background-color:#eeeeee; text-align:center;">병원명</th>
					</tr>
				</thead>
				<tbody>
				<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list2 = bbsDAO.getList2(pageNumber, search);
					for(int i = 0; i < list2.size(); i++) {
				%>
					<tr>
						<td><%= list2.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list2.get(i).getBbsID() %>"><%= list2.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;") %></a></td>
						<td><%= list2.get(i).getUserID() %></td>
						<td><%= list2.get(i).getBbsDate().substring(0, 11) + list2.get(i).getBbsDate().substring(11, 13) + "시" + list2.get(i).getBbsDate().substring(14, 16) + "분"%></td>
						<td><%= list2.get(i).getBbsName() %></td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-primary btn-arraw-left">이전</a>
			<%
				} if(bbsDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-primary btn-arraw-left">다음</a>
			<%
				}
			%>
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
			
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>	
</body>
</html>