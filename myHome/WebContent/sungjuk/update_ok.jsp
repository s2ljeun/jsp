<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- update_ok.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="sdto" class="my.sungjuk.SungjukDTO" />
<jsp:setProperty property="*" name="sdto"/>
<%
		if (sdto.getName() == null || sdto.getCname() == null || 
			sdto.getName().trim().equals("") || sdto.getCname().trim().equals("")){
			response.sendRedirect("update.jsp?num=" + sdto.getNum());
			return;
		}
%>
<jsp:useBean id="sdao" class="my.sungjuk.SungjukDAO" />
<%
		int res = sdao.updateSungjuk(sdto);
		String msg = null, url = null;
		if (res>0){
			msg = "������������!! ��������Ʈ �������� �̵��մϴ�.";
			url = "list.jsp";
		}else { 
			msg = "������������!! ��������Ʈ �������� �̵��մϴ�.";
			url = "list.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>




