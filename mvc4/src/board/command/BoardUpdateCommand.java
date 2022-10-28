package board.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardUpdateCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String num = req.getParameter("num"); // 어디서 난 거야... content?
		BoardDAO dao = new BoardDAO();
		try {
			BoardDTO dto = dao.getBoard(Integer.parseInt(num), "");
			req.setAttribute("dto", dto);
			return "WEB-INF/board/updateForm.jsp";
			
		} catch (NumberFormatException e) {
			req.setAttribute("msg", "DB 오류 발생!! 관리자에게 문의하세요.");
			req.setAttribute("url", "index.do");
			return "message.jsp";
		} catch (SQLException e) {
			req.setAttribute("msg", "DB 오류 발생!! 관리자에게 문의하세요.");
			req.setAttribute("url", "index.do");
			return "message.jsp";
		}
	}

}
