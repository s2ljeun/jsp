<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- test1.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>JSTL ���� 1</title>
</head>
<body>
	browser������ ����
	<c:set var="browser" value="${header['User-Agent']}" /><br>
	������ browser : <c:out value="${browser}" /><p>
	<c:remove var="browser" />
	������ browser : <c:out value="${browser}" />
</body>
</html>
