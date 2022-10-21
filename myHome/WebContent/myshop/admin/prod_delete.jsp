<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<!-- prod_delete.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
		String pnum = request.getParameter("pnum");
		String pimage = request.getParameter("pimage");
		if (pnum==null || pnum.trim().equals("") || 
				pimage==null || pimage.trim().equals("")){
			response.sendRedirect("main.jsp");
			return;
		}
%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>
<%
		int res = pdao.deleteProd(Integer.parseInt(pnum));
		String msg = null, url = "prod_list.jsp";
		if (res>0){
			String upPath = config.getServletContext().getRealPath("/myshop/images");
			File file = new File(upPath, pimage);
			if (file.exists()){
				file.delete();
				msg = "상품 삭제 성공(이미지도 삭제 성공)!! 상품 목록 페이지로 이동합니다.";
			}else {
				msg = "상품 삭제 성공(이미지 삭제 실패)!! 상품 목록페이지로 이동합니다.";
			}
		}else {
			msg = "상품 삭제 실패!! 상품 목록페이지로 이동합니다.";
		}
%>
<script type="text/javascript">
alert("<%=msg%>")
location.href="<%=url%>"
</script>