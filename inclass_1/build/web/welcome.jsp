<%-- 
    Document   : welcome
    Created on : Feb 3, 2023, 10:52:18 AM
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
        <h1>Welcome back <% 
            HttpSession s = request.getSession();
            s.getAttribute("loginUser");
        %></h1>
    </body>
</html>
