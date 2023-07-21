<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>방명록 메시지 삭제 확인</title>
</head>
<body>
<!-- 삭제 요청에 필요한 정보 전달 -->
<form action="delete.gb" method="post">
메시지를 삭제하시려면 암호를 입력하세요:<br>
암호: <input type="password" name="password"> <br>
<input type="submit" value="메시지 삭제하기">
</form>
</body>
</html>