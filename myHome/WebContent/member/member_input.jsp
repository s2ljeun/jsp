<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_input.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO"/>
<!-- mbdto.setName(request.getParameter("name")); -->
<jsp:setProperty name="mbdto" property="*"/>
<%-- table�� �÷���, form�±��� parameter��, dto�� ����ʵ� �̸��� ���Ͻ�Ű�� --%>
<%
		if (mbdto.getName() == null || mbdto.getName().trim().equals("")){
			response.sendRedirect("memberSsn.jsp");
			return;
		}
%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="mbdao" value="<%=pool%>"/>

<%
		int res = mbdao.insertMember(mbdto);
		if (res>0){%>
			<script type="text/javascript">
				alert("ȸ������ ����!! �α����� �� �ּ���")
				self.close()
			</script>	
<%	}else { %>		
			<script type="text/javascript">
				alert("ȸ������ ����!! �ٽ� �Է��� �ּ���")
				location.href="memberSsn.jsp"
			</script>	
<%	} %>



