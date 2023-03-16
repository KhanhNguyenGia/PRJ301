<%-- 
    Document   : jsp
    Created on : Feb 3, 2023, 10:35:27 AM
    Author     : jerry
--%>

<%@page import="servlet.MyConstant"%>
<%@page import="basicObect.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="post">
            <input type="text" name="userid">
            <input type="text" name="password">
            <input type="submit" name="action" value="<%= MyConstant.LOGIN %>">
        </form>
        <%
            String msg = (String) request.getAttribute("error");
            if (msg != null)
                out.print(request.getAttribute("error"));
        %>
        <hr/>
        <form action="MainController" method="post">
            <input name="search">
            <input type="submit" name="action" value="<%= MyConstant.FIND %>">
        </form>
        <!-- Result -->

        <%
            ArrayList<Item> list = (ArrayList<Item>) request.getAttribute("list");
            if (list != null && list.size() != 0) {
        %>
        <table>
            <thead>
            <th>ID</th>
            <th>NAME</th>
            <th>IMAGE</th>            
            <th>PRICE</th>
            <th>CHOOSE</th>
        </thead>

        <%
            for (Item i : list) {
        %>
        <tr>
            <!-- expression -->
            <td><%= i.getId() %></td>                
            <td><%= i.getName()%></td>                
            <td><img src="<%= i.getImage()%>" height="200" width="200" style="object-fit: cover; object-position: center"></td>                
            <td><%= i.getPrice() %></td>                
            <td><a href="#">Buy</a></td>                
            
        </tr>
        <%
            }
        %>
        <%
            }
        %>
</body>
</html>
