<%@page import="site.itwill.dao.MyHewonDAO"%>
<%@page import="site.itwill.dto.MyHewon"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MyHewon> hewonList=MyHewonDAO.getDAO().selectDiscriminatorHewonList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px solid black;
	border-collapse: collapse;
}

th{
	border: 1px solid black;
	padding: 3px;
	color: white;
	background: rgb(192,180,169);
	width: 200px;
}

td {
	border: 1px solid black;
	text-align: center;
	padding: 3px;
	width: 200px;
}

.id { width: 150px; }
.name { width: 150px; }
.phone { width: 200px; }
.email { width: 200px; }
.state { width: 100px; }
</style>
</head>
<body>
	<h1>회원목록</h1>
	<table>
		<tr>
			<th class="id">아이디</th>
			<th class="name">이름</th>
			<th class="phone">전화번호</th>
			<th class="email">이메일</th>
			<th class="state">공개범위</th>
		</tr>
		<% for(MyHewon hewon:hewonList){ %>
		<tr>
			<td class="id"><%=hewon.getId() %></td>
			<td class="name"><%=hewon.getName() %></td>
			<td class="phone"><%=hewon.getPhone() %></td>
			<td class="email"><%=hewon.getEmail() %></td>
			<td class="state"><%=hewon.getState() %></td>
		<tr>
		<%} %>		
		</tr>
	</table>

</body>
</html>