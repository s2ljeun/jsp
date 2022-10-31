package shop.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.dao.CategoryBean;
import shop.dto.CategoryDTO;

public class CateInputOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CategoryDTO dto = new CategoryDTO();
		dto.setCode(req.getParameter("code"));
		dto.setCname(req.getParameter("cname"));
		
		CategoryBean dao = new CategoryBean();
		try {
			int res = dao.insertCate(dto);
			if (res>0) {
				req.setAttribute("msg", "카테고리 등록 성공!! 카테고리 목록페이지로 이동합니다.");
				req.setAttribute("url", "cate_list.mall");
			}else {
				req.setAttribute("msg", "카테고리 등록 실패!! 카테고리 등록페이지로 이동합니다.");
				req.setAttribute("url", "cate_input.mall");
			}
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 오류 발생!! 관리자에게 문의하세요.");
			req.setAttribute("url", "shopAdminIndex.mall");
		}
		return "message.jsp";
	}

}
