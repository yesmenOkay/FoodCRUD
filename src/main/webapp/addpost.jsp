<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.FoodDAO"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.bean.FoodVO" />
<jsp:setProperty property="*" name="u"/>

<%
	FoodDAO boardDAO = new FoodDAO();
	int i = boardDAO.insertFood(u);
	String msg = "사진을 확인합니다!";
	if(i == 0) msg = "[에러] 값을 확인해주세요!";
%>
<form align="center" method="post" action="fileupload.jsp" enctype="multipart/form-data">
	<input type="file" name="photo">
	<input type="submit" value="사진확인하기">
</form>
<script>
		alert('<%=msg%>');
</script>