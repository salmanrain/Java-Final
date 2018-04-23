<%-- 
    Document   : AgentForm
    Created on : 18-Apr-2018, 5:15:39 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Brand</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                      <li><a href="index.jsp">Home</a></li> 
                      <li><a href="Admin.jsp">Admin</a></li>
                      <li><a href="AgentForm.jsp">Agent</a></li>
                      <li><a href="ClientForm.jsp">Client</a></li>
                      <li><a href="LocationForm.jsp">Location</a></li>
                      <li><a href="OrderForm.jsp">Order</a></li>
                      <li><a href="UserForm.jsp">User</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                      <li class="active"><a href="Login.jsp">Login</a></li>
                      <li><a href="#">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <form action="updateTable" method="get">
                        <div class='form-group'>
                            <label for='username'>Username:</label>
                            <input type="text" name="userName" class='form-control' id='username' disabled/>
                        </div>
                        <div class='form-group'>
                            <label for='fname'>First Name:</label>
                            <input type="text" name="userName" class='form-control' id='fname'/>
                        </div>
                        <div class='form-group'>
                            <label for='lname'>Last Name:</label>
                            <input type="text" name="userName" class='form-control' id='lname'/>
                        </div>
                        <div class='form-group'>
                            <label for='phone'>Phone #:</label>
                            <input type="text" name="userName" class='form-control' id='phone'/>
                        </div>
                        <div class='form-group'>
                            <label for='email'>Email:</label>
                            <input type="text" name="userName" class='form-control' id='email'/>
                        </div>
                        <input type="hidden" name="cType" value="Agent" />
                        <input type="submit" name="submit" class='form-control btn-primary' value="Update" />
                    </form>
                    <form action="changePassword" method="get">
                        <div title="Future Implementation">
                            <div class='form-group'>
                                <label for='psswd'>Password:</label>
                                <input type="text" class='form-control' id='psswd' name="password" disabled/>
                            </div>
                            <div class='form-group'>
                                <label for='rpsswd'>Re-Password:</label>
                                <input type="text" class='form-control' id='rpsswd' name="rePassword" disabled/>
                            </div>
                        </div>
                        <input type="submit" name="submit" class='form-control btn-primary' value="Change Pass"/>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
