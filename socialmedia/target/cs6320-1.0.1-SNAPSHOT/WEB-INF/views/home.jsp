<%-- 
    Document   : index
    Created on : Oct 10, 2016, 8:55:36 PM
    Author     : dan.marconett
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/cs6320/resources/css/bootstrap.min.css" type="text/css"/>
        <script src="/cs6320/resources/js/jquery-3.1.1.min.js"></script>
        <script src="/cs6320/resources/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container-fluid">
            <%--<%@ include file="header.jsp" %>--%>
            
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    ${message}
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Login
                        </div>
                        <div class="panel-body">
                            <form action="auth/login" method="POST" class="form-horizontal">
                                
                                <div class="form-group">
                                    <label class="control-label col-sm-2">Email:</label>
                                    <input type="email" name="email"/>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">Password:</label>
                                    <input type="password" name="password"/>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2"></label>
                                    <input type="submit" class="btn btn-sm btn-primary" value="Login"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <%--<a data-toggle="collapse" href="#collapse-create-form">Create Account</a>--%>
                                Create Account
                            </div>
                            <%--<div id="collapse-create-form" class="panel-collapse collapse">--%>
                                <div class="panel-body">
                                    <form action="auth/register" method="POST" class="form-horizontal">
                                        
                                        <div class="form-group">
                                            <label class="control-label col-sm-2">First Name:</label>
                                            <input type="text" name="firstname"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2">Last Name:</label>
                                            <input type="text" name="lastname"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2">Email:</label>
                                            <input type="email" name="email"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2">Password:</label>
                                            <input type="password" name="password"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2"></label>
                                            <input type="submit" class="btn btn-sm btn-primary" value="Create"/>
                                        </div>
                                    </form>
                                </div>
                            <%--</div>--%>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
					                
                </div>
            </div>
            <%@ include file="footer.jsp" %>
        </div>
    </body>
</html>
