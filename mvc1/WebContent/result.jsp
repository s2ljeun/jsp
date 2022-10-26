<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*" %>
<!-- result.jsp -->
<html>
<head>
<title>결과보기</title>
</head>
<body>
	<%
		List<String> list = (List)request.getAttribute("advice");
		for(String str : list){
			out.println("<h3>" + str + "</h3>");
		}
	%>
</body>
</html>