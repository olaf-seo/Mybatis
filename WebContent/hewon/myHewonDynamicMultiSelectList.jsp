<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="site.itwill.dao.MyHewonDAO"%>
<%@page import="site.itwill.dto.MyHewon"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//, 로 구분된 아이디 목록을 반환받아 저장
	String ids=request.getParameter("ids");
	if(ids==null || ids.equals("")) ids=null;	

	// 전달받은 아이디 목록을 분리하여 List 인스턴스의 요소로 저장
	List<String> idList=null;
	if(ids!=null){
		idList=new ArrayList<String>();
		for(String id:ids.split(",")){
			idList.add(id.trim());
		}
	}
	
	// System.out.println(idList);
	
	
	List<MyHewon> hewonList=MyHewonDAO.getDAO().selectDynamicMultiHewonList(idList);
	
	
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
		<% if(hewonList.isEmpty()){ %>
			<tr>
				<td colspan="5">검색된 회원정보가 존재하지 않습니다.</td>
			</tr>
		<%}else{ %>
			<% for(MyHewon hewon:hewonList){ %>
			<tr>
				<td class="id"><%=hewon.getId() %></td>
				<td class="name"><%=hewon.getName() %></td>
				<td class="phone"><%=hewon.getPhone() %></td>
				<td class="email"><%=hewon.getEmail() %></td>
				<td class="state"><%=hewon.getState() %></td>
			</tr>
			<%} %>		
		<%} %>
	</table>
	
	<form method="post">
		<fieldset style="width: 28%;">
			<legend>검색</legend>
			아이디 : <input type="text" name="ids" />&nbsp;&nbsp;
			<button type="submit">검색</button><br /><br />
			<b>[검색하고자 하는 아이디가 여러 개인 경우 ,로 구분하여 입력해 주세요.]</b>
		</fieldset>
	</form>
	
	

</body>
</html>