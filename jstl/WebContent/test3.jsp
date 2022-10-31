<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="500">
		<tr>
			<c:forEach var="k" begin="2" end="9">
				<th>
				<c:out value="${k}"/>
				</th>
			</c:forEach>
		</tr>
			<c:forEach var="i" begin="1" end="9">
				<tr>
				<c:forEach var="j" begin="2" end="9">
					<td>
						<c:out value="${j}*${i}=${j*i}" />
					</td>
				</c:forEach>
				</tr>
			</c:forEach>
	</table>
</body>
</html>