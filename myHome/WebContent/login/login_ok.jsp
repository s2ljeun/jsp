<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.member.*"%>
<!-- login_ok.jsp -->
<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String saveId = request.getParameter("saveId");
		//checkbox로 넘어온 값은 체크가 되어 있으면 on, 체크가 안되어 있으면 null
		if (id==null || id.trim().equals("")){
			response.sendRedirect("login.jsp");
			return;
		}
%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="mbdao" value="<%=pool%>"/>
<%
		MemberDTO dto = mbdao.getMember(id);
		String msg = null, url = null;
		if (dto == null){
			msg = "해당하는 아이디가 없습니다. 다시 확인하시고 입력해 주세요!!";
			url = "login.jsp";
		}else {
			if (dto.getPasswd().equals(passwd)){
				//메세지 및 이동경로 지정
				msg = dto.getName()+"님, 환영합니다.";
				url = request.getContextPath()+"/index.jsp";
				//세션저장
				session.setAttribute("mdto", dto);
				//쿠키전송
				Cookie ck = new Cookie("saveId", id);
				if(saveId == null){
					ck.setMaxAge(0);
				}else{
					ck.setMaxAge(24*60*60);
				}
				response.addCookie(ck);
			}else {
				msg = "비밀번호가 틀렸습니다. 다시 확인하시고 입력해 주세요!!";
				url = "login.jsp";
			}
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>















