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
	<b>글삭제</b><br>
	<form name="f" action="deletePro.jsp" method="post">
		<table border="1" width="50%">
			<tr bgcolor="yellow">
				<th>비밀번호를 입력해 주세요.</th>
			</tr>
			<tr>
				<td align="center">
					비밀번호:
					<input type="password" name="passwd" />
					<input type="hidden" name="num" value="<%=num%>" />
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value="글삭제" />
					<input type="button" value="글목록" onclick="widnow.location='list.jsp'" />
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp" %>