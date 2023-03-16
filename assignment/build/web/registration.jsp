<%-- 
    Document   : registration
    Created on : Feb 6, 2023, 10:27:40 AM
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
        <link  rel="stylesheet" href="mycss.css" type="text/css" />

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
        <form action="mainController" method="post" class="formregister">
            <table>
                <tr><td>email</td><td><input type="text" name="txtemail" pattern="[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+" required/></td></tr>
                <tr><td>fullname</td><td><input type="text" name="txtfullname" required/></td></tr>
                <tr><td>password</td><td><input type="password" name="txtpassword" required/></td></tr>
                <tr>
                    <td>phone</td>
                    <td>
                        <input type="text" name="txtphone"/>
                        <%= request.getAttribute("ERROR") == null ? "" : request.getAttribute("ERROR")%>
                    </td>
                </tr>
                <tr><td colspan="2"><input type="submit" value="register" name="action"/></td></tr>
            </table>
        </form>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
