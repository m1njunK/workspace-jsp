package service;

import java.io.IOException;
import java.io.PrintWriter;

import beans.MemberVO;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repositories.MemberDAO;
import repositories.MemberDAOImpl;

public class MemberServiceImpl implements MemberService {

	MemberDAO dao = new MemberDAOImpl();

	@Override
	public void memberJoin(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String rePass = request.getParameter("re_pass");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		
		MemberVO vo = new MemberVO(id, pass, name, age, gender);

		System.out.println(pass);
		System.out.println(rePass);
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter pw = response.getWriter();
			pw.print("<script>");
			if (!pass.equals(rePass)) {
				pw.print("alert('비밀번호가 일치하지 않습니다.');");
				pw.print("history.go(-1);");
				pw.print("</script>");
				return;
			}

			MemberVO member = dao.getMemberById(id);
			if (member != null) {
				pw.print("alert('이미 존재하는 사용자 정보 입니다.');");
				pw.print("history.go(-1);");
				pw.print("</script>");
				return;
			}

			boolean isSuccess = dao.memberJoin(vo);

			if (isSuccess) {
				// 회원가입 성공
				pw.print("alert('회원가입 성공');");
				pw.print("location.href='login.mc';");
			} else {
				// 회원가입 실패
				pw.print("alert('회원가입 실패');");
				pw.print("history.go(-1);");
			}
			pw.print("</script>");
		} catch (IOException e) {}
	}

	@Override
	public boolean memberLogin(HttpServletRequest request, HttpServletResponse response) {
		boolean isLogin = false;
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String check = request.getParameter("login");

		MemberVO member = dao.memberLogin(id, pass);
		if (member != null) {
			isLogin = true;
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			if (check != null) {
				Cookie cookie = new Cookie("id", member.getId());
				cookie.setMaxAge(60 * 60 * 24 * 15);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
		}
		return isLogin;
	}

	@Override
	public void memberUpdate(HttpServletRequest request, HttpServletResponse response) {
		MemberVO member = new MemberVO(request.getParameter("id"), request.getParameter("pass"),
				request.getParameter("name"), Integer.parseInt(request.getParameter("age")),
				request.getParameter("gender"));
		member.setNum(Integer.parseInt(request.getParameter("num")));

		boolean isUpdate = dao.memberUpdate(member);

		String url = "login.mc";
		String msg = "회원정보 수정완료";

		if (isUpdate) {
			// 수정 완료
			MemberVO vo = dao.getMemberById(member.getId());
			request.getSession().setAttribute("member", vo);
		} else {
			// 수정 실패
			url = "update.mc";
			msg = "회원정보 수정 실패";
		}

		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('" + msg + "');");
			out.print("location.href='" + url + "';");
			out.print("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void logOut(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("member");
		Cookie cookie = new Cookie("id", "");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	@Override
	public void withDraw(HttpServletRequest request, HttpServletResponse response) {
		String tempPass = request.getParameter("tempPass");
		System.out.println("tempPass : " + tempPass);

		MemberVO member = (MemberVO) request.getSession().getAttribute("member");

		response.setContentType("text/html;charset=utf-8");

		try {
			PrintWriter pw = response.getWriter();
			pw.print("<script>");
			if (member != null && member.getPass().equals(tempPass)) {
				dao.withDrawMember(member.getNum());
				logOut(request, response);
				pw.print("location.href='test';");
			} else {
				// 회원탈퇴 실패
				pw.print("alert('회원탈퇴 실패!');");
				pw.print("history.go(-1);");
			}
			pw.print("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
