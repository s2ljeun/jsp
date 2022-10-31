<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="shop.dto.*"%>
<!-- prod_view.jsp -->
<%
		ProductDTO dto = (ProductDTO)request.getAttribute("getProduct");
%>
<%@ include file="top.jsp"%>
<div align="center">
	<form name="f" action="prod_list.mall" method="post">
		<table class="outline" width="80%">
			<caption><font size="4"><b>��ǰ�󼼺���</b></font></caption>
			<tr>
				<th class="m2" width="15%">ī�װ�</th>
				<td width="35%"><%=dto.getPcategory_fk()%></td>
				<th class="m2" width="15%">��ǰ��ȣ</th>
				<td width="35%"><%=dto.getPnum()%></td>
			</tr>
			<tr>
				<th class="m2" width="15%">��ǰ��</th>
				<td width="35%"><%=dto.getPname()%></td>
				<th class="m2" width="15%">����ȸ��</th>
				<td width="35%"><%=dto.getPcompany()%></td>
			</tr>
			<tr>
				<th class="m2" width="15%">��ǰ�̹���</th>
				<td width="85%" colspan="3">
				<%	String filename = config.getServletContext().getRealPath("/myshop/images");
					filename += "/" + dto.getPimage();%>
					<img src="<%=filename%>" width="200" height="150">
				</td>
			</tr>
			<tr>
				<th class="m2" width="15%">��ǰ����</th>
				<td width="35%"><%=dto.getPqty()%></td>
				<th class="m2" width="15%">��ǰ����</th>
				<td width="35%"><%=dto.getPrice()%></td>
			</tr>
			<tr>
				<th class="m2" width="15%">��ǰ����</th>
				<td width="35%"><%=dto.getPspec()%></td>
				<th class="m2" width="15%">��ǰ����Ʈ</th>
				<td width="35%"><%=dto.getPoint()%></td>
			</tr>
			<tr>
				<th class="m2" width="15%">��ǰ�Ұ�</th>
				<td width="85%" colspan="3">
					<textarea name="contents" rows="5" cols="50" disabled><%=dto.getPcontents()%></textarea>
				</td>
			</tr>
			<tr>
				<td class="m1" align="center" colspan="4">
					<input type="submit" value="���ư���">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="bottom.jsp"%>














