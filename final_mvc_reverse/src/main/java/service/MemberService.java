package service;

import beans.MemberVO;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repositories.MemberDAOImpl;

public interface MemberService {

	// 회원가입 처리
	void memberJoin(HttpServletRequest request, HttpServletResponse response);

	// 로그인 처리
	/*
	 * @return true - 로그인 성공
	 * 
	 * @return false - 로그인 실패
	 */
	boolean memberLogin(HttpServletRequest request, HttpServletResponse response);

	// 회원 정보 수정
	void memberUpdate(HttpServletRequest request, HttpServletResponse response);

	// 로그아웃
	void logOut(HttpServletRequest request, HttpServletResponse response);

	// 회원 탈퇴
	void withDraw(HttpServletRequest request, HttpServletResponse response);

	// 자동 로그인 체크
	static void loginCheck(HttpServletRequest request) {
		System.out.println("login cookie check 확인");
		HttpSession session = request.getSession();
		if (session.getAttribute("member") == null) {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie c : cookies) {
					if (c.getName().equals("id")) {
						String id = c.getValue();
						MemberVO member = new MemberDAOImpl().getMemberById(id);
						if (member != null)
							session.setAttribute("member", member);
						break;
					}
				}
			}
		}
	}
}
