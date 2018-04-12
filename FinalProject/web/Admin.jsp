<%-- 
    Document   : Admin
    Created on : 5-Apr-2018, 8:27:59 PM
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
        <form action="updateLocationTable" method="post">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">

                        <button type="button" class="btn btn-success">
                            Locations
                        </button> 
                        <button type="button" class="btn btn-success">
                            Agents
                        </button> 
                        <button type="button" class="btn btn-success">
                            Clients
                        </button>
                        <button type="button" class="btn btn-success">
                            Orders
                        </button>
                        <table class="table" name="display">
                            <tr>
                                <th>ID</th>
                                <th>Location Name</th>
                                <th>Distribution Capacity</th>
                            </tr>
                            <c:forEach var="LocateList" items="${listLocate}">
                                <tr>
                                    <td><c:out value="${LocateList.ID}" /></td>
                                    <td><c:out value="${LocateList.location}" /></td>
                                    <td><c:out value="${LocateList.distributionCapacity}" /></td>
                                    <td><a href="updateLocationTable?id=<c:out value='${LocateList.ID}' />">Edit</a></td>
                                    
                                </tr> 
                            </c:forEach>

                        </table>
                        <div>

                            <button type="button" name="create" onclick="window.location.href = 'LocationForm.jsp'" class="btn btn-success">
                                Add
                            </button>

                            <div>
                                <input type="text" name="Id" id="id" /> 
                                <button type="submit" class="btn btn-success">
                                    Edit
                                </button>
                            </div>

                        </div>

                    </div>
                </div>
            </div>  

        </form>
        <form action="Location" method="get">

            <div>
                <input type="text" name="Id" id="id" /> 
                <button type="submit" class="btn btn-success">
                    Delete
                </button>
            </div>

        </form>

    </body>
</html>
