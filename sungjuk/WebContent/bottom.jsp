<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <!-- bottom.jsp -->
</td>
		</tr>
		<tr height="10%" align="center">
			<td>
				<form name="f" method="POST" action="<%=request.getContextPath()%>/sungjuk/sungjukList.jsp">
					<select name="search" method="POST">
						<option value="name">�̸�</option>
						<option value="cname">�б�</option>
					</select>
					<input type="text" name="searchString">
					<input type="submit" value="ã��">
				</form>
					<a href="javascript:addSungjuk()">[�߰�]</a>
			</td>
		</tr>
	</table>
</div>
</body>
<script>
	function addSungjuk(){
		window.open("<%=request.getContextPath()%>/sungjuk/sungjukSsn.jsp","add", "width=350, height=450") //������ ����, ����, ������
	}
</script>
</html>