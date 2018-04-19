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
    </head>
    <body>
        <form action="updateTable" method="get" >
          
            ID:
            <input type="text" name="Id" value="Auto" disabled/><br />
            Agent ID:
            <input type="text" name="agentId" /><br />
            Client ID:
            <input type="text" name="clientId" /><br />
            Flyer Quantity:
            <input type="text" name="flyerQty" /><br />
            Flyer Layout:
            <input type="text" name="flyerLayout" /><br />
            Flyer Image:
            <input type="text" name="flyerImg" /><br />
            Personal Copy:
            <input type="text" name="personalCopy" /><br />
            Payment Information:
            <input type="text" name="paymentInfo" /><br />
            Invoice Number:
            <input type="text" name="invoiceNumber" /><br />
            Comments:
            <input type="text" name="comments" /><br />
            Flyer Approved?
            <input type="text" name="isFlyerArtApproved" /><br />
            Payment Received:
            <input type="text" name="isPaymentReceived" /><br />
            <br />
            <input type="submit" name="submit" />
            
            
        </form>
        
    </body>
</html>
