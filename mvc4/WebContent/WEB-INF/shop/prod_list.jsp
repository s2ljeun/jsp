<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, shop.dto.*"%>
<!-- prod_list.jsp -->
<%@ include file="top.jsp"%>
<script type="text/javascript">
	function checkDel(pnum, pimage){
		var isDel = window.confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			document.f.pnum.value = pnum
			document.f.pimage.value = pimage
			document.f.submit()
		}
	}
</script>
<div align="center" style="overflow:scroll; width:100%; height:100%">
	<table class="outline" width="100%">
		<caption><font size="4"><b>상품목록 카테고리</b></font></caption>
		<tr bgcolor="yellow">
			<th class="m2">번호</th>
			<th class="m2">상품코드</th>
			<th class="m2">상품명</th>
			<th class="m2">이미지</th>
			<th class="m2">가격</th>
			<th class="m2">수량</th>
			<th class="m2">수정|삭제</th>
		</tr>
<%
		List<ProductDTO> list = (List)request.getAttribute("prodList");
		if (list == null || list.size() == 0){%>
		<tr>
			<td colspan="7">등록된 상품이 없습니다.</td>
		</tr>
<%	}else { 
			 for(ProductDTO dto : list){%>
		<tr>
			<td><%=dto.getPnum()%></td>
			<td><%=dto.getPcategory_fk()%></td>
			<td><%=dto.getPname()%></td>
			<td>
			<%	String filename = config.getServletContext().getRealPath("images");
					filename += "/" + dto.getPimage();%>
				<a href="prod_view.mall?pnum=<%=dto.getPnum()%>">
					<img src="<%=filename%>" width="30" height="30">
				</a>
			</td>
			<td><%=dto.getPrice()%></td>
			<td><%=dto.getPqty()%></td>
			<td>
				<a href="prod_update.mall?pnum=<%=dto.getPnum()%>">수정</a>|
				<a href="javascript:checkDel('<%=dto.getPnum()%>','<%=dto.getPimage()%>')">삭제</a>
			</td>
		</tr>			 
<%		} 
		}%>				
	</table>		
</div>
<%@ include file="bottom.jsp"%>
<form name="f" action="prod_delete.mall" method="post">
	<input type="hidden" name="pnum"/>
	<input type="hidden" name="pimage"/>
</form>













