<%-- 
    Document   : header_loginedUser
    Created on : Feb 6, 2023, 10:53:47 AM
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
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="changeProfile.jsp">Change profile</a></li>
                <li><a href="">Completed orders</a></li>
                <li><a href="">Canceled orders</a></li>
                <li><a href="">Processing orders</a></li>
                <li>from <input type="date" name="from"> to <input type="date" name="to"><input type="submit" value="search"></li>
            </ul>
        </nav>
    </body>
</html>
