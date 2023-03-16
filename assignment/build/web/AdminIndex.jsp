<%-- 
    Document   : AdminIndex
    Created on : Mar 7, 2023, 1:27:53 PM
    Author     : jerry
--%>

<%@page import="dao.AccountDAO"%>
<%@page import="dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css">
    </head>
    <body>
        <%
            String temp = (String) session.getAttribute("role");
            int role = temp == null ? 0 : Integer.parseInt(temp);
            Cookie[] c = request.getCookies();
            boolean login = false;
            if (role == 0) {
                if (c != null) {
                    String token = "";
                    for (Cookie cookie : c) {
                        if (cookie.getName().equals("selector")) {
                            token = cookie.getValue();
                            Account acc = AccountDAO.getAccount(token);
                            if (acc != null) {
                                role = acc.getRole();
                                login = true;
                            }
                        }
                    }
                }
            } else {
                login = true;
            }
            if (!login || role != 1) {
                response.sendRedirect("index.jsp");
            }
        %>
        <c:import url="header_loginedAdmin.jsp"/>
        <section class="right">
            <img src="images/background.jpg"/>
        </section>
    </body>
</html>
