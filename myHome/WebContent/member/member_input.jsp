<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_input.jsp -->
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO"/>

<jsp:setProperty name="mbdto" property="*"/>
<!-- mbdto.setName(request.getParameter("name")); -->
<%-- 파라메터명과 같은 변수를 dto에서 자동으로 찾아서 set해준다!!! table의 컬럼명, form태그의 parameter명, dto의 멤버필드 이름은 통일시키자 --%>
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
				alert("회원가입 성공!! 로그인을 해 주세요")
				self.close()
			</script>	
<%	}else { %>		
			<script type="text/javascript">
				alert("회원가입 실패!! 다시 입력해 주세요")
				location.href="memberSsn.jsp"
			</script>	
<%	} %>
