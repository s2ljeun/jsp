<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="student.*" %>    
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
<%		//DB���� �ڷḦ ������ ȭ�鿡 �����Ѵ�.
			List<StudentDTO> list = (List)request.getAttribute("listStudent");
			if (list == null || list.size() == 0){%>
			<tr>
				<td colspan="3">��ϵ� �л��� �����ϴ�.</td>
			</tr>
<%		}else{	
				for(StudentDTO dto : list){%>
			<tr>
				<td><%=dto.getId()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getCname()%></td>
			</tr>	
<%			}
			}%>
		</table>
	</div>	
</body>
</html>








