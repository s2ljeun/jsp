<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="student.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- c라는 이름으로 코어 만든 후 c:태그 사용 가능 -->
<!-- list.jsp -->
<html>
<head>
	<title>학생목록</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>학 생 목 록 페 이 지</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr>
				<th>아이디</th>
				<th>학생명</th>
				<th>학급명</th>
			</tr>
			<c:if test="${empty listStudent}">
				<tr>
					<td colspan="3">등록된 학생이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${listStudent}"> <!-- listStudent 안 객체의 자료형이 자동으로 감지죔 ... /자동으로 StudentDTO자료형이 된다. -->
				<tr>
					<td>${dto.id}</td> <!-- getter메소드 -->
					<td>${dto.name}</td>
					<td>${dto.cname}</td>
				</tr>
			</c:forEach>
		</table>
	</div>	
</body>
</html>








