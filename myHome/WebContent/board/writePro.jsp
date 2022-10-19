<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writePro.jsp -->
<!-- ������: member_input.jsp -->

<%
		request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="bdto" class="my.board.BoardDTO" />
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="my.board.BoardDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>		

<%//�ڹٺ� ��ü "bdto"�� �ʵ尪�� ������ �ǵ�, request�� �Ѿ�� �Ķ���� ���� ������ �̸���
  //setter�޼ҵ带 ����Ͽ� ���� �����Ѵ�.
  //value���� ������ �ڵ����� �Ķ���� ������ ����
  
  //DTO -> �Խñ� ��ü ����� DAO -> pool����
  
  //"bdao" ��� �ڹٺ�ü�� "pool"�̶�� �̸��� ���� setter�޼ҵ带 �̿��Ͽ�,
  //<%=pool>==�ڹٺ�ü�� ����
%>

<%
		if (bdto.getWriter() == null || bdto.getWriter().trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}

		bdto.setIp(request.getRemoteAddr());
		int res = bdao.insertBoard(bdto);
		String msg = null, url = null;
		if (res>0){
			msg = "�Խñ� ��� ����!! �Խñ� ����������� �̵��մϴ�.";
			url = "list.jsp";
		}else {
			msg = "�Խñ� ��� ����!! �Խñ� ����������� �̵��մϴ�.";
			url = "writeForm.jsp";
		}
		%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>












