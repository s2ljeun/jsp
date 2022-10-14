<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %> <!-- 임포트는 이렇게 따로 적을 수도 있다. -->
<%@ page import="java.util.*"%>
<%@ page import="my.student.*" %> 

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
<jsp:useBean id="stdao" class="my.student.StudentDAO" />			
<%		//DB에서 자료를 가져와 화면에 구현한다.
			List<StudentDTO> list = stdao.listStudent(); //몇명일지모르니까 list사용해
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