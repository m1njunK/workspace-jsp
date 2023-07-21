package servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/response")
public class RedirectServlet extends HttpServlet {

	private static final long serialVersionUID = -6644963988226218589L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("RESPONSE SERVICE 호출!!");
		String method = req.getMethod();
		System.out.println("요청 전송 방식 : " + method);
		String id = req.getParameter("id");
		System.out.println("parameter : " + id);
		req.setAttribute("response", "sample data");
		// 재요청
		// resp.sendRedirect("response.jsp");
		resp.setStatus(302);
		resp.setHeader("location", "response.jsp");
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("RESPONSE DO GET 호출!!");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("RESPONSE DO POST 호출!!");
	}

}
