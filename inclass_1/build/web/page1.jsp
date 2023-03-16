<%-- 
    Document   : page1
    Created on : Feb 3, 2023, 9:59:30 AM
    Author     : jerry
--%>

<!-- These are directives, used to import libraries/files -->
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@include file="tester.jsp" %> 
<!<!-- Literally copy the code from the test.jsp file -->
<%@page errorPage="error.jsp" %>
<!-- Any errors that happen send the page over to error.jsp -->

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>        
        <%
            // Scriplet
            // Java logic
            // belongs in the _jspService method
            // can print to screen
            session.setAttribute("test", 100);
            out.print(this.getMsg());
            out.print(msg2);
            int x = Integer.parseInt("a");
        %>
        <a href="page2.jsp">Page 2</a>

        <%!
            // Declaration
            // Declaring new variables
            String msg = "Hom nay nang qua";

            // Declaring functions/methods
            public String getMsg() {
                return msg;
            }

        %>
        <br/>
        <%
            Date d = new Date();
            out.print(d.toString());
        %>
    </body>
</html>
