<%-- 
    Document   : login
    Created on : Feb 6, 2023, 10:22:49 AM
    Author     : jerry
--%>

<%@page import="dao.AccountDAO"%>
<%@page import="dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css">

    </head>
    <body>
        <%
            String email = (String) session.getAttribute("email");
            boolean login = false;
            if (email == null || email.isEmpty()) {
                String token = "";
                Cookie[] c = request.getCookies();
                for (Cookie cookie : c) {
                    if (cookie.getName().equals("selector")) {
                        token = cookie.getValue();
                        Account acc = AccountDAO.getAccount(token);
                        if (acc != null) {
                            login = true;
                        }
                    }
                }
            } else {
                login = true;
            }
            if (login) {
                response.sendRedirect("index.jsp");
            }
        %>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <form action="mainController" method="post" class="formlogin">
            <font style="color:red">${requestScope.WARNING == null ? "" : requestScope.WARNING}</font>
            <div>Email: <input type="text" name="txtemail"/></div>
            <div>Password: <input type="password" name="txtpassword"/></div>
            <input value="login" name="action" type="submit">
            <div>
                <input value="savelogin" type="checkbox" name="savelogin"> Stayed sign in
            </div>
        </form>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
