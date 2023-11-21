<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.jspsecondproject.board.BoardDAO, com.example.jspsecondproject.board.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Page</title>
</head>
<body>

<%
    BoardDAO boardDAO = new BoardDAO();
    String id=request.getParameter("id");
    BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
%>

<h1>View Page</h1>
    <input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
    <table>
        <tr><td>Title:</td><td><p name="title"/><%= u.getTitle()%></td></tr>
        <tr><td>Writer:</td><td><p name="writer"/><%= u.getWriter()%></td></tr>
        <tr><td>Content:</td><td><p name="content"><%= u.getContent()%></p></td></tr>
        <tr><td>Category:</td><td><p name="category"/><%= u.getCategory()%></td></tr>
        <tr><td><a href="posts.jsp">Go to Lists</a></td>
    </table>

</body>
</html>
