<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request_test/requestTest.jsp</title>
</head>
<body>
	<!--
		enctype - 전송 되는 데이터의 인코딩 설정
		application/x-www-form-urlencoded
		- 기본값 : 전송 되는 모든 문자들은 서버로 보내기 전에 인코딩 됨을 명시
		%16진법의 두자리수 - 하나당 1byte - 한글은 3byte로 조합
		%EC%B5%9C %EA%B8%B0 %EA%B7%BC - 최 기 근
	    
	    multipart/form-data
	    전달되는 데이터가 이진 데이터 이므로 모든 문자를 인코딩 하지 않음을 명시
	    이 방식은 문자가 아닌 데이터(파일,이미지)등을 서버에 전송할 때 사용
	    
	    text/plain
	    일반 문자 - 공백은 + 기호로 변환하지만
	    나머지 문자는 인코딩 되지 않음을 명시
	    
	 -->
	<form action="requestResult.jsp" method="POST" enctype="application/x-www-form-urlencoded"> 
		<!-- enctype="multipart/form-data"> -->
		<!-- enctype="application/x-www-form-urlencoded"> -->
		이름 : <input type="text" name="name"/> <br/>
		성별 : <input type="radio" name="gender" value="male" checked/> 남
			  <input type="radio" name="gender" value="female"/> 여 <br/>
		취미 : <input type="checkbox" name="hobby" value="축구"/> 축구
			  <input type="checkbox" name="hobby" value="JAVA"/> JAVA
			  <input type="checkbox" name="hobby" value="JSP" /> JSP
			  <input type="checkbox" name="hobby" value="기타" /> 기타
			  <button>확인</button>
	</form>
</body>
</html>