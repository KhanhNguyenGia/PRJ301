<%-- 
    Document   : registration
    Created on : Feb 6, 2023, 10:27:40 AM
    Author     : jerry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="mycss.css" type="text/css" />

    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <form action="mainController" method="post" class="formregister">
            <table>
                <tr><td>email</td><td><input type="text" name="txtemail" required/></td></tr>
                <tr><td>fullname</td><td><input type="text" name="txtfullname" required/></td></tr>
                <tr><td>password</td><td><input type="password" name="txtpassword" required/></td></tr>
                <tr><td>phone</td><td><input type="text" name="txtphone"/></td></tr>
                <tr><td colspan="2"><input type="submit" value="register" name="action"/></td></tr>
            </table>
        </form>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
