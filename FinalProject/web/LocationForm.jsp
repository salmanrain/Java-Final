<%-- 
    Document   : index
    Created on : 4-Apr-2018, 8:09:42 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Location"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <form role="form" action="updateTable" method="get">
                        <input type="hiden" name="Redirect" value="admin" />
                        <div class="form-group">
                            <a href="../src/java/servlets/MainServlets.java"></a>
                            <div class="form-group">
                                <label for="id">
                                    Id:
                                </label>
                                <c:if test="${locationObj == null}">
                                    <input type="text" class="form-control" value="Auto" disabled/>
                                </c:if>
                                <c:if test="${locationObj != null}">
                                    <input type="text" class="form-control" value="<c:out value='${locationObj.ID}' />" disabled/>
                                    <input type="hidden" name="id" value="<c:out value='${locationObj.ID}' />" />;
                                </c:if>
                            </div> 
                            <label for="locationName">
                                Location Name:
                            </label>
                            <input type="text" name="locationName" class="form-control" value="<c:out value='${locationObj.location}' />" id="locationName" />
                        </div>
                        <div class="form-group">

                            <label for="distributionCapacity">
                                Distribution Capacity:
                            </label>
                            <input type="text" name="distributionCapacity" class="form-control" value="<c:out value='${locationObj.distributionCapacity}' />" id="distributionCapacity" />
                        </div> 
                        <input type="submit" class="btn btn-primary" value="Save" />

                    </form>
                </div>
            </div>
        </div>
    </body>
</html>





<!--<a href = "http://aldrotech.space/AutoShop/Parts"><button type="button" class="btn btn-default btn-info"><span class="fa fa-arrow-left"></span>&nbsp;Back to Products</button></a>
<a href="./CheckOut.php"><button type="button" class="btn btn-default btn-success" ><span class="fa fa-shopping-cart"></span>&nbsp;Checkout</button></a>-->
