package servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dispatcher")
public class DispatcherServlet extends HttpServlet {

	private static final long serialVersionUID = -3896530212739726736L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("request param : " + id);
		request.setAttribute("dispatcher", "SAMPLE data");
		request.setAttribute("id", id);
		RequestDispatcher rd = request.getRequestDispatcher("dispatcher.jsp");
		rd.forward(request,response);
	}
}
