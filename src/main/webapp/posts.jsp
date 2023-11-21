<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.jspsecondproject.board.BoardDAO, com.example.jspsecondproject.board.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>free board</title>
<style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #79c9f6;
  color: white;
}
.index-myBookManager {
	padding-top: 12px;
	width: 300px;
	font-size: 30px;
	font-family: Georgia, 'Times New Roman', Times, serif;
}

.index-myBookManager:hover {
	cursor: pointer;
}
.index-bookList {
	font-size: 20px;
	font-family: Georgia, 'Times New Roman', Times, serif;
	width: 30%;
}

.index-line1 {
	box-shadow: 0 4px 4px -4px #808080FF;
	margin-bottom: 2%;
	padding-bottom: 1px;
	display: flex;
	justify-content: space-between;
}
.index-line2 {
	display: flex;
	justify-content: space-between;
	box-shadow: 0 4px 4px -4px #808080FF;
	/* margin-bottom: 3%; */
}
.navbar {
	margin-top: 10px;
	margin-right: 5px;
	width: 280px;
	right: 0%;
	/* position: absolute; */
	display: flex;
	/* background-color: #333; */
}

/* Style the navigation bar links */
.navbar a {
	height: 40px;
	width: 100px;
	color: royalblue;
	padding-top: 10px;
	text-decoration: none;
	text-align: center;
	border-radius: 10px;
	margin-bottom: 10px;
	margin-left: 1px;
	margin-right: 1px;
}

/* Change color on hover */
.navbar a:hover {
	background-color: royalblue;
	border-radius: 10px;
	color: white;
}
.add-button {
	margin-right: 5%;
	padding-top: 5px;
	padding-left: 11px;
	width: 50px;
	height: 30px;
	border-radius: 6px;
	background-color: rgba(20, 137, 33, 0.767);
	color: white;
}
.edit-img {
	margin-top: 4px;
	width: 20px;
	height: 20px;
	margin-right: 5px;
}

.edit-img:hover {
	cursor: pointer;
}

.delete-img {
	width: 20px;
	height: 20px;
}

.footer {
	display: flex;
}

.footer-content {
	margin-top: 17px;
	color: grey;
	font-size: 12px;
}

.delete-img:hover {
	cursor: pointer;
}

.add-button:hover {
	cursor: pointer;
}

* {
	box-sizing: border-box;
}
</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deletepost.jsp?id=' + id;
	}
</script>
</head>
<body>
<div>
	<div class="index-line1">
		<div class="index-myBookManager" onclick="location.href='posts.jsp'">&nbsp;My Bulletin Board</div>
		<!-- Navigation Bar -->
		<div class="navbar">
			<a href="#">Home</a>
			<a href="#">NoStyle</a>
			<a href="#">Example</a>
			<a href="#">About</a>
		</div>
	</div>
</div>

<!-- Header -->
<div class="header">
	<div class="index-line2">
		<p class="index-bookList">&nbsp;&nbsp;<b>Board List</b></p>
		<p class="add-button" onclick="location.href='addpostform.jsp'">Add</div>
</div>
<%
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> list = boardDAO.getBoardList();
	request.setAttribute("list",list);
%>
<table id="list" width="90%">
<tr>
	<th>Id</th>
	<th>Title</th>
	<th>Writer</th>
	<th>Content</th>
	<th>Regdate</th>
	<th>Category</th>
	<th>Menu</th>
</tr>
<c:forEach items="${list}" var="u">
	<tr class="box">
		<td>${u.getSeq()}</td>
		<td onclick="location.href='view.jsp?id=${u.getSeq()}'">${u.getTitle()}</td>
		<td>${u.getWriter()}</td>
		<td>${u.getContent()}</td>
		<td>${u.getRegdate()}</td>
		<td>${u.getCategory()}</td>
		<td class="menu">
			<img class="edit-img" src="./images/edit.png" alt="수정" onclick="location.href='editform.jsp?id=${u.getSeq()}'">
			<img class="delete-img" src="./images/delete.png" alt="삭제" onclick="location.href='deletepost.jsp?id=${u.getSeq()}'">
		</td>
<%--		<td><a href="editform.jsp?id=${u.getSeq()}">Edit</a></td>--%>
<%--		<td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>--%>
	</tr>
</c:forEach>
</table>
<div class="footer">
	<svg xmlns="http://www.w3.org/2000/svg" width="12" height="48" fill="gray" class="bi bi-c-circle"
		 viewBox="0 0 16 16">
		<path
				d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM8.146 4.992c-1.212 0-1.927.92-1.927 2.502v1.06c0 1.571.703 2.462 1.927 2.462.979 0 1.641-.586 1.729-1.418h1.295v.093c-.1 1.448-1.354 2.467-3.03 2.467-2.091 0-3.269-1.336-3.269-3.603V7.482c0-2.261 1.201-3.638 3.27-3.638 1.681 0 2.935 1.054 3.029 2.572v.088H9.875c-.088-.879-.768-1.512-1.729-1.512Z" />
	</svg>
	<p class="footer-content">&nbsp;22200733 최동빈 실전 프로젝트 project4</p>
</div>
<%--<br/><a href="addpostform.jsp">데이터 추가하기</a>--%>
</body>
</html>