<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<!-- prod_list.jsp -->
<%@ include file="top.jsp"%>
<div align="center" style="overflow:scroll; width:100%; height:100%">
	<table class="outline" width="100%">
		<caption><font size="4"><b>��ǰ��� ī�װ�</b></font></caption>
		<tr bgcolor="yellow">
			<th class="m2">��ȣ</th>
			<th class="m2">��ǰ�ڵ�</th>
			<th class="m2">��ǰ��</th>
			<th class="m2">�̹���</th>
			<th class="m2">����</th>
			<th class="m2">����</th>
			<th class="m2">����|����</th>
		</tr>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>
<%
		List<ProductDTO> list = pdao.listProd();
		if (list == null || list.size() == 0){%>
		<tr>
			<td colspan="7">��ϵ� ��ǰ�� �����ϴ�.</td>
		</tr>
<%	}else { 
			 for(ProductDTO dto : list){%>
		<tr>
			<td><%=dto.getPnum()%></td>
			<td><%=dto.getPcategory_fk()%></td>
			<td><%=dto.getPname()%></td>
			<td>
			<%	String filename = config.getServletContext().getRealPath("/myshop/images");
					filename += "/" + dto.getPimage();%>
				<a href="prod_view.jsp?pnum=<%=dto.getPnum()%>"><img src="<%=filename%>" width="30" height="30"></a>
			</td>
			<td><%=dto.getPrice()%></td>
			<td><%=dto.getPqty()%></td>
			<td>
				<a href="prod_update.jsp?pnum=<%=dto.getPnum()%>">����</a>|
				<a href="prod_delete.jsp?pnum=<%=dto.getPnum()%>">����</a>
			</td>
		</tr>			 
<%		} 
		}%>				
	</table>		
</div>
<%@ include file="bottom.jsp"%>














