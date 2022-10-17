<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.sungjuk.*"%>
<!-- update.jsp -->
<%
		String num = request.getParameter("num");
		if (num == null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
%>
<jsp:useBean id="sdao" class="my.sungjuk.SungjukDAO" />
<%
		SungjukDTO dto = sdao.getSungjuk(Integer.parseInt(num));
%>
<html>
<head>
	<title>성적입력</title>
	<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>학 생 성 적 수 정 페 이 지</h2>
		<hr color="green" width="300">
		<form name="f" action="update_ok.jsp" method="post">
			<input type="hidden" name="num" value="<%=num%>"/>
			<table border="1" width="400">
				<tr>
					<th width="100">이름</th>
					<td><input type="text" name="name" value="<%=dto.getName()%>" readOnly></td>
				</tr>
				<tr>
					<th width="100">학급</th>
					<td><input type="text" name="cname" value="<%=dto.getCname()%>" readOnly></td>
				</tr>
				<tr>
					<th width="100">국어</th>
					<td><input type="text" name="kor" value="<%=dto.getKor()%>"></td>
				</tr>
				<tr>
					<th width="100">영어</th>
					<td><input type="text" name="eng" value="<%=dto.getEng()%>"></td>
				</tr>
				<tr>
					<th width="100">수학</th>
					<td><input type="text" name="mat" value="<%=dto.getMat()%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정">
						<input type="reset" value="처음으로">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>