package board.command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardListCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		try {
			int pageSize = 5;
			String pageNum = req.getParameter("pageNum");
			if (pageNum == null){
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage-1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int rowCount = dao.getCount(); 
			List<BoardDTO> list = null;
			if (rowCount > 0) {
				if (endRow > rowCount) endRow = rowCount;
				list = dao.listBoard(startRow, endRow);
				int num = rowCount - (startRow - 1);
				
				int pageCount = rowCount / pageSize + (rowCount%pageSize==0 ? 0 : 1);
				int pageBlock = 3;
				int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount) endPage = pageCount;

				req.setAttribute("num", num);
				req.setAttribute("pageCount", pageCount);
				req.setAttribute("pageBlock", pageBlock);
				req.setAttribute("startPage", startPage);
				req.setAttribute("endPage", endPage);
			}
			req.setAttribute("listBoard", list);
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 서버 오류 발생!! 관리자에게 문의하세요");
			req.setAttribute("url", "index.do");
			return "message.jsp";
		}
		return "WEB-INF/board/list.jsp";
	}
}







