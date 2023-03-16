<%-- 
    Document   : error
    Created on : Feb 7, 2023, 9:38:52 AM
    Author     : jerry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!-- The error object will be thrown and catch by this page -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <h1><%= exception.getMessage() %></h1>
    </body>
</html>
