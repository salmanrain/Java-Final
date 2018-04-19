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
    </head>
    <body>
        <form action="updateTable" method="get">
            User Name: <input type="text" name="userName" disabled/><br />
            First Name:<input type="text" name="firstName" /><br />
            Last Name:<input type="text" name="firstName" /><br />
            Phone #:<input type="text" name="phoneNum" /><br />
            Email:<input type="text" name="email" /><br />
            <input type="hidden" name="cType" value="Agent" />
            <br />
            <br />
            <input type="submit" name="submit" value="Update" />
        </form>
        <form action="changePassword" method="get">
            <div title="Future Implementation"><!--Remove Div when Implemented-->
                Password: <input type="text" name="password" disabled/><br />
                Re-Password: <input type="text" name="rePassword" disabled/><br />
            </div>
            <input type="submit" name="submit" value="Change Pass"/>
        </form>
    </body>
</html>
