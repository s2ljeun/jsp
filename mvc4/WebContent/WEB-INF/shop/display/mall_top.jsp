<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, shop.dto.*"%>
<!-- mall_top.jsp -->
<%	List<CategoryDTO> clist = (List)session.getAttribute("clist");%>
<html>
<head>
	<title>碱俏隔权</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript">
		function cateList(code, cname){
			document.f.code.value = code
			document.f.cname.value = cname
			document.f.submit()
		}
	</script>
</head>
<form name="f" action="mall_cgProdList.mall" method="post">
	<input type="hidden" name="code"/>
	<input type="hidden" name="cname"/>
</form>
<body>
	<div align="center">
		<table border="1" width="800" height="600">
			<tr height="50">
				<td colspan="2" align="center">
					<a href="index.do">HOME</a> | 
					<a href="">包府磊权</a> | 
					<a href="mall.mall">碱俏隔权</a> | 
					<a href="">厘官备聪</a> | 
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
				
				
				
				
				
				
				
				
				
				
				
				