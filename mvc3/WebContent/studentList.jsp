<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, student.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�л����������</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� �� ��</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<th>���̵�</th>
				<th>�̸�</th>
				<th>�б�</th>
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