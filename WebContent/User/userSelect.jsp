<%@page import="site.itwill.dao.MyUserDAO"%>
<%@page import="site.itwill.dto.MyUser"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MyUser> userList=MyUserDAO.getDAO().selectAllUser();
//	System.out.println("userList.size() = " + userList.size());		:4
//	System.out.println("userList.get(0) = " + userList.get(0));		:NULL
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mybatis</title>
</head>
<body>
	<h1>회원목록</h1>
	<hr>
	<ul>
	<% for(MyUser user:userList) { %>
		<li>아이디 : <%=user.getUserId() %>, 이름 : <%=user.getUserName() %></li>
	<% } %>
	</ul>	
</body>
</html>








