package shop.command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.dao.CategoryDAO;
import shop.dto.CategoryDTO;

public class ShopProdInputCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CategoryDAO dao = new CategoryDAO();
		List<CategoryDTO> list;

		try {
			list = dao.listCate();
			req.setAttribute("cateList", list);
			
		} catch (SQLException e) {
			req.setAttribute("msg", "db에러! 관리자 문의");
			req.setAttribute("url", "index.do");
			return "message.jsp";
		}
		
		return "WEB-INF/shop/prod_input.jsp";
	}

}
