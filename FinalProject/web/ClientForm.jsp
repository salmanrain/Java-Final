<%-- 
    Document   : ClientForm
    Created on : 16-Apr-2018, 11:21:56 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client Form Page</title>
    </head>
    <body>
    
    <form action="updateTable" action="get">
        First Name:
        <input type="text" name="firstName" /><br />
        Last Name:
        <input type="text" name="lastName" /><br />
        Street Number:
        <input type="text" name="streetNumber" /><br />
        Street Name:
        <input type="text" name="streetName" /><br />
        City:
        <input type="text" name="city" /><br />
        Province:
        <input type="text" name="province" /><br />
        Postal Code:
        <input type="text" name="postalCode" /><br />
        Tel Office:
        <input type="text" name="telOffice" /><br />
        Tel Cell:
        <input type="text" name="telCell" /><br />
        Email:
        <input type="email" name="email" /><br />
        Company:
        <input type="text" name="company" /><br />
        Company Type:
        <input type="text" name="companyType" /><br />
        <br />
        <input type="submit" name="submit" />
        
    </form>
        
        
        
    </body>
</html>
