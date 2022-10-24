<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- mall_cartAdd.jsp -->
<%
		String pnum = request.getParameter("pnum");
		String select = request.getParameter("select");
		String pqty = request.getParameter("pqty");
		if (pnum == null || select == null || pqty == null || 
				pnum.trim().equals("") || select.trim().equals("") || pqty.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
%>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:useBean id="prodList" class="my.shop.mall.ProductList" scope="session"/>
<jsp:setProperty property="pool" name="prodList" value="<%=pool%>"/>
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session"/>
<jsp:setProperty property="plist" name="cart" value="<%=prodList%>"/>

<%
		int res = cart.insertCart(Integer.parseInt(pnum), select, Integer.parseInt(pqty));
		if (res>0){%>
			<script type="text/javascript">
				alert("장바구니 리스트로 이동합니다.")
				location.href="mall_cartList.jsp"
			</script>	
<%	}else {%>
			<script type="text/javascript">
				alert("장바구니 담기 실패!! 관리자에게 문의하세요")
				location.href="mall.jsp"
			</script>
<%	} %>











