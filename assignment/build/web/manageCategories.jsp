<%-- 
    Document   : manageCategories
    Created on : Mar 16, 2023, 4:46:43 PM
    Author     : jerry
--%>

<%@page import="dao.AccountDAO"%>
<%@page import="dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="mycss.css" rel="stylesheet">
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
        <c:if test="${!request.categoryList.isEmpty()}">
            <table class="order">
                <tr>
                    <th>CateID</th>
                    <<th>CateName</th>
                </tr>
                <c:forEach var="category" items="${requestScope.categoryList}">
                    <tr>
                        <td>${category.getCateid()}</td>
                        <td>${category.getCatename()}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
