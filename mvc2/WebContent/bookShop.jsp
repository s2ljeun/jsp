<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- bookShop.jsp -->
<html>
<head>
	<title>��������</title>
</head>
<body>
	<h1>���� ���� ������</h1>
	<form name="f" action="book.do" method="post">
		<input type="hidden" name="command" value="ADD" />
		<b>���� ���� : </b>
		<select name="book">
			<option>�ڹ��� ���� / ���ü� / 31000</option>
			<option>�̰��� �ڹٴ� / �ſ�� / 35000</option>
			<option>Servlet&JSP / ������ / 26000</option>
			<option>������ ��Ŭ�� ���̼� ���� / �ֱ��� / 35000</option>
		</select>
		<b>���� : </b>
		<input type="text" name="qty" size="2" value="1">
		<input type="submit" value="�ֹ��ϱ�">
	</form>
	<jsp:include page="cart.jsp"/>	
</body>
</html>









