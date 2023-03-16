<%-- 
    Document   : index
    Created on : Feb 6, 2023, 10:21:32 AM
    Author     : jerry
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.PlantDAO"%>
<%@page import="dto.Plant"%>
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
        <section>
            <%
                String keyword = request.getParameter("txtsearch");
                String searchby = request.getParameter("searchby");
                ArrayList<Plant> list;
                String[] temp = {"Out of stock", "Available"};
                if (keyword != null && searchby != null) {
                    list = PlantDAO.getPlants(keyword, searchby);
                } else {
                    list = PlantDAO.getPlants("", "");
                }
                if (list != null && !list.isEmpty()) {
                    for (Plant p : list) {
            %>
            <table class="product">
                <tr>
                    <td><img src="<%= p.getImgpath()%>" class="plantimg"/></td>
                    <td>Product ID: <%= p.getId()%></td>
                    <td>Product name: <%= p.getName()%></td>
                    <td>Price: <%= p.getPrice()%></td>
                    <td>Status: <%= p.getStatus()%></td>
                    <td>Category: <%=p.getCatename()%></td>
                    <td><a href="">Add to cart</a></td>
                </tr>
            </table>
            <%
                    }
                }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
