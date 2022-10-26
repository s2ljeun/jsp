<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, student.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>학생목록페이지</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>학 생 목 록</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<th>아이디</th>
				<th>이름</th>
				<th>학급</th>
			</tr>
			<%
				List<StudentDTO> list = (List)session.getAttribute("student");
				for(StudentDTO dto : list){%>
					<tr>
						<td><%=dto.getId()%></td>
						<td><%=dto.getName()%></td>
						<td><%=dto.getCname()%></td>
					</tr>
				<%}
			%>
		</table>
</body>
</html>