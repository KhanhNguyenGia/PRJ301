<%-- 
    Document   : manageOrders
    Created on : Mar 16, 2023, 12:28:35 PM
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
        <%
            String[] status = {"", "processing", "completed", "canceled"};
        %>
        <form action="mainController" method="get">
            <input type="text" name="searchemail" value="${param.searchemail}">
            <input type="hidden" name="action" value="manageOrders">
            <input type="submit" value="search"> 
        </form>
        <table class="order">
            <tr>
                <td>Order ID</td>
                <td>Order Date</td>
                <td>Ship Date</td>
                <td>Order's status</td>
                <td>Action</td>
            </tr>
            <tr></tr>
            <c:forEach var="order" items="${requestScope.orderList}">
                <c:if test="${!order.isEmpty()}">
                    <c:forEach var="item" items="${order}">
                        <tr>
                            <td>${ item.getOrderID()}</td>
                            <td>${item.getOrderDate()}</td>
                            <td>${item.getShipDate() == null ? "N/A" : item.getShipDate()}</td>
                            <c:choose>
                                <c:when test="${item.getStatus() == 1}">
                                    <td>Processing</td>
                                </c:when> 
                                <c:when test="${item.getStatus() == 2}">
                                    <td>Completed</td>
                                </c:when> 
                                <c:otherwise>
                                    <td>Cancelled</td>
                                </c:otherwise>
                            </c:choose>
                            <td>
                                <a href="orderDetail.jsp?orderid=${item.getOrderID()}">detail</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </c:forEach>
        </table>

    </body>
</html>
