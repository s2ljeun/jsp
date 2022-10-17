<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.sungjuk.*"%>
<!-- list.jsp -->
<html>
<head>
	<title>��������</title>
	<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� �� �� �� �� Ʈ</h2>
		<hr color="green" width="300">
		<table class="outline" width="800">
			<tr>
				<th class="m3">��ȣ</th>
				<th class="m3">�̸�</th>
				<th class="m3">�б�</th>
				<th class="m3">����</th>
				<th class="m3">����</th>
				<th class="m3">����</th>
				<th class="m3">����</th>
				<th class="m3">����</th>
				<th class="m3">����/����</th>
			</tr>
<jsp:useBean id="sdao" class="my.sungjuk.SungjukDAO" />
<%
			request.setCharacterEncoding("EUC-KR");
			String mode = request.getParameter("mode");
			List<SungjukDTO> list = null;
			if (mode == null){
				list = sdao.listSungjuk();
			}else {
				String search = request.getParameter("search");
				String searchString = request.getParameter("searchString");
				list = sdao.findSungjuk(search, searchString);
			}
			if (list==null || list.size()==0){%> 
			<tr>
				<td colspan="9">��ϵ� �л��� �����ϴ�.</td>
			</tr>
<%		}else {
				for(SungjukDTO dto : list){%>
			<tr>
				<td><%=dto.getNum()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getCname()%></td>
				<td><%=dto.getKor()%></td>
				<td><%=dto.getEng()%></td>
				<td><%=dto.getMat()%></td>
				<td><%=dto.getTot()%></td>
				<td><%=dto.getRank()%></td>
				<td>
				<a href="update.jsp?num=<%=dto.getNum()%>">����</a> /
				<a href="delete.jsp?num=<%=dto.getNum()%>">����</a></td>
			</tr>	
<%			} 
			}%>						
		</table>
		<form name="f" method="post">
			<input type="hidden" name="mode" value="find"/>
			<select name="search">
				<option value="name">�̸�</option>
				<option value="cname">�б�</option>
			</select>				
			<input type="text" name="searchString">
			<input type="submit" value="ã��">
			<input type="button" value="�߰�" onclick="window.location='insert.jsp'">
		</form>
	</div>
</body>
</html>





