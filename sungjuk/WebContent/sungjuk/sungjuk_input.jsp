<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="my.sungjuk.*" %>
<!-- sungjuk_input -->
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="sjdto" class="my.sungjuk.SungjukDTO"/>
<jsp:setProperty name="sjdto" property="*"/>

<%
	if (sjdto.getName() == null || sjdto.getCname() == null ||
		sjdto.getName().trim().equals("") || sjdto.getCname().trim().equals("")){
		response.sendRedirect("sungjukSsn.jsp");
		return;
	}
%>
<jsp:useBean id="sjdao" class="my.sungjuk.SungjukDAO" />
<%
		int res = sjdao.insertMember(sjdto);
		if (res>0){%>
			<script type="text/javascript">
				alert("성적입력 완료!")
				self.close()
			</script>	
<%	}else { %>		
			<script type="text/javascript">
				alert("성적입력 실패! 다시 입력해 주세요")
				location.href="sungjukSsn.jsp"
			</script>	
<%	} %>