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
				alert("장바구니에서 수정을 하였습니다.")
				location.href="mall_cartList.jsp"
			</script>	
<%	}else {%>
			<script type="text/javascript">
				alert("장바구니 수정 실패!! 관리자에게 문의하세요")
				location.href="mall_cartList.jsp"
			</script>
<%	} %>




