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
		req.setCharacterEncoding("EUC-KR"); // post방식에서의 한글처리
		resp.setContentType("text/html; charset=EUC-KR"); // 받는 곳(response)의 글꼴, 파일형식설정
		
		String depart = req.getParameter("depart");
		
		DepartExpert de = new DepartExpert();
		List<String> advice = de.getAdvice(depart);
		
		req.setAttribute("advice", advice); //키, 밸류
		RequestDispatcher view = req.getRequestDispatcher("result.jsp");
		view.forward(req, resp);
				
		/*
		PrintWriter pw = resp.getWriter();
		for(String str : advice) {
			pw.println("<h2>" + str + "</h2>");
		}
		*/
		
		//pw.println("선택한 과목: " + depart);
	}
	
}
