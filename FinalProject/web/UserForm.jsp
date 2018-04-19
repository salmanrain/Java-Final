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
        
        <form action="MainServlets" method="get">
            
            <h1 id="userHeader">User</h1>
            <h1 id="agentHeader" hidden="true">Agent</h1>
            ID:
            <input type="text" name="id" value="Auto" disabled /><br />
            Username:
            <input type="text" name="userName" /><br />
            Type:
            <input type="button" name="admin" value="Admin" disabled/>
           
            <input type="button" name="agent" id="agentBtn_id" onclick="agentButton()" value="Agent" /><br />
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
            <input type="submit" name="submitButton" />
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
        </form>
        
    </body>
</html>
