<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- mall_cartEdit.jsp -->
<%
		String pnum = request.getParameter("pnum");
		String pqty = request.getParameter("pqty");
		if (pnum == null || pnum.trim().equals("") || 
				pqty == null || pqty.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
%>
<jsp:useBean id="prodList" class="my.shop.mall.ProductList" scope="session"/>
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session"/>
<jsp:setProperty property="plist" name="cart" value="<%=prodList%>"/>
<%
		int res = cart.editCart(Integer.parseInt(pnum), Integer.parseInt(pqty));
		if (res>0){%>
			<script type="text/javascript">
				alert("��ٱ��Ͽ��� ������ �Ͽ����ϴ�.")
				location.href="mall_cartList.jsp"
			</script>	
<%	}else {%>
			<script type="text/javascript">
				alert("��ٱ��� ���� ����!! �����ڿ��� �����ϼ���")
				location.href="mall_cartList.jsp"
			</script>
<%	} %>




