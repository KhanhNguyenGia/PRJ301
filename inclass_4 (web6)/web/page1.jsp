<%-- 
    Document   : page1
    Created on : Feb 17, 2023, 9:51:11 AM
    Author     : jerry
--%>

<%@page import="dto.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="t" class="dto.Item" scope="session">
            <jsp:setProperty property="id" value="2" name="t" />            
            <jsp:setProperty property="name" value="han va yeu" name="t" />
            <jsp:setProperty property="price" value="1000" name="t" />
        </jsp:useBean>
        <a href="page2.jsp">Read item</a>
        <h1>${"a nho em"}</h1>
        <h1>${10+20}</h1>
        <h1>${sessionScope.t.name}</h1>
    </body>
</html>
