<%-- 
    Document   : newPost
    Created on : Nov 9, 2019, 4:25:08 PM
    Author     : AMIN
--%>

<%@page import="dbaccess.PostsDAO"%>
<%@page import="entity.Posts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.username == null}">
    <c:redirect url="/login.jsp" />
</c:if>
<% 
    int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
    String title = "New Post";
    String param = "";
    Posts p = null;
    if (id != 0) {
        p = new PostsDAO().selectById(id);
        title = "Edit Post";
        param = "?id=" + id;
    }
%>
<c:import url="/components/sidebar.jsp">
    <c:param name="title" value="<%= title %>" />
</c:import>
<form action="/PRJ321x-A4-sqlserver/submitProcess<%= param %>" method="post">
    <p class="pt-3 m-0">Tiêu đề: <span class="text-danger"><c:out value="${sessionScope.titleMessage}" /></span></p>
    <input type="text" name="title" class="w-100" value="<%= p != null ? p.getTitle() : "" %>" />
    <p class="pt-3 m-0">Mô tả: <span class="text-danger"><c:out value="${sessionScope.desMessage}" /></span></p>
    <input type="text" name="description" class="w-100" value="<%= p != null ? p.getDescription() : "" %>" />
    <p class="pt-3 m-0">Nội dung: <span class="text-danger"><c:out value="${sessionScope.contentMessage}" /></span></p>
    <textarea name="contents"><%= p != null ? p.getContents() : "" %></textarea>
    <p>Đã xuất bản: <input type="checkbox" name="published" /></p>
    <input type="submit" value="Submit" class="btn btn-primary" />
    <a class="btn btn-primary" href="/PRJ321x-A4-sqlserver/posts.jsp">Cancel</a>
</form>
    <c:set var="titleMessage" scope="session" value="${''}" />
    <c:set var="desMessage" scope="session" value="${''}" />
    <c:set var="contentMessage" scope="session" value="${''}" />

<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<script>
    tinymce.init({
        selector: 'textarea',
        plugins: [
		"advlist autolink link image lists charmap print preview hr anchor pagebreak",
		"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
		"save table contextmenu directionality emoticons template paste textcolor"
	],
        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons",
	style_formats: [
		{title: "Headers", items: [
			{title: "Header 1", format: "h1"},
			{title: "Header 2", format: "h2"},
			{title: "Header 3", format: "h3"},
			{title: "Header 4", format: "h4"},
			{title: "Header 5", format: "h5"},
			{title: "Header 6", format: "h6"}
		]},
		{title: "Inline", items: [
			{title: "Bold", icon: "bold", format: "bold"},
			{title: "Italic", icon: "italic", format: "italic"},
			{title: "Underline", icon: "underline", format: "underline"},
			{title: "Strikethrough", icon: "strikethrough", format: "strikethrough"},
			{title: "Superscript", icon: "superscript", format: "superscript"},
			{title: "Subscript", icon: "subscript", format: "subscript"},
			{title: "Code", icon: "code", format: "code"}
		]},
		{title: "Blocks", items: [
			{title: "Paragraph", format: "p"},
			{title: "Blockquote", format: "blockquote"},
			{title: "Div", format: "div"},
			{title: "Pre", format: "pre"}
		]},
		{title: "Alignment", items: [
			{title: "Left", icon: "alignleft", format: "alignleft"},
			{title: "Center", icon: "aligncenter", format: "aligncenter"},
			{title: "Right", icon: "alignright", format: "alignright"},
			{title: "Justify", icon: "alignjustify", format: "alignjustify"}
		]}
	]
    });
</script>
<c:import url="/components/end.jsp" />
