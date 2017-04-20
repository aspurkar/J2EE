<%-- 
    Document   : home
    Created on : Oct 3, 2016, 8:34:23 PM
    Author     : dan.marconett
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="/cs6320/resources/css/bootstrap.min.css" type="text/css"/>
        <script src="/cs6320/resources/js/jquery-3.1.1.min.js"></script>
        <script src="/cs6320/resources/js/bootstrap.min.js"></script> 
    </head>
    <body>
        <div class="container-fluid">
            <jsp:include page="header.jsp"/>
            <div><a href="/cs6320/admin/list">Admin Page</a>
                <c:if test="${sessionScope.role == 'admin'}">
                    <a href="/cs6320/admin">Admin Page</a>
                </c:if>
            </div>
            <h1>Hi, you entered:</h1>

            <p>
                First Name: ${user.firstname}<br>
                Last Name: ${user.lastname}<br>
                Email: ${user.email}
            </p>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
