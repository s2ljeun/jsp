<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- insert_ok.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="sdto" class="my.sungjuk.SungjukDTO" />
<jsp:setProperty property="*" name="sdto"/>
<%
		if (sdto.getName() == null || sdto.getCname() == null || 
			sdto.getName().trim().equals("") || sdto.getCname().trim().equals("")){
			response.sendRedirect("insert.jsp");
			return;
		}
%>
<jsp:useBean id="sdao" class="my.sungjuk.SungjukDAO" />
<%
		int res = sdao.insertSungjuk(sdto);
		String msg = null, url = null;
		if (res>0){
			msg = "성적등록성공!! 성적리스트 페이지로 이동합니다.";
			url = "list.jsp";
		}else {
			msg = "성적등록실패!! 성적등록 페이지로 이동합니다.";
			url = "insert.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>










