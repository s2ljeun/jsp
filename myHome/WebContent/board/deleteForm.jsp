<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- deleteForm.jsp -->
<%@ include file="../top.jsp" %>
<link rel="stylesheet" type="text/css" href="../style.css">
<%
		String num = request.getParameter("num");
		if (num == null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
%>
<div align="center">
	<b>�ۻ���</b><br>
	<form name="f" action="deletePro.jsp" method="post">
		<table border="1" width="50%">
			<tr bgcolor="yellow">
				<th>��й�ȣ�� �Է��� �ּ���.</th>
			</tr>
			<tr>
				<td align="center">
					��й�ȣ:
					<input type="password" name="passwd" />
					<input type="hidden" name="num" value="<%=num%>" />
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value="�ۻ���" />
					<input type="button" value="�۸��" onclick="widnow.location='list.jsp'" />
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp" %>