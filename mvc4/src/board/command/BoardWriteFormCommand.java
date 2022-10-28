package board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardWriteFormCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int num = 0, re_step = 0, re_level = 0;
		String snum = req.getParameter("num");
		if (snum != null) {		//답글쓰기에서 왔다면...
			num = Integer.parseInt(snum);
			re_step = Integer.parseInt(req.getParameter("re_step"));
			re_level = Integer.parseInt(req.getParameter("re_level"));
		}
		req.setAttribute("num",  num);
		req.setAttribute("re_step",  re_step);
		req.setAttribute("re_level",  re_level);
		return "WEB-INF/board/writeForm.jsp";
	}

}
