<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- aside.jsp -->
<style>
	aside ul {
		list-style: none;
		padding-left:10px;
		text-align:left;
		width:113px;
		height:500px;
	}
	
	aside ul li a {
		text-decoration: none;
		color: gray;
	}
	
	aside ul li a:hover{
		color:red;
		cursor:pointer;
	}
</style>
<aside>
	<ul>
		<li><a href="index.jsp?page=default">HOME</a></li>
		<li><a href="index.jsp?page=intro">회사소개</a></li>
		<li><a href="index.jsp?page=map">찾아오시는 길</a></li>
	</ul>
</aside>