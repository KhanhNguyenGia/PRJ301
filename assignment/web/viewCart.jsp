<%-- 
    Document   : viewCarat
    Created on : Mar 7, 2023, 9:51:09 AM
    Author     : jerry
--%>

<%@page import="dto.Plant"%>
<%@page import="dao.PlantDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <%
                String name = (String) session.getAttribute("name");
                if (name != null) {
            %>
            <h3>Welcome come back, ${name}</h3>
            <h3><a href="mainController?action=logout">Log out</a></h3>
            <h3><a href="personalPage.jsp">Personal page</a></h3>
            <%
                }
            %>
            <font style="color:red">${requestScope.WARNING == null ? "" : requestScope.WARNING}</font>
            <table width="100%" class="shopping">
                <tr>
                    <td>Product id</td>
                    <td>Image</td>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Action</td>
                </tr>
                <%
                    HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                    int money = 0;
                    if (cart != null) {
                        Set<String> pids = cart.keySet();
                        if (pids.size() == 0) {
                %>
                <tr>
                    <td>Your cart is empty</td>
                </tr>
                <%
                } else {
                    for (String pid : pids) {
                        int quantity = cart.get(pid);
                        Plant p = PlantDAO.getPlant(Integer.parseInt(pid));
                        money += quantity * p.getPrice();
                %>
                <form action="mainController" method="post">
                    <tr>
                        <td>
                            <input type="hidden" value="<%= pid%>" name="pid"/>
                            <a href="mainController?action=getplant&pid=<%=pid%>"><%=pid%></a>
                        </td>
                        <td>
                            <img src="<%= p.getImgpath()%>"/>
                        </td>
                        <td>
                            <%= p.getPrice()%>
                        </td>
                        <td>
                            <input type="number" value="<%= quantity%>" name="quantity"/>
                        </td>
                        <td>
                            <input type="submit" value="update" name="action"/>
                            <input type="submit" value="delete" name="action"/>
                        </td>
                    </tr>
                </form>
                <%
                        }
                    }
                } else {
                %>
                <tr>
                    <td>Your cart is empty</td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td>Total money: <%= money%></td>
                </tr>
                <tr>
                    <td>
                        Order Date: <%= (new Date()).toString()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Ship Date: N/A
                    </td>
                </tr>
            </table>
        </section>
        <section>
            <form action="mainController" method="post">
                <input type="submit" value="saveorder" name="action" class="submitorder"/>
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
