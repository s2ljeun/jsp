package shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.dao.ProductList;
import shop.dto.ProductDTO;

public class MallProdViewCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pnum = req.getParameter("pnum");
		String select = req.getParameter("select");
		HttpSession session = req.getSession();
		ProductList plist = (ProductList)session.getAttribute("prodList");
		ProductDTO pdto = plist.getProduct(Integer.parseInt(pnum), select);
		req.setAttribute("pdto", pdto);
		return "WEB-INF/shop/display/mall_prodView.jsp";
	}

}
