<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- depart_choice.jsp -->
<html>
<head>
	<title>�а�����</title>
</head>
<body>
	<h1 align="center">�а� ���� ������</h1>
	<form name="f" action="depart.do" method="post">
		�а����� :
		<select name="depart" size="1">
			<option value="kor">�����а�</option>
			<option value="eng">�����а�</option>
			<option value="com">��ǻ�Ͱ��а�</option>
			<option value="game">�����а�</option>
		</select>
		<input type="submit" value="����"/>
	</form>
</body>
</html>