<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inbox</title>
<link rel="stylesheet" href="/cs6320/resources/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="/cs6320/resources/css/design.css" type="text/css" />
<script src="/cs6320/resources/js/jquery-3.1.1.min.js"></script>
<script src="/cs6320/resources/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container-fluid">

		<button type="button" class="btn btn-default edit" data-toggle="modal"
			data-target="#myModal">Send Email</button>
			
			<div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit User</h4>
                        </div>
                        <div class="modal-body">
                            <form action="send" method="POST" class="form-horizontal">
                                <input type="hidden" name="sender" value=${sessionScope.user.email }/>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">Send To:</label>
                                    <input id="receiver" type="email" name="receiver"/>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">Title:</label>
                                    <input id="title" type="text" name="title"/>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">Message:</label>
                                    <input id="message" type="text" name="message"/>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2"></label>
                                    <input type="submit" class="btn btn-sm btn-primary" value="Send"/>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

		<p>
		
		<table class="table">
                <tr>
                    <th>From</th><th>Title</th><th>Action</th>
                </tr>
                <c:forEach var="msg" items="${messages}">
                    <tr id="${msg.id}">
                    	<td>${msg.sender}</td>
                        <td>${msg.title}</td>
                        <td>
                        	<form action="view" method="POST">
								<input type="hidden" name="msgID" value=${msg.id }> 
								<input type="submit" value="View" />
							</form>
						</td>
                        
                        <td>
                            <form action="delete" method="POST">
                            	<input type="hidden" name="userEmail" value=${sessionScope.user.email }>
								<input type="hidden" name="msgID" value=${msg.id } > 
								<input type="submit" value="Delete" />
							</form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
			
		</p>
	</div>
</body>
</html>
