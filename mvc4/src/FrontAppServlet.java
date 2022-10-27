import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontAppServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		//주소로 command값을 구하기
		String reqUri = req.getRequestURI();
		String path = req.getContextPath(); // 루트..
		String cmd = reqUri.substring(path.length()); //path이후부터 끝까지 ㅠ
		
		String nextPage = null;
		if (cmd.equals("/member_index.do")) {
			nextPage = "index.mem";
		}else if (cmd.equals("board_list.do")) {
			nextPage = "list.board";
		}else if (cmd.equals("shop_mall.do")) {
			nextPage = "mall.mall";
		}
		
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
		

		/*
		PrintWriter pw = resp.getWriter();
		pw.println("<h2>reqUri: " + reqUri + "</h2>");
		pw.println("<h2>path: " + path + "</h2>");
		pw.println("<h2>cmd: " + cmd + "</h2>");
		*/
	}

}
