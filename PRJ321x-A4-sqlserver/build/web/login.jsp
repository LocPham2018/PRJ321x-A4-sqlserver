<%-- 
    Document   : login
    Created on : Nov 9, 2019, 4:25:23 PM
    Author     : AMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.username != null}">
    <c:redirect url="/posts.jsp" />
</c:if>
<c:import url="/components/sidebar.jsp">
    <c:param name="title" value="Log In" />
</c:import>
<h2>Log In</h2>
<form action="/PRJ321x-A4-sqlserver/loginProcess" method="post">
    <p class="m-0">Username:</p> <input type="text" name="username" />
    <p class="pt-2 m-0">Password:</p> <input type="password" name="password" />
    <p class="my-1 text-danger"><c:out value="${sessionScope.error}" /></p>
    <input type="submit" value="Login" class="btn btn-primary" />
</form>
    <c:set var="error" scope="session" value="${''}" />
<c:import url="/components/end.jsp" />