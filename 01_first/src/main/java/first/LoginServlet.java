package first;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청이 전달 될때 함께 전송된 데이터 읽기
		// 전송된 데이터를 사용 할 encoding 지정
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println("request id : " + id);
		System.out.println("request pw : " + pw);
		
		// MIME Type
		// Multipurpose Internet Mail Extensions
		/*
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		*/
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<head>");
		out.print("<meta charset ='UTF-8'/>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1>Hello</h1>");
		out.print("id : " + id);
		out.print("<hr/>");
		out.print("pw : " + pw);
		out.print("</body>");
		out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
