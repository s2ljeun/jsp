<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.sungjuk.*" %>
<!-- index.jsp -->

<%@ include file="top.jsp" %>
<jsp:useBean id="sjdao" class="my.sungjuk.SungjukDAO" />
<%
	request.setCharacterEncoding("EUC-KR");
%>
	<div align="center">
		<table width="100%">
<%
			List<SungjukDTO> list = null;
			list = sjdao.listSungjuk();
			
			if (list == null || list.size()==0){%>
			<tr>
				<td colspan="9">등록된 성적이 없습니다.</td>
			</tr>
			<%}else{
				for(SungjukDTO dto : list){%>
					<tr>
						<td><%=dto.getNo()%></td>
						<td><%=dto.getName()%></td>
						<td><%=dto.getCname()%></td>
						<td><%=dto.getKor()%></td>
						<td><%=dto.getEng()%></td>
						<td><%=dto.getMath()%></td>
						<td>수정|삭제</td>
					</tr>
					
				<%}
				
			} %>
		</table>
	</div>
<%@ include file="bottom.jsp" %>