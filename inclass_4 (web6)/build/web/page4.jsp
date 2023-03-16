<%-- 
    Document   : page4
    Created on : Feb 17, 2023, 10:42:10 AM
    Author     : jerry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var='x' value='100' />
        <c:set var='y' value='200'/>
        Total: ${x+y}
        <c:if test="${x<y}">
            ${"em yeu co"}
        </c:if>
        <c:set var="kq" value="${sessionScope.list}"/>
        <c:if test="${kq != null}">
            <table>
                <tr>
                    <th>id</th>
                    <th>name</th>
                    <th>price</th>
                    <th>action</th>
                </tr>
                <c:forEach var="item" items="${kq}">
                    <tr>
                        <td>${item.id}</td>                        
                        <td>${item.name}</td>
                        <td>${item.price}</td>
                        <td><a href="?txtid=${item.id}&txtname=${item.name}&txtprice=${item.price}">Edit</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <h1>Thong tin san pham</h1>
        <form>
            <p><input type="text" name="txtid" value="${param.txtid}"/></p>            
            <p><input type="text" name="txtname" value="${param.txtname}"/></p>
            <p><input type="number" name="txtprice" value="${param.txtprice}" min="1"/></p>
            <p><input type="submit" name="action" value="update"/></p>
        </form>

        <c:if test="${sessionScope.time % 2 == 0}">
            <c:url var="url" value="page5.jsp"/>
        </c:if>
        <c:if test="${sessionScope.time % 2 != 0}">
            <c:url var="url" value="page6.jsp"/>
        </c:if>

        <a href="${url}">${url}</a>
    </body>
</html>
