package first;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

@WebServlet("/choiceFruit")
public class ChoiceFruitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] fruits = request.getParameterValues("fruit");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		if(fruits != null) {
			for(String fruit : fruits) {
				
				String name = fruit.replace(".png", "");
				switch(name) {
					case "banana" :
						name = "바나나";
						break;
					case "mango" :
						name = "망고";
						break;
					case "apple" :
						name = "사과";
						break;
					case "rice" :
						name = "쌀";
						break;
				}
				
				out.println("Choice Fruit : " + name + "<br/>");
				out.println("<img src='resources/img/" + fruit + "'/><br/>");
				System.out.println(fruit);
			}
		}else {
			out.print("<script>");
			out.print("alert('선택된 과일이 없습니다.');");
			out.print("history.go(-1);");
			out.print("</script>");
			System.out.println("선택된 과일 없음");
		}
	}

}
