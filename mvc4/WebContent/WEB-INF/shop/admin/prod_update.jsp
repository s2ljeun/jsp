<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="shop.dto.*"%>
<!-- prod_update.jsp -->
<%
		ProductDTO dto = (ProductDTO)request.getAttribute("getProduct");
%>
<%@ include file="top.jsp"%>
<script type="text/javascript">
	function check(){
		if (f.pname.value==""){
			alert("상품명을 입력해 주세요!!")
			f.pname.focus()
			return
		}
		if (f.pcompany.value==""){
			alert("제조회사를 입력해 주세요!!")
			f.pcompany.focus()
			return
		}
		if (f.pqty.value==""){
			alert("상품수량을 입력해 주세요!!")
			f.pqty.focus()
			return
		}
		if (f.price.value==""){
			alert("상품가격을 입력해 주세요!!")
			f.price.focus()
			return
		}
		if (f.pcontents.value==""){
			alert("상품소개를 입력해 주세요!!")
			f.pcontents.focus()
			return
		}
		if (f.point.value==""){
			alert("상품포인트를 입력해 주세요!!")
			f.point.focus()
			return
		}
		document.f.submit()
	}
</script>
<div align="center">
	<form name="f" action="prod_update_ok.mall" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pnum" value="<%=dto.getPnum()%>"/>
		<table class="outline" width="600">
			<caption><font size="4"><b>상품수정</b></font></caption>
			<tr>
				<th class="m2" width="20%">카테고리</th>
				<td>
					<input type="text" name="pcategory_fk" value="<%=dto.getPcategory_fk()%>" disabled>
				</td>
			</tr>
			<tr>
				<th class="m2">상품번호</th>
				<td><%=dto.getPnum()%></td>
			</tr>
			<tr>
				<th class="m2">상품명</th>
				<td><input type="text" name="pname" class="box" value="<%=dto.getPname()%>"></td>
			</tr>
			<tr>
				<th class="m2">제조회사</th>
				<td><input type="text" name="pcompany" class="box" value="<%=dto.getPcompany()%>"></td>
			</tr>
			<tr>
				<th class="m2">상품이미지</th>
				<td>
			<%	String filename = config.getServletContext().getRealPath("/myshop/images");
					filename += "/" + dto.getPimage();%>
					<img src="<%=filename%>" width="200" height="150">					
					<input type="file" name="pimage" class="box" size="50">
					<input type="hidden" name="pimage2" value="<%=dto.getPimage()%>"/>
				</td>
			</tr>
			<tr>
				<th class="m2">상품수량</th>
				<td><input type="text" name="pqty" class="box" value="<%=dto.getPqty()%>"></td>
			</tr>
			<tr>
				<th class="m2">상품가격</th>
				<td><input type="text" name="price" class="box" value="<%=dto.getPrice()%>"></td>
			</tr>
			<tr>
				<th class="m2">상품스팩</th>
				<td>
<%			String spec[] = new String[]{"NORMAL", "HIT", "BEST", "NEW"}; %>				
					<select name="pspec">
<%				for(int i=0; i<spec.length; ++i){
						if (dto.getPspec().equals(spec[i])){%>
						<option value="<%=spec[i]%>" selected><%=spec[i]%></option> 					
<%					}else { %>
						<option value="<%=spec[i]%>"><%=spec[i]%></option>
<%					}
					}%>
					</select>
				</td>
			</tr>
			<tr>
				<th class="m2">상품소개</th>
				<td><textarea name="pcontents" rows="5" cols="60"><%=dto.getPcontents()%></textarea>
			</tr>
			<tr>
				<th class="m2">상품포인트</th>
				<td><input type="text" name="point" class="box" value="<%=dto.getPoint()%>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="상품수정" onclick="javascript:check()">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="bottom.jsp"%>