package board.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardContentCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String num = req.getParameter("num");
		BoardDAO dao = new BoardDAO();
		try {
			BoardDTO dto = dao.getBoard(Integer.parseInt(num), "content");
			req.setAttribute("getBoard", dto);
			return "WEB-INF/board/content.jsp";
		}catch(SQLException e) {
			req.setAttribute("msg", "DB ���� �߻�!! �����ڿ��� �����ϼ���.");
			req.setAttribute("url", "index.do");
		}
		return "message.jsp";
	}

}
