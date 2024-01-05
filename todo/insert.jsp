<%@page import="dao.TodoDao"%>
<%@page import="vo.Todo"%>
<%@page import="vo.User"%>
<%@page import="vo.TodoCategory"%>
<%@page import="dto.LoginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");

	
		int categoryNo = Integer.valueOf(request.getParameter("categoryNo"));
		String title = request.getParameter("title");
		String expectedDate = request.getParameter("expectedDate");
		String content = request.getParameter("content");
		
		TodoCategory todoCategory = new TodoCategory();
		todoCategory.setNo(categoryNo);
		
		Todo todo = new Todo();
		
		todo.setCategory(todoCategory);
		todo.setTitle(title);
		todo.setExpectedDate(expectedDate);
		todo.setContent(content);
		
		User user = new User();
		user.setNo(loginUser.getNo());
		
		todo.setUser(user);
		
		TodoDao todoDao = new TodoDao();
		
		todoDao.insertTodo(todo);
		
		response.sendRedirect("list.jsp");
		

%>









