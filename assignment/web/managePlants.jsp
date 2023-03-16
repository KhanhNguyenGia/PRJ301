<%-- 
    Document   : managePlants
    Created on : Mar 16, 2023, 3:26:37 PM
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
        <table class="order">
            <tr>
                <th>ID</th>    
                <th>Image</th>
                <th>Name</th>
                <th>Price</th>
                <th>Status</th>
                <th>Category</th>
                <th>Action</th>
            </tr>
            <c:if test="${!requestScope.plantList.isEmpty()}">
                <c:forEach var="plant" items="${requestScope.plantList}">
                    <tr>
                        <td>${plant.getId()}</td>
                        <td><img src="${plant.getImgpath()}" alt=""></td>
                        <td>${plant.getName()}</td>
                        <td>${plant.getPrice()}</td>
                        <td>${plant.getStatus()}</td>
                        <td>${plant.getCatename()}</td>
                        <td>
                            <a href="#">Delete</a><br/>
                            <a href="#">Update</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
    </body>
</html>
