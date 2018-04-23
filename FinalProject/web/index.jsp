<%-- 
    Document   : index
    Created on : 4-Apr-2018, 8:09:42 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <form role="form">
                        <div class="form-group">
                            <div class="form-group">

                                <label for="id">
                                    Id:
                                </label>
                                <input type="text" class="form-control" id="id" />
                            </div> 
                            <label for="locationName">
                                Location Name:
                            </label>
                            <input type="text" class="form-control" id="locationName" />
                        </div>
                        <div class="form-group">

                            <label for="distributionCapacity">
                                Distribution Capacity:
                            </label>
                            <input type="text" class="form-control" id="distributionCapacity" />
                        </div> 
                        <button type="submit" class="form-control btn-primary">
                            Add Location
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
