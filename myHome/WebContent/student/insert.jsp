<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- insert.jsp -->
<%--
	1. �Ѿ�� ������ �ޱ�
	2. �Ѿ�� ������ ��ȿ�� �˻��ϱ�
	3. ����̹� �����ϱ�
	4. ����Ŭ�� �����Ͽ� ������ �����ϱ�
	5. ����� �޾� ó���ϱ�
	6. db���� �ݱ�
--%>
<%		//1.
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String cname = request.getParameter("cname");
		
		//2.
		if(id==null||name==null||cname==null
			||id.trim().equals("")||name.trim().equals("")||cname.trim().equals("")){%>
			<script type="text/javascript">
				alert("���̵�, �л���, �б޸��� ��� �Է����ּ���!!");
				history.back(); //�ڹٽ�ũ��Ʈ�� �ڷΰ���
			</script>
<%			return; //��ȯ�� java���Ͽ��� �츮 �ڵ尡 ���� void �޼ҵ带 ����������
		}%>
		
		<jsp:useBean id="stdao" class="my.student.StudentDAO" />
		<!-- StudentDAO stdao = new StudentDAO(); �� ����  -->
		<!-- useBean�� ������ ����Ʈ �����ڸ� �ҷ��� �� ����. -->

<%
		int res = stdao.insertStudent(id, name, cname);
		//5.
		if (res>0){%>
		<script type="text/javascript">
			alert("�л���� ����!! �л������������ �̵��մϴ�.")
			location.href="list.jsp" //�ڹٽ�ũ��Ʈ�� a�±� - �ش� ���Ϸ� �̵�
		</script>			
<%	}else {%>
		<script type="text/javascript">
			alert("�л���� ����!! �л������������� �̵��մϴ�.")
			location.href="student.jsp"
		</script>
<%	} %>