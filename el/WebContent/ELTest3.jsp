<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- ELTest3.jsp -->
<html>
<head>
	<title>ELTest3</title>
</head>
<body>
	<%
		request.setAttribute("name", "�տ���");
		session.setAttribute("name", "ȫ�浿");
	%>
	
	<h3>${sessionScope.name}</h3>
	<%-- page -> request -> session -> application --%>
</body>
</html>