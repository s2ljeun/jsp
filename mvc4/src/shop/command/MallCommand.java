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

public class MallCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		ProductList plist = (ProductList)session.getAttribute("prodList");
		if (plist == null) plist = new ProductList();
		
		CategoryBean cdao = new CategoryBean();
		try {
			List<CategoryDTO> clist = cdao.listCate();
			if (clist == null || clist.size()==0) {
				req.setAttribute("msg", "쇼핑몰 준비중!! 다음에 이용해 주세요");
				req.setAttribute("url", "index.do");
				return "message.jsp";
			}
			session.setAttribute("clist", clist);
			String upPath = req.getServletContext().getRealPath("images");
			session.setAttribute("upPath", upPath);
			List<ProductDTO> hitList = plist.selectBySpec("HIT");
			List<ProductDTO> newList =  plist.selectBySpec("NEW");
			List<ProductDTO> bestList = plist.selectBySpec("BEST");
			req.setAttribute("hitList", hitList);
			req.setAttribute("newList", newList);
			req.setAttribute("bestList", bestList);
			session.setAttribute("prodList", plist);
			return "WEB-INF/shop/display/mall.jsp";
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 오류 발생!! 관리자에게 문의하세요.");
			req.setAttribute("url", "index.do");
			return "message.jsp";
		}
		
	}

}






