<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_input.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO"/>
<!-- mbdto.setName(request.getParameter("name")); -->
<jsp:setProperty name="mbdto" property="*"/>
<%-- table의 컬럼명, form태그의 parameter명, dto의 멤버필드 이름은 통일시키자 --%>
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
				alert("회원가입 성공!! 로그인을 해 주세요")
				self.close()
			</script>	
<%	}else { %>		
			<script type="text/javascript">
				alert("회원가입 실패!! 다시 입력해 주세요")
				location.href="memberSsn.jsp"
			</script>	
<%	} %>



