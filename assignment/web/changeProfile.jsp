<%-- 
    Document   : changeProfile
    Created on : Mar 14, 2023, 11:30:15 AM
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
        <link rel="stylesheet" href="mycss.css">
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            String temp = (String) session.getAttribute("role");
            int role = temp == null ? 0 : Integer.parseInt(temp);
            Cookie[] c = request.getCookies();
            boolean login = false;
            if (name == null) {
                if (c != null) {
                    String token = "";
                    for (Cookie cookie : c) {
                        if (cookie.getName().equals("selector")) {
                            token = cookie.getValue();
                            Account acc = AccountDAO.getAccount(token);
                            if (acc != null) {
                                name = acc.getFullname();
                                email = acc.getEmail();
                                role = acc.getRole();
                                login = true;
                            }
                        }
                    }
                }
            } else {
                login = true;
            }
            if (!login) {
                response.sendRedirect("login.jsp");
            }
            if (role == 1) {
        %>
        <h1>Admin cannot change information</h1>
        <%
        } else {
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <main>
            <%
                String error = (String) session.getAttribute("error");
                if (error != null && !error.isEmpty()) {
            %>
            <h2><%= error%></h2>
            <%
                }
            %>
            <form action="mainController?action=updateprofile" method="post">
                <table>
                    <input type="hidden" name="email" value="<%= email%>">
                    <tr>
                        <td>Full name: </td>
                        <td><input type="text" name="fullname" value="<%= name%>"/></td>
                    </tr>
                    <tr>
                        <td>Phone </td>
                        <td><input type="number" name="phone"/></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="password" required/></td>
                    </tr>
                </table>
                <input type="submit" name="action" value="updateprofile"/>
            </form>
        </main>
        <%            }
        %>
    </body>
</html>
