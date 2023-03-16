<%-- 
    Document   : ManageAccount
    Created on : Mar 7, 2023, 1:39:17 PM
    Author     : jerry
--%>

<%@page import="dao.AccountDAO"%>
<%@page import="dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <form action="mainController" method="get">
            <input type="text" name="txtsearch"/>
            <input type="submit" value="searchaccount" name="action"/>
        </form>
        <table class="order">
            <tr>
                <th>ID</th>                
                <th>Email</th>
                <th>Full name</th>
                <th>Status</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
            <c:forEach var="acc" items="${requestScope.accountList}">
                <tr>
                    <td><c:out value="${acc.getAccID()}"></c:out></td>
                    <td><c:out value="${acc.getEmail()}"></c:out></td>
                    <td><c:out value="${acc.getFullname()}"></c:out></td>
                        <td>
                        <c:choose>
                            <c:when test="${acc.getStatus() eq 1}">Active</c:when>
                            <c:otherwise>Inactive</c:otherwise>
                        </c:choose>
                    </td>
                    <td><c:out value="${acc.getPhone()}"></c:out></td>
                        <td>
                        <c:choose>
                            <c:when test="${acc.getRole() eq 1}">Admin</c:when>
                            <c:otherwise>User</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:if test="${acc.getRole() eq 0}">
                            <c:url var="mylink" value="mainController">
                                <c:param name="email" value="${acc.getEmail()}"></c:param>
                                <c:param name="status" value="${acc.getStatus()}"></c:param>
                                <c:param name="action" value="updateStatusAccount"></c:param>
                            </c:url>
                            <a href="${mylink}">Block/Unblock</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
