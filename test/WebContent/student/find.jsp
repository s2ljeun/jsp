<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, my.student.*"%>
<!-- find.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		if (name==null || name.trim().equals("")){
			response.sendRedirect("student.jsp");
			return;
		}
%>
<html>
<head>
	<title>�л�ã��</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2><%=name%> ã �� �� �� ��</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr>
				<th>���̵�</th>
				<th>�л���</th>
				<th>�б޸�</th>
			</tr>
<jsp:useBean id="stdao" class="my.student.StudentDAO" />			
<%		//DB���� �ڷḦ ������ ȭ�鿡 �����Ѵ�.
			List<StudentDTO> find = stdao.findStudent(name);
			if (find == null || find.size() == 0){%>
				<tr>
					<td colspan="3">ã���ô� �л� <%=name%>�� �����ϴ�.</td>
				</tr>
<%		}else {
				for(StudentDTO dto : find){
				%>
					<tr>
						<td><%=dto.getId()%></td>
						<td><%=dto.getName()%></td>
						<td><%=dto.getCname()%></td>
					</tr>	
	<%		}%>
					<tr>
						<td colspan="3">ã���ô� �л� <%=name%>�� �� <%=find.size()%>�� �ֽ��ϴ�.</td>
					</tr>
<%		}%>
		</table>
	</div>	
</body>
</html>