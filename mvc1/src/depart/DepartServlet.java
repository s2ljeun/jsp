package depart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DepartServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR"); // post��Ŀ����� �ѱ�ó��
		resp.setContentType("text/html; charset=EUC-KR"); // �޴� ��(response)�� �۲�, �������ļ���
		
		String depart = req.getParameter("depart");
		
		DepartExpert de = new DepartExpert();
		List<String> advice = de.getAdvice(depart);
		
		req.setAttribute("advice", advice); //Ű, ���
		RequestDispatcher view = req.getRequestDispatcher("result.jsp");
		view.forward(req, resp);
				
		/*
		PrintWriter pw = resp.getWriter();
		for(String str : advice) {
			pw.println("<h2>" + str + "</h2>");
		}
		*/
		
		//pw.println("������ ����: " + depart);
	}
	
}
