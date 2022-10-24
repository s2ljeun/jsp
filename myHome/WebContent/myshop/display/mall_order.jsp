<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>
<!-- mall_order.jsp -->
<%@ include file="mall_top.jsp"%>
<div align="center" style="overflow:auto; width:100%; height:500">
<jsp:useBean id="prodList" class="my.shop.mall.ProductList" scope="session"/>
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session"/>
<jsp:setProperty property="plist" name="cart" value="<%=prodList%>"/>
<%
		String mode = request.getParameter("mode");
		List<ProductDTO> cartList = null;
		if (mode == null){
			String pnum = request.getParameter("pnum");
			String select = request.getParameter("select");
			String pqty = request.getParameter("pqty");
			ProductDTO dto = prodList.getProduct(Integer.parseInt(pnum), select);
			dto.setPqty(Integer.parseInt(pqty));
			cartList = new ArrayList<>();
			cartList.add(dto);
		}else {
			cartList = cart.listCart();
		}
		DecimalFormat df = new DecimalFormat("###,###");
%>
	<table class="outline" width="90%">
		<tr class="m2">
			<td colspan="3" align="center"><h4>���� ������ ����</h4></td>
		</tr>
		<tr class="m1">
			<th width="60%">��ǰ��</th>
			<th width="15%">����</th>
			<th width="25%">�ݾ�</th>
		</tr>
<%		int totPrice = 0;
			for(ProductDTO dto : cartList){ %>
		<tr>
			<td align="center"><%=dto.getPname()%></td>
			<td align="right"><%=dto.getPqty()%></td>
			<td align="right"><%=df.format(dto.getPqty() * dto.getPrice())%>��</td>
		</tr>
<%			totPrice += dto.getPrice() * dto.getPqty();
			} %>
		<tr class="m1">
			<td colspan="3" align="center">
				<b>�����Ͻ� �Ѿ��� : </b>
				<font color="red"><%=df.format(totPrice)%>��</font>
			</td>	
		</tr>
	</table>
</div>
<%	cart.deleteCart();  %>
<%@ include file="mall_bottom.jsp"%>













