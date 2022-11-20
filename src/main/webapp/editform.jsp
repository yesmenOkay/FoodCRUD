<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.dao.FoodDAO, com.example.bean.FoodVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
</head>
<body>

<%
	FoodDAO foodDAO = new FoodDAO();
	String id=request.getParameter("id");
	FoodVO u=foodDAO.getFood(Integer.parseInt(id));
%>

<h1>음식 수정</h1>
<form action="editpost.jsp" method="post">
<input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
<table>
<tr><td>이름:</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>
<tr><td>작성자:</td><td><input type="text" name="writer" value="<%= u.getWriter()%>" /></td></tr>
	<tr><td>사진:</td><td>  <input type="file" name="photo" value="<%=u.getPhoto()%>"></td></tr>
	<tr><td>종류:</td>:</td><td><input type="text" name="kind" value="<%= u.getKind()%>" /></td></tr>
<tr><td>설명:</td><td><textarea cols="50" rows="5" name="detail"><%= u.getDetail()%></textarea></td></tr>
<tr ></td><td></td><td></td><td></td><td colspan="2"><input type="button" value="취소하기" onclick="history.back()"/><input type="submit" value="수정하기"/></td></tr>
</table>
</form>

</body>
</html>