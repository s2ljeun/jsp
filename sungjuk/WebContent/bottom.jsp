<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <!-- bottom.jsp -->
</td>
		</tr>
		<tr height="10%" align="center">
			<td>
				<form name="f" method="POST" action="<%=request.getContextPath()%>/sungjuk/sungjukList.jsp">
					<select name="search" method="POST">
						<option value="name">이름</option>
						<option value="cname">학급</option>
					</select>
					<input type="text" name="searchString">
					<input type="submit" value="찾기">
				</form>
					<a href="javascript:addSungjuk()">[추가]</a>
			</td>
		</tr>
	</table>
</div>
</body>
<script>
	function addSungjuk(){
		window.open("<%=request.getContextPath()%>/sungjuk/sungjukSsn.jsp","add", "width=350, height=450") //오픈할 파일, 제목, 사이즈
	}
</script>
</html>