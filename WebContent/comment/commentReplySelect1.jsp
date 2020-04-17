<%@page import="site.itwill.dao.MyReplyDAO"%>
<%@page import="site.itwill.dto.MyReply"%>
<%@page import="java.util.List"%>
<%@page import="site.itwill.dao.MyCommentDAO"%>
<%@page import="site.itwill.dto.MyComment1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(request.getParameter("commentNo")==null){
		response.sendRedirect("commentUserSelectList2.jsp");
		return;
	}

	int commentNo = Integer.parseInt(request.getParameter("commentNo"));

	MyComment1 comment = MyCommentDAO.getDAO().selectComment(commentNo);
	
	List<MyReply> replyList = MyReplyDAO.getDAO().selectCommentNoReplyList(commentNo);
		

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

.no { width: 100px; }
.name { width: 150px; }
.content { width: 250px; }
.date { width: 200px; }
.comment { width: 100px; }
</style>
</head>
<body>
	<h1>게시글</h1>
	<hr />
	<%-- 게시글 출력 --%>
	<table>
		<tr>
			<th>게시글 번호</th>
			<td><%=comment.getCommentNo() %></td>
		</tr>
		<tr>
			<th>게시글 작성자</th>
			<td><%=comment.getCommentId() %></td>
		</tr>
		<tr>
			<th>게시글 내용</th>
			<td><%=comment.getCommentContent() %></td>
		</tr>
		<tr>
			<th>게시글 작성일자</th>
			<td><%=comment.getCommentDate().substring(0,13) %></td>
		</tr>
	</table>
	
	<%-- 댓글 목록 출력 --%>
	<h1><%=comment.getCommentNo() %>번 게시글의 댓글 목록</h1>
	<hr>
	<table>
		<tr>
			<th class="no">댓글번호</th>
			<th class="name">댓글작성자</th>
			<th class="content">댓글내용</th>
			<th class="date">댓글작성일자</th>
			<th class="comment">게시글번호</th>
		</tr>
	<%if(replyList.isEmpty()){ %>
		<tr>
			<td colspan="5">댓글이 존재하지 않습니다.</td>
		</tr>
	<%}else{ %>
		<% for(MyReply reply:replyList) { %>
		<tr>
			<td class="no"><%=reply.getReplyNo() %></td>
			<td class="name"><%=reply.getReplyId()%></td>
			<td class="content"><%=reply.getReplyContent() %></td>
			<td class="date"><%=reply.getReplyDate().substring(0, 19) %></td>
			<td class="comment"><%=reply.getReplyCommentNo() %></td>
		</tr>
		<% } %>
	<%} %>
	</table>
</body>
</html>