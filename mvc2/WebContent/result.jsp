<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, book.*"%>
<!-- result.jsp -->
<html>
<head>
	<title>���系��</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� �� �� ��</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<th>��������</th>
				<th>�۰�</th>
				<th>�ܰ�</th>
				<th>����</th>
				<th>�ݾ�</th>
			</tr>
<%
			Map<String, BookDTO> map = (Map)request.getAttribute("cart");
			Set<String> set = map.keySet();
			Iterator<String> it = set.iterator();
			int sum = 0;
			while(it.hasNext()){
				String key = it.next();
				BookDTO dto = map.get(key);
				sum += dto.getPrice() * dto.getQty();%>
			<tr>
				<td><%=dto.getTitle()%></td>
				<td><%=dto.getAuthor()%></td>
				<td><%=dto.getPrice()%></td>
				<td><%=dto.getQty()%></td>
				<td><%=dto.getPrice()*dto.getQty()%></td>
			</tr>	
<%		}%>		
			<tr>
				<td colspan="4" align="right">�ѱݾ�</td>
				<td><%=sum%></td>
			</tr>	
		</table>
	</div>
</body>
</html>






