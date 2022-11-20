<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.FoodDAO, com.example.bean.FoodVO"%>
<%@ page import="com.example.common.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){
		int id = Integer.parseInt(sid);
		FoodVO u = new FoodVO();
		u.setSeq(id);
		FoodDAO foodDAO = new FoodDAO();

		String filename = foodDAO.getPhotoFilename(id);
		if(filename != null) FileUpload.deleteFile(request, filename);
		foodDAO.deleteFood(u);
	}
	response.sendRedirect("posts.jsp");
%>