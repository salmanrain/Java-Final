<%-- 
    Document   : User
    Created on : 10-Apr-2018, 10:30:35 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                      <li class='active'><a href="UserForm.jsp">User</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                      <li><a href="Login.jsp">Login</a></li>
                      <li><a href="#">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <form action="MainServlets" method="get">
            <h1 id="userHeader">User</h1>
            <h1 id="agentHeader" hidden="true">Agent</h1>
            <div class='container-fluid'>
                <div class='col-md-12'>
                    <div class='form-group'>
                        <label for='id'>ID:</label>
                        <input type="text" class='form-control' id='id' name="id" value="Auto" disabled />
                    </div>
                    <div class='form-group'>
                        <label for='userName'>Username:</label>
                        <input type="text" class='form-control' id='userName' name="userName" />
                    </div>
                    <div class='form-group'>
                        <label for='Type'>Type</label>
                        <div class='row' id='Type'>
                            <div class='col-md-6'>
                                <input type="button" class='form-control btn-default' name="admin" value="Admin" disabled/>
                            </div>
                            <div class='col-md-6'>
                                <input type="button" class='form-control btn-default' name="agent" id="agentBtn_id" onclick="agentButton()" value="Agent" />
                            </div>
                        </div>
                    </div>
                    <div id="hide" style="display: none;">
                        FirstName:
                        <input type="text" name="firstName" /><br />
                        LastName:
                        <input type="text" name="lastName" /><br />
                        Phone#:
                        <input type="text" name="phoneNum" /><br />
                        Email:
                        <input type="text" name="email" /><br />
                    </div>
                    <input type="hidden" id="cType" name="cType" value=""/>
                    <input type="submit" class='form-control ' name="submitButton" />
                </div>
            </div>
        </form>
        <script>
            function agentButton(){
                document.getElementById("agentBtn_id").disabled = true;
                document.getElementById("adminBtn_id").disabled = false;
                document.getElementById("hide").hidden = false;
                document.getElementById("agentHeader").hidden = false;
                document.getElementById("userHeader").hidden = true;
                document.getElementById("cType").value = "Agent"; 
            }
            function adminButton(){
                document.getElementById("agentBtn_id").disabled = false;
                document.getElementById("adminBtn_id").disabled = true;
                document.getElementById("hide").hidden = true;
                document.getElementById("agentHeader").hidden = true;
                document.getElementById("userHeader").hidden = false;
                document.getElementById("cType").value = "Admin"; 
            }
        </script>
    </body>
</html>
