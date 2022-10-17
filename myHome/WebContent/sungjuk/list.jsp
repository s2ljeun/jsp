<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.sungjuk.*"%>
<!-- list.jsp -->
<html>
<head>
	<title>성적관리</title>
	<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>학 생 성 적 리 스 트</h2>
		<hr color="green" width="300">
		<table class="outline" width="800">
			<tr>
				<th class="m3">번호</th>
				<th class="m3">이름</th>
				<th class="m3">학급</th>
				<th class="m3">국어</th>
				<th class="m3">영어</th>
				<th class="m3">수학</th>
				<th class="m3">총점</th>
				<th class="m3">순위</th>
				<th class="m3">수정/삭제</th>
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
				<td colspan="9">등록된 학생이 없습니다.</td>
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
				<a href="update.jsp?num=<%=dto.getNum()%>">수정</a> /
				<a href="delete.jsp?num=<%=dto.getNum()%>">삭제</a></td>
			</tr>	
<%			} 
			}%>						
		</table>
		<form name="f" method="post">
			<input type="hidden" name="mode" value="find"/>
			<select name="search">
				<option value="name">이름</option>
				<option value="cname">학급</option>
			</select>				
			<input type="text" name="searchString">
			<input type="submit" value="찾기">
			<input type="button" value="추가" onclick="window.location='insert.jsp'">
		</form>
	</div>
</body>
</html>





