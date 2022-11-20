<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.FoodDAO"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.bean.FoodVO" />
<jsp:setProperty property="*" name="u"/>

<%
	FoodDAO foodDAO = new FoodDAO();
	int i=foodDAO.updateFood(u);
	response.sendRedirect("posts.jsp");
%>