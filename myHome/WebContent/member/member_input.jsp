<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_input.jsp -->
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO"/>

<jsp:setProperty name="mbdto" property="*"/>
<!-- mbdto.setName(request.getParameter("name")); -->
<%-- �Ķ���͸�� ���� ������ dto���� �ڵ����� ã�Ƽ� set���ش�!!! table�� �÷���, form�±��� parameter��, dto�� ����ʵ� �̸��� ���Ͻ�Ű�� --%>
<%
	if (mbdto.getName() == null || mbdto.getName().trim().equals("")){
		response.sendRedirect("memberSsn.jsp");
		return;
	}
%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
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
