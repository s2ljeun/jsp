package shop.command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.dao.CategoryBean;
import shop.dto.CategoryDTO;

public class ProdInputCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CategoryBean dao = new CategoryBean();
		try {
			List<CategoryDTO> list = dao.listCate();
			req.setAttribute("listCate", list);
			return "WEB-INF/shop/admin/prod_input.jsp";
		}catch(SQLException e) {	
			req.setAttribute("msg", "DB 오류 발생!! 관리자에게 문의하세요.");
			req.setAttribute("url", "shopAdminIndex.mall");
			return "message.jsp";
		}
	}

}
