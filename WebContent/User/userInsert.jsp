<%@page import="site.itwill.dto.MyUser"%>
<%@page import="site.itwill.dao.MyUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MyUserDAO.getDAO().insertUser(new MyUser("aaa","홍길동"));
	MyUserDAO.getDAO().insertUser(new MyUser("bbb","임꺽정"));
	MyUserDAO.getDAO().insertUser(new MyUser("ccc","전우치"));
	MyUserDAO.getDAO().insertUser(new MyUser("ddd","일지매"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mybatis</title>
</head>
<body>
	<h1>회원등록</h1>
	<hr />
	<h3>회원정보를 성공적으로</h3>
</body>
</html>