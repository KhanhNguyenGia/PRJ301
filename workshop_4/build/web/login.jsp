<%-- 
    Document   : login
    Created on : Feb 6, 2023, 10:22:49 AM
    Author     : jerry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css">

    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <form action="mainController" method="post" class="formlogin">
            <div>Email: <input type="text" name="txtemail"/></div>
            <div>Password: <input type="password" name="txtpassword"/></div>
            <input value="login" name="action" type="submit">
        </form>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
