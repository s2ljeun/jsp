package shop.command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.dao.CategoryBean;
import shop.dao.ProductList;
import shop.dto.CategoryDTO;
import shop.dto.ProductDTO;

public class MallCgProdListCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String code = req.getParameter("code");
		String cname = req.getParameter("cname");
		HttpSession session = req.getSession();
		ProductList plist = (ProductList)session.getAttribute("prodList");
		try {
			List<ProductDTO> pcode = plist.selectByCode(code);
			req.setAttribute("pcode", pcode);
			session.setAttribute("prodList", plist);
			return "WEB-INF/shop/display/mall_cgProdList.jsp";
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 오류 발생!! 관리자에게 문의하세요.");
			req.setAttribute("url", "index.do");
			return "message.jsp";
		}
	}

}
