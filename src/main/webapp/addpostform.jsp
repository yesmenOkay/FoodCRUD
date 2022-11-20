<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>음식 추가하기</h1>
<form action="addpost.jsp" method="post">
<table>
<tr><td>음식 이름:</td><td><input type="text" name="title"/></td></tr>
<tr><td>작성자:</td><td><input type="text" name="writer"/></td></tr>
    <tr><td>사진:</td><td>  <input type="file" name="photo"></td></tr>
    <tr><td>종류:</td><td><input type="text" name="kind"/></td></tr>
<tr><td>설명:</td><td><textarea cols="50" rows="5" name="detail"></textarea></td></tr>
<tr><td></td><td></td><td></td><td><input type="button" value="취소하기" onclick="history.back()"/><input type="submit" value="추가하기"/></td></tr>
</table>
</form>

</body>
</html>