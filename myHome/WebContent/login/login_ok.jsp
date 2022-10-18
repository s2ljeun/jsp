<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.member.*"%>
<!-- login_ok.jsp -->
<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String saveId = request.getParameter("saveId");
		//checkbox�� �Ѿ�� ���� üũ�� �Ǿ� ������ on, üũ�� �ȵǾ� ������ null
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
			msg = "�ش��ϴ� ���̵� �����ϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���!!";
			url = "login.jsp";
		}else {
			if (dto.getPasswd().equals(passwd)){
				//�޼��� �� �̵���� ����
				msg = dto.getName()+"��, ȯ���մϴ�.";
				url = request.getContextPath()+"/index.jsp";
				//��������
				session.setAttribute("mdto", dto);
				//��Ű����
				Cookie ck = new Cookie("saveId", id);
				if(saveId == null){
					ck.setMaxAge(0);
				}else{
					ck.setMaxAge(24*60*60);
				}
				response.addCookie(ck);
			}else {
				msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���!!";
				url = "login.jsp";
			}
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>















