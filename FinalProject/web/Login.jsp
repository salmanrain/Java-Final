<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : Login
    Created on : 11-Apr-2018, 5:39:20 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In</title>
    </head>
    <body>
        <form action="MainServlets" method="post" >
            
            UserName:
            <input type="text" name="username" /><br />
            Password:
            <input type="password" name="password" />
            <br />
            <br />
            <input type="submit" name="submit" value="sign in" formaction="login" />
        </form>
    </body>
</html>
