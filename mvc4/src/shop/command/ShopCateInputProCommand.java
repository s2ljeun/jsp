package shop.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.dao.CategoryDAO;
import shop.dto.CategoryDTO;

public class ShopCateInputProCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CategoryDTO dto = new CategoryDTO();
		dto.setCode(req.getParameter("code"));
		dto.setCname(req.getParameter("cname"));
		
		CategoryDAO dao = new CategoryDAO();
		try {
			int res = dao.insertCate(dto);
			if(res>0) {
				req.setAttribute("msg", "카테고리 등록성공! 카테고리 목록으로 이동합니다.");
				req.setAttribute("url", "cate_list.mall");
			}else {
				req.setAttribute("msg", "카테고리 등록실패! 카테고리 목록으로 이동합니다.");
				req.setAttribute("url", "cate_list.mall");
			}
		} catch (SQLException e) {
			req.setAttribute("msg", "db에러! 관리자 문의");
			req.setAttribute("url", "index.do");
		}

		return "message.jsp";
	}

}
