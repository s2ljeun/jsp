<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.sungjuk.*" %>
<!-- sungjukList -->

<%
	request.setCharacterEncoding("EUC-KR");
%>

<%@ include file="../top.jsp" %>

<jsp:useBean id="sjdao" class="my.sungjuk.SungjukDAO" />
<jsp:setProperty name="sjdao" property="*" />

	<div align="center">
		<table width="100%">
<%
			List<SungjukDTO> list = null;
			list = sjdao.findSungjuk();
			
			if (list == null || list.size()==0){%>
			<tr>
				<td colspan="9">��ϵ� ������ �����ϴ�.</td>
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
						<td>
							<a href="sungjuk_edit.jsp">����</a>
							|
							<a href="sungjuk_delete.jsp">����</a>
						</td>
					</tr>
					
				<%}
				
			} %>
		</table>
	</div>
<%@ include file="../bottom.jsp" %>