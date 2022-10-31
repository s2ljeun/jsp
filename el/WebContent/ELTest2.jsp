<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- ELTest2.jsp -->
<html>
<head>
	<title>ELTest2</title>
</head>
<body>
	<h3>표현언어의 사용 예제 2 : 파라메터 값 처리</h3>
	<p>
	<form method="post">
		이름 : <input type="text" name="name">
		<input type="submit" value="전송">
	</form>
	<hr color="red">
<%
		//String name = request.getParameter("name");
%>	
<h3>${param.name}님 반갑습니다.</h3>
	
</body>
</html>