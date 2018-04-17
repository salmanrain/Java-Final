<%-- 
    Document   : Login
    Created on : 11-Apr-2018, 5:39:20 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In</title>
    </head>
    <body>
        <form action="login" method="post" >
            <label><c:out value="${errorMsg}" /></label>
            UserName:
            <input type="text" name="userName" /><br />
            Password:
            <input type="password" name="password" />
            <br />
            <br />
            <input type="submit" name="submit" value="sign in"  />
        </form>
    </body>
</html>
