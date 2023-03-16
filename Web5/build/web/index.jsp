<%-- 
    Document   : index
    Created on : Feb 10, 2023, 10:31:44 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dto.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p> <a href="MainController?action=viewdetailcart">View cart</a>  </p>
        <form action="MainController" method="get">
            <input type="submit" name="action" value="viewhistory">
        </form>
        <form action="MainController" method="get">
            <input type="text" name="txtsearch"  value="<%=(request.getParameter("name") != null) ? request.getParameter("name") : ""%>"   />
            <input type="submit" value="find" name="action"/>
        </form>
        <%
            ArrayList<Car> list = (ArrayList) request.getAttribute("listcars");
            if (list != null) {
                for (Car c : list) {
        %>

        <div>
            <p>Id: <%= c.getId()%></p>
            <p>name: <%= c.getName()%></p>
            <p>price <%= c.getPrice()%></p>
            <p><a href="MainController?action=viewcar&id=<%=c.getId()%>">Detail</a></p>

        </div>

        <%   }
            }
        %>
        <%
            //doc msg tu trang addtocartservlet
            String msg = (String) request.getAttribute("MSG");
            if (msg != null) {
        %>
        <script>
            alert("da them 1 sp vao gio");
        </script>
        <%
            }
        %>
    </body>
</html>
