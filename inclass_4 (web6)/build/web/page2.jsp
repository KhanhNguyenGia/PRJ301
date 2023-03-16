<%-- 
    Document   : page2
    Created on : Feb 17, 2023, 10:07:00 AM
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
        <jsp:useBean id="t" scope="session" class="dto.Item" />
        <jsp:getProperty property="id" name="t"/>
        <jsp:getProperty property="name" name="t"/>
        <jsp:getProperty property="price" name="t"/>

        <jsp:forward page="page3.jsp">
            <jsp:param name="msg" value="anh yeu em" />
        </jsp:forward>
    </body>
</html>
