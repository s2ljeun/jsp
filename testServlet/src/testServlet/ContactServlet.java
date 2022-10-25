// ���� Ŭ���� -> �������� ����Ǵ� �ڹ�Ŭ����(���α׷�)
package testServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContactServlet extends HttpServlet {

//doGet doPost service�� �޼ҵ� ������ �Ȱ���. request�� ��Ŀ� ���� �˸°� ���.

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR"); // post��Ŀ����� �ѱ�ó��
		resp.setContentType("text/html; charset=EUC-KR"); // �޴� ��(response)�� �۲�, �������ļ���
		
		String name = req.getParameter("name");
		String addr = req.getParameter("addr");
		
		PrintWriter pw = resp.getWriter(); //�� ������ ��ȭ��(reponse)�� �ؽ�Ʈ����� ���� �ۼ�
		// ���尴ü X -> jsp�� �ڹ��ڵ�� ��ȯ�� �� ����ͼ� ����� ���ε� / ���� �ۼ��ϰ� �����Ƿ�... 
		pw.println("<h2>" + name + "���� �ּҴ� " + addr + "�Դϴ�.</h2>");
		
	}

}
