<%--
  Created by IntelliJ IDEA.
  User: jukho
  Date: 2022-11-19
  Time: 오전 5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File"%>
<%@ page import = "com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<html>
<head>
    <title>파일 업로드 결과</title>
</head>
<body>
<%
    String filename = "";
    int sizeLimit = 10*1024*1024;

    String realPath = request.getServletContext().getRealPath("upload");

    File dir = new File(realPath);
    if (!dir.exists()) dir.mkdirs();

    MultipartRequest multipartRequest = new MultipartRequest(request, realPath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());

    filename = multipartRequest.getFilesystemName("photo");

%>
파일명 : <%=multipartRequest.getOriginalFileName(("photo"))%><br/>
<img src="${pageContext.request.contextPath}/upload/<%=filename%>">
<button class="btn" onclick="location.href='posts.jsp'">확인</button>
</body>
</html>
