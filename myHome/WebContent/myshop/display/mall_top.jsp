<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<!-- mall_top.jsp -->
<jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="cdao" value="<%=pool%>"/>
<%	List<CategoryDTO> clist = cdao.listCate();
		if (clist == null || clist.size()==0){%>
		<script type="text/javascript">
			alert("���θ� �غ� �ȵǾ� �ֽ��ϴ�. ���߿� �ٽ� ������!!")
			location.href="<%=request.getContextPath()%>/index.jsp"
		</script>
<%		return;
		} %>
<html>
<head>
	<title>���θ�Ȩ</title>
	<link rel="stylesheet" type="text/css" href="../../style.css">
	<script type="text/javascript">
		function cateList(code, cname){
			document.f.code.value = code
			document.f.cname.value = cname
			document.f.submit()
		}
	</script>
</head>
<form name="f" action="mall_cgProdList.jsp" method="post">
	<input type="hidden" name="code"/>
	<input type="hidden" name="cname"/>
</form>
<body>
	<div align="center">
		<table border="1" width="800" height="600">
			<tr height="50">
				<td colspan="2" align="center">
					<a href="<%=request.getContextPath()%>/index.jsp">HOME</a> | 
					<a href="<%=request.getContextPath()%>/myshop/admin/main.jsp">������Ȩ</a> | 
					<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">���θ�Ȩ</a> | 
					<a href="<%=request.getContextPath()%>/myshop/display/mall_cartList.jsp">��ٱ���</a> | 
					<a href="<%=request.getContextPath()%>/company.jsp">ȸ��Ұ�</a>
				</td>
			</tr>
			<tr>
				<td align="center" width="20%" valign="top">
					tree/view
					<table border="1">
			<% 	for (CategoryDTO dto : clist){%>
					<tr>
						<td>
							<a href="javascript:cateList('<%=dto.getCode()%>','<%=dto.getCname()%>')">
								<%=dto.getCname()%>[<%=dto.getCode()%>]
							</a>
						</td>	
					</tr>
			<%	} %>
					</table>
				</td>
				<td width="80%">
				
				
				
				
				
				
				
				
				
				
				
				