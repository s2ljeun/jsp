
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- test6.jsp -->
<html>
	<head>
		<title>test6</title>
	</head>
	<body>
		<h2>�ȳ��ϼ���</h2>
		<%
			for	(int i=0; i<10; ++i){%>
				<h3>�ȳ��ϼ���<%=i+1%></h3>
		<%}
		%>	
	</body>
</html>