package book;

import java.io.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BookShopServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
															throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		String cmd = req.getParameter("command");
		HttpSession session = req.getSession(); //session에 들어있음
		List<BookDTO> list = (List)session.getAttribute("cart");
		if (cmd.equals("CHK")) {
			Map<String, BookDTO> map = new Hashtable<>();
			for(BookDTO dto : list) {
				if (map.containsKey(dto.getTitle())) {
					BookDTO dto2 = map.get(dto.getTitle());
					dto2.setQty(dto2.getQty() + dto.getQty());
				}else {
					map.put(dto.getTitle(), dto);
				}
			}
			req.setAttribute("cart", map); //request에 들어있음
			RequestDispatcher view = req.getRequestDispatcher("result.jsp");
			view.forward(req, resp);
		}else {
			if (cmd.equals("ADD")) {
				BookDTO dto = getBook(req);
				if (list == null) list = new ArrayList<>();				
				list.add(dto);
			}else if (cmd.equals("DEL")) {
				int idx = Integer.parseInt(req.getParameter("idx"));
				list.remove(idx);
			}
			session.setAttribute("cart", list);
			RequestDispatcher view = req.getRequestDispatcher("bookShop.jsp");
			view.forward(req, resp);
		}
		/*
		PrintWriter pw = resp.getWriter();
		pw.println("dto.getTitle = " + dto.getTitle());
		pw.println("dto.getAuthor = " + dto.getAuthor());
		pw.println("dto.getPrice = " + dto.getPrice());
		pw.println("dto.getQty = " + dto.getQty());
		/*
		String data = req.getParameter("book");
		pw.println("넘어온 데이터 : " + data);
		*/
	}
	
	protected BookDTO getBook(HttpServletRequest req) {
		String data = req.getParameter("book");
		String qty = req.getParameter("qty");
		Scanner sc = new Scanner(data).useDelimiter("\\s*/\\s*");
		BookDTO dto = new BookDTO();
		dto.setTitle(sc.next());
		dto.setAuthor(sc.next());
		dto.setPrice(sc.nextInt());
		dto.setQty(Integer.parseInt(qty));
		return dto;
	}
}















