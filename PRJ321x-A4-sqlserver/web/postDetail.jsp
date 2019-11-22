<%-- 
    Document   : postDetail
    Created on : Nov 9, 2019, 4:24:51 PM
    Author     : AMIN
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dbaccess.PostsDAO"%>
<%@page import="entity.Posts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:import url="/components/sidebar.jsp">
    <c:param name="title" value="Post Detail" />
</c:import>
<% 
    int id = Integer.parseInt(request.getParameter("id")); 
    Posts p = new PostsDAO().selectById(id);
    SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy");
%>
<h1><%= p.getTitle() %></h1>
<p style="font-size: 0.8em">
    Written by <strong><%= p.getUser() %></strong> on <%= fmt.format(p.getDate()) %> 
    <% if (!p.isPublished()) { %>
    (draft)
    <% } %>
    <% if (p.getUser().equals(session.getAttribute("username"))) { %>
    <a href="/PRJ321x-A4-sqlserver/newPost.jsp?id=<%= id %>">[Edit]</a>
    <% } %>
</p>
<p class="font-weight-bold"><%= p.getDescription() %></p>
<p><%= p.getContents() %></p>
<c:import url="/components/end.jsp" />
