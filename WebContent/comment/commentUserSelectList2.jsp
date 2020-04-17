<%@page import="site.itwill.dto.MyCommentUser2"%>
<%@page import="site.itwill.dao.MyCommentDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<MyCommentUser2> commentUserList=MyCommentDAO.getDAO().selectCommentUserList2();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	border: 1px solid black;
	border-collapse: collapse;
}

th{
	border: 1px solid black;
	padding: 3px;
	color: white;
	background: rgb(192,180,169);
}

td{
	border: 1px solid black;
	text-align: center;
	padding: 3px;
}

.no { width: 100px; }
.name { width: 150px; }
.content { width: 250px; }
.date { width: 200px; }

</style>
</head>
<body>
	<h1>게시글 목록</h1>
	<hr />
	<table>
		<tr>
			<th class="no">게시글번호</th>
			<th class="name">게시글작성자</th>
			<th class="content">게시글내용</th>
			<th class="date">게시글작성일자</th>
		</tr>
		<% for(MyCommentUser2 commentUser:commentUserList){ %>
		<tr>
			<td class="no"><%=commentUser.getComment().getCommentNo() %></td>
			<td class="name"><%=commentUser.getUser().getUserName() %>(<%=commentUser.getUser().getUserId() %>)</td>
			<%-- <td class="content"><%=commentUser.getComment().getCommentContent() %></td> --%>
			
			<%-- 
			<td class="content">
				<a href="commentReplySelect1.jsp?commentNo=<%=commentUser.getComment().getCommentNo()%>">
				<%=commentUser.getComment().getCommentContent() %>
				</a>
			</td>
			--%>
			<%-- 
			<td class="content">
				<a href="commentReplySelect2.jsp?commentNo=<%=commentUser.getComment().getCommentNo()%>">
					<%=commentUser.getComment().getCommentContent() %>
				</a>
			</td>
			--%>
			<td class="content">
				<a href="commentUserReplyUserSelect.jsp?commentNo=<%=commentUser.getComment().getCommentNo()%>">
					<%=commentUser.getComment().getCommentContent() %>
				</a>
			</td>
			
			<td class="date"><%=commentUser.getComment().getCommentDate().substring(0,19) %></td>
		</tr>
		<%} %>
	</table>

</body>
</html>