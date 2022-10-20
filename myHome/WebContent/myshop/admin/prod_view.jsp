<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.shop.*"%>
<!-- prod_view.jsp -->
<%@ include file="top.jsp"%>

<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>

<%
	ProductDTO dto = pdao.viewProd(pnum);
%>

<div align="center" style="width:80%; height:100%">
	<table class="outline" width="600">
		<caption><font size="4"><b>��ǰ�󼼺���</b></font></caption>
		<tr>
			<th class="m2" width="100">ī�װ�</th>
			<td width="200"></td>
			<th class="m2" width="100">��ǰ��ȣ</th>
			<td width="200"><%=dto.getPnum()%></td>
		</tr>
		<tr>
			<th class="m2">��ǰ��</th>
			<td><%=dto.getPname()%></td>
			<th class="m2">����ȸ��</th>
			<td><%=dto.getPcompany()%></td>
		</tr>
		<tr>
			<th class="m2" height="100">��ǰ�̹���</th>
			<td colspan="3">
				<%	String filename = config.getServletContext().getRealPath("/myshop/images");
					filename += "/" + dto.getPimage();%>
				<img src="<%=filename%>" width="50" height="50">
			</td>
		</tr>
		<tr>
			<th class="m2">��ǰ ����</th>
			<td><%=dto.getPqty()%></td>
			<th class="m2">��ǰ ����</th>
			<td><%=dto.getPrice()%></td>
		</tr>
		<tr>
			<th class="m2">��ǰ ����</th>
			<td><%=dto.getPspec()%></td>
			<th class="m2">��ǰ ����Ʈ</th>
			<td><%=dto.getPoint()%></td>
		</tr>
		<tr>
			<th class="m2" height="100">��ǰ�Ұ�</th>
			<td colspan="3">
				<textarea rows="4" cols="60" readOnly>
					<%=dto.getPcontents()%>
				</textarea>
			</td>
		</tr>
		<tr align="center">
			<td colspan="4">
				<input type="button" value="���ư���"/>
			</td>
		</tr>
	</table>
</div>
<%@ include file="bottom.jsp"%>