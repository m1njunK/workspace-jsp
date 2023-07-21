package first;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = -8591970279891007344L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// tomcat 10 or 10.1 에서는 
		// web.xml 에 request encoding utf-8로 설정 추가 되어 있음.
		// 31 // 32라인 확인
		
		System.out.println("Login Servlet POST 요청!");
		// tomcat1 10 version 이전
		// request.setCharacterEncoding("UTF-8");
		
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");

		System.out.println("uid : " + uid);
		System.out.println("upw : " + upw);
		
		String registUid = "id001";
		String registUpw = "pw001";
		
		// Response - 응답 요청을 전달한 클라이언트에게 정보를 출력하기 위한 정보를 저장하는 객체
		response.setContentType("text/html");
		// response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='utf-8'/>");
		out.println("<title>로그인 요청 처리 결과</title>");
		out.println("</head>");
		out.println("<body>");
		if(uid.equals(registUid) && upw.equals(registUpw)) {
			// 일치하는 정보 작성
			out.println("<h1>");
			out.println("로그인 완료 되었습니다.");
			out.println("</h1>");
			out.println("<a href='default.html'>메인으로</a>");
		} else {
			// 일치하지 않는 정보 작성
			out.println("<script>");
			out.println("alert('로그인 실패! 아이디와 비밀번호를 확인하세요!')");
			out.println("history.back();");
			out.println("</script>");
			out.println("<a href='default.html'>메인으로</a>");
		}
		out.println("</body>");	
		out.println("<html>");
	}
	
}
