<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- ELTest2.jsp -->
<html>
<head>
	<title>ELTest2</title>
</head>
<body>
	<h3>ǥ������� ��� ���� 2 : �Ķ���� �� ó��</h3>
	<p>
	<form method="post">
		�̸� : <input type="text" name="name">
		<input type="submit" value="����">
	</form>
	<hr color="red">
<%
		//String name = request.getParameter("name");
%>	
<h3>${param.name}�� �ݰ����ϴ�.</h3>
	
</body>
</html>