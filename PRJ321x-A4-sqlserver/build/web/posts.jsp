<%-- 
    Document   : posts
    Created on : Nov 9, 2019, 4:24:00 PM
    Author     : AMIN
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="entity.Posts"%>
<%@page import="java.util.Date"%>
<%@page import="dbaccess.PostsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:import url="/components/sidebar.jsp">
    <c:param name="title" value="Posts" />
</c:import>
<% 
    List<Posts> posts = new PostsDAO().selectAll(); 
    SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy");
%>
<h1>Posts</h1>
<% for (int i = 0; i < posts.size(); i++) { %>
<div class="my-2">
    <h3><a href="/PRJ321x-A4-sqlserver/postDetail.jsp?id=<%= posts.size() - i %>"><%= posts.get(i).getTitle() %></a></h3>
    <p style="font-size: 0.8em">
        Written by <strong><%= posts.get(i).getUser() %></strong> on <%= fmt.format(posts.get(i).getDate()) %> 
        <% if (!posts.get(i).isPublished()) { %>
        (draft)
        <% } %>
        <% if (posts.get(i).getUser().equals(session.getAttribute("username"))) { %>
            <a href="/PRJ321x-A4-sqlserver/newPost.jsp?id=<%= posts.size() - i %>">[Edit]</a>
        <% } %>
    </p>
    <p><%= posts.get(i).getDescription() %></p>
    <hr class="m-0" />
</div>
<% } %>
<c:import url="/components/end.jsp" />
