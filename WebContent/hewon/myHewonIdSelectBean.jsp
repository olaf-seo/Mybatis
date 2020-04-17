<%@page import="site.itwill.dao.MyHewonDAO"%>
<%@page import="site.itwill.dto.MyHewon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	
	String id="";
	
	if(name!=null && phone!=null){
		// JavaBean 클래스로 인스턴스를 생성하고 전달값을 이용하여 필드값 변경
		MyHewon hewon=new MyHewon();
		hewon.setName(name);
		hewon.setPhone(phone);
		
		// JavaBean 인스턴스(이름과 전화번호)을 전달하여 아이디를 검색하여 반환하는 메소드 호출
		id=MyHewonDAO.getDAO().selectBeanHewonId(hewon);
	}
	
	
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
</style>
</head>
<body>
	<h1>아이디 찾기</h1>
	<hr />
	<form action="" name="searchForm" id="searchForm">
	<table>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit">아이디 검색</button>
			</td>
		</tr>
	</table>
	</form>
	
	<hr />
	<% if(name!=null && phone!=null){ %>
	<div style="font-weight: bold; color: blue;">
		<% if(id==null || id.equals("")){ %>
			<%=name %> 님의 아이디가 존재하지 않습니다.
		<%} else {%>
			<%=name %> 님의 아이디는 [<%=id %>] 입니다.
		<%} %>
	</div>
	<%} %>
	
	<script type="text/javascript">
	document.getElementById("searchForm").onsubmit=function(){
		if(searchForm.name.value==""){
			alert("이름을 입력해주세요.");
			return false;
		}
		
		if(searchForm.phone.value==""){
			alert("전화번호를 입력해주세요.");
			return false;
		}
	}
	</script>
	

</body>
</html>