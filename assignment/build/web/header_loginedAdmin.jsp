<%-- 
    Document   : header_loginedAdmin
    Created on : Mar 7, 2023, 1:30:09 PM
    Author     : jerry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <ul>
                <li><a href="mainController?action=manageAccounts">Manage Account</a></li>
                <li><a href="mainController?action=manageOrders">Manage Orders</a></li>
                <li><a href="mainController?action=managePlants">Manage Plants</a></li>
                <li><a href="mainController?action=manageCategories">Manage Categories</a></li>
                <li>
                    Welcome ${sessionScope.name} | <a href="mainController?action=logout">Log out</a>
                </li>
            </ul>
        </header>
    </body>
</html>
