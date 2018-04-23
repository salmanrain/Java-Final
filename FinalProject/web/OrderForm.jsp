<%-- 
    Document   : orderForm
    Created on : 16-Apr-2018, 10:45:52 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Form Page</title>
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
                      <li class='active'><a href="OrderForm.jsp">Order</a></li>
                      <li><a href="UserForm.jsp">User</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                      <li><a href="Login.jsp">Login</a></li>
                      <li><a href="#">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <form action="updateTable" method="get" >
          <div class='container-fluid'>
              <div class='col-md-12'>
                  <div class='form-group'>
                      <label for='id'>ID:</label>
                      <input type="text" name="Id" value="Auto" class='form-control' id='id' disabled/>
                  </div>
                  <div class='form-group'>
                      <label for='aid'>Agent ID:</label>
                      <input type="text" name="agentId" class='form-control' id='aid'/>
                  </div>
                  <div class='form-group'>
                      <label for='cid'>Client ID:</label>
                      <input type="text" name="clientId" class='form-control' id='cid'/>
                  </div>
                  <div class='form-group'>
                      <label for='fq'>Flyer Quantity:</label>
                      <input type="text" name="flyerQty" value="" class='form-control' id='fq'/>
                  </div>
                  <div class='form-group'>
                      <label for='fl'>Flyer Layout:</label>
                      <input type="text" name="flyerLayout" class='form-control' id='fl'/>
                  </div>
                  <div class='form-group'>
                      <label for='fi'>Flyer Image:</label>
                      <input type="text" name="flyerImg" class='form-control' id='fi' />
                  </div>
                  <div class='form-group'>
                      <label for='pc'>Personal Copy:</label>
                      <input type="text" name="personalCopy" class='form-control' id='pc'/>
                  </div>
                  <div class='form-group'>
                      <label for='pi'>Payment Information:</label>
                      <input type="text" name="paymentInfo" class='form-control' id='pi'/>
                  </div>
                  <div class='form-group'>
                      <label for='invoiceNumber'>Invoice Number:</label>
                      <input type="text" name="invoiceNumber" class='form-control' id='invoiceNumber'/>
                  </div>
                  <div class='form-group'>
                      <label for='comments'>Comments:</label>
                      <input type="text" name="comments" class='form-control' id='comments'/>
                  </div>
                  <div class='form-group'>
                      <label for='isFlyerArtApproved'>Flyer Approved?</label>
                      <input type="text" name="isFlyerArtApproved"class='form-control' id='isFlyerArtApproved'/>
                  </div>
                  <div class='form-group'>
                      <label for='isPaymentReceived'>Payment Received:</label>
                      <input type="text" name="isPaymentReceived" class='form-control' id='isPaymentReceived'/>
                  </div>
                  <input type="submit" class='form-control btn-primary' name="submit" />
              </div>
          </div>
    </body>
</html>
