<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %> <!-- ����Ʈ�� �̷��� ���� ���� ���� �ִ�. -->
<%@ page import="java.util.*"%>
<%@ page import="my.student.*" %> 

<!-- list.jsp -->
<html>
<head>
<title>�л����</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� �� �� �� �� ��</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr>
				<th>���̵�</th>
				<th>�л���</th>
				<th>�б޸�</th>
	</tr>
<jsp:useBean id="stdao" class="my.student.StudentDAO" />			
<%		//DB���� �ڷḦ ������ ȭ�鿡 �����Ѵ�.
			List<StudentDTO> list = stdao.listStudent(); //��������𸣴ϱ� list�����
			for(StudentDTO dto : list){%>
				<tr>
					<td><%=dto.getId()%></td>
					<td><%=dto.getName()%></td>
					<td><%=dto.getCname()%></td>
				</tr>	
<%		}%>
		</table>
	</div>	
</body>
</html>