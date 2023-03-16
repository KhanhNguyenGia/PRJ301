<%-- 
    Document   : page1
    Created on : Feb 21, 2023, 10:10:30 AM
    Author     : jerry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Servlet1" method="post">
            <p><input type="text" name="email"></p>
            <p><input type="text" name="password"></p>
            <p><input type="text" name="fullname"></p>
            <p><input type="submit" value="register"></p>
        </form>
        <div>
            <h1>${requestScope.error}</h1>
        </div>
        <div>
            <h1>${requestScope.email}</h1>
        </div>
    </body>
</html>
