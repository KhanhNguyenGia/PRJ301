<%-- 
    Document   : page2
    Created on : Feb 3, 2023, 9:59:47 AM
    Author     : jerry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            int kq = (int) session.getAttribute("test");
            out.print(kq);
        %>
        <script>console.log("Hello, world");</script>
    </body>
</html>
