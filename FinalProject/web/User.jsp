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
    </head>
    <body>
        
        <form action="" method="get">
            
            <h1>User</h1>
            
            ID:
            <input type="text" name="id" value="Auto" disabled /><br />
            Username:
            <input type="text" name="userName" /><br />
            Type:
            <input type="button" name="admin" value="Admin" disabled/>
            <input type="button" name="agent" value="Agent" /><br />
            <div>
                FirstName:
                <input type="text" name="firstName" /><br />
                LastName:
                <input type="text" name="lastName" /><br />
                Phone#:
                <input type="text" name="phoneNum" /><br />
                Email:
                <input type="text" name="email" /><br />
            </div>
            
            <input type="submit" name="submitButton" />
            
        </form>
        
    </body>
</html>
