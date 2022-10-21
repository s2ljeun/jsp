<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<!-- prod_update_ok.jsp -->
<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/myshop/images");
		int len = 10*1024*1024;
		try{
			mr = new MultipartRequest(request, upPath, len, "EUC-KR");
		}catch(IOException e){
			System.out.println("���� ���ε� �� ���� �߻�!!");
			e.printStackTrace();
		}
%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>
<%
		int res = pdao.updateProd(mr);
		String msg = null, url = null;
		if (res>0){
			msg = "��ǰ ���� ����!! ��ǰ ����������� �̵��մϴ�.";
			url = "prod_list.jsp";
		}else {
			msg = "��ǰ ���� ����!! ��ǰ ����������� �̵��մϴ�.";
			url = "prod_list.jsp";
		}
%>
<script type="text/javascript">
alert("<%=msg%>")
location.href="<%=url%>"
</script>
