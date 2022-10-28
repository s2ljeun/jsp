package board.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardUpdateFormCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String num = req.getParameter("num");
		BoardDAO dao = new BoardDAO();
		try {
			BoardDTO dto = dao.getBoard(Integer.parseInt(num), "update");
			req.setAttribute("getBoard", dto);
			return "WEB-INF/board/updateForm.jsp";
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 오류 발생!! 관리자에게 문의하세요.");
			req.setAttribute("url", "index.do");
		}
		return "message.jsp";
		
	}

}
