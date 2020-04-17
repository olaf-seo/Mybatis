<%@page import="site.itwill.dto.MyReplyUser"%>
<%@page import="site.itwill.dao.MyReplyDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<MyReplyUser> replyUserList=MyReplyDAO.getDAO().selectReplyUserList();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mybatis</title>
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
}

td {
	border: 1px solid black;
	text-align: center;
	padding: 3px;
}

.no { width: 100px; }
.name { width: 150px; }
.content { width: 250px; }
.date { width: 200px; }
.comment { width: 100px; }
</style>
</head>
<body>
	<h1>댓글 목록</h1>
	<hr>
	<table>
		<tr>
			<th class="no">댓글번호</th>
			<th class="name">댓글작성자</th>
			<th class="content">댓글내용</th>
			<th class="date">댓글작성일자</th>
			<th class="comment">게시글번호</th>
		</tr>
		<% for(MyReplyUser replyUser:replyUserList) { %>
		<tr>
			<td class="no"><%=replyUser.getReply().getReplyNo() %></td>
			<td class="name"><%=replyUser.getUser().getUserName() %>(<%=replyUser.getUser().getUserId() %>)</td>
			<td class="content"><%=replyUser.getReply().getReplyContent() %></td>
			<td class="date"><%=replyUser.getReply().getReplyDate().substring(0,13) %></td>
			<td class="comment"><%=replyUser.getReply().getReplyCommentNo() %></td>
		</tr>
		<% } %>
	</table>
</body>
</html>