<%-- 
    Document   : viewPlant
    Created on : Mar 7, 2023, 11:56:29 AM
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
        <jsp:useBean id="plantObj" class="dto.Plant" scope="request" />
        <table>
            <tr>
                <td rowspan="8"><img src="<jsp:getProperty name="plantObj" property="imgpath"/>"/></td>
            </tr>
            <tr>
                <td>id: <jsp:getProperty name="plantObj" property="id"/></td>
            </tr>
            <tr>
                <td>product name: <jsp:getProperty name="plantObj" property="name"/></td>
            </tr>
            <tr>
                <td>price: <jsp:getProperty name="plantObj" property="price"/></td>
            </tr>
            <tr>
                <td>description: <jsp:getProperty name="plantObj" property="description"/></td>
            </tr>
            <tr>
                <td>status: <jsp:getProperty name="plantObj" property="status"/></td>
            </tr>
            <tr>
                <td>cate id: <jsp:getProperty name="plantObj" property="cateid"/></td>
            </tr>
            <tr>
                <td>category: <jsp:getProperty name="plantObj" property="catename"/></td>
            </tr>
        </table>
    </body>
</html>
