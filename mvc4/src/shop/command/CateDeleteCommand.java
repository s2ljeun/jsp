package shop.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.dao.CategoryBean;

public class CateDeleteCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String cnum = req.getParameter("cnum");
		CategoryBean dao = new CategoryBean();
		try {
			int res = dao.deleteCate(Integer.parseInt(cnum));
			if (res>0) {
				req.setAttribute("msg", "카테고리 삭제 성공!! 카테고리 목록페이지로 이동합니다.");
				req.setAttribute("url", "cate_list.mall");
			}else {
				req.setAttribute("msg", "카테고리 삭제 실패!! 카테고리 목록페이지로 이동합니다.");
				req.setAttribute("url", "cate_list.mall");
			}
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 오류 발생!! 관리자에게 문의하세요.");
			req.setAttribute("url", "shopAdminIndex.mall");
		}
		return "message.jsp";
	}

}
