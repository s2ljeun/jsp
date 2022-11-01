package shop.command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.dao.ProductBean;
import shop.dto.ProductDTO;

public class ProdListCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ProductBean dao = new ProductBean();
		try {
			List<ProductDTO> list = dao.listProd();
			String upPath = req.getServletContext().getRealPath("images");
			req.setAttribute("listProd", list);
			HttpSession session = req.getSession();
			session.setAttribute("upPath", upPath);
			return "WEB-INF/shop/admin/prod_list.jsp";
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 오류 발생!! 관리자에게 문의하세요.");
			req.setAttribute("url", "shopAdminIndex.mall");
			return "message.jsp";
		}
	}

}
