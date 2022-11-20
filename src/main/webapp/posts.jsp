<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.FoodDAO, com.example.bean.FoodVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
<title>22100715</title>
<style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #006bb3;
  color: white;
}
</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deletepost.jsp?id=' + id;
	}
</script>
</head>
<body>
<h1 align="center">좋아하는 음식 리스트</h1><p align="right">22100715 주경호</p>
<%
	FoodDAO foodDAO = new FoodDAO();
	List<FoodVO> list = foodDAO.getFoodList();
	request.setAttribute("list",list);
%>
<table class="table">
	<thead class="table-info">
	<tr>
		<th>No</th>
		<th>음식 이름</th>
		<th>작성자</th>
		<th>사진</th>
		<th>종류</th>
		<th>설명</th>
		<th>업로드 날짜</th>
		<th><button class="btn btn-success" onclick="location.href='addpostform.jsp'">추가</button></th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="u">
		<tr>
			<td>${u.getSeq()}</td>
			<td>${u.getTitle()}</td>
			<td>${u.getWriter()}</td>
			<td><img src="${pageContext.request.contextPath}/upload/${u.getPhoto()}"></td>
			<td>${u.getKind()}</td>
			<td>${u.getDetail()}</td>
			<td>${u.getRegdate()}</td>
			<td><button class="btn btn-primary" onclick="location.href='editform.jsp?id=${u.getSeq()}'">수정</button>
				<button class="btn btn-danger" onclick="location.href='javascript:delete_ok(${u.getSeq()})'">삭제</button></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>