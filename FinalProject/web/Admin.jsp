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
        <title>Admin Page</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">

                    <form action="admin" method="get">
                        <input type="submit" name="tableType" value="Location" class="btn btn-success" />
                        <input type="submit" name="tableType" value="Agent" class="btn btn-success"/>
                        <input type="submit" name="tableType" value="User" class="btn btn-sucess" />
                        <input type="submit" name="tableType" value="Clients" class="btn btn-success"/> 
                        <input type="submit" name="tableType" value="Orders" class="btn btn-success"/>
                    </form>


                    <c:if test="${tableListType == 'location'}">
                        <form action="objectForm" method="get">

                            <table class="table" name="display">
                                <tr>
                                    <th>ID</th>
                                    <th>Location Name</th>
                                    <th>Distribution Capacity</th>
                                </tr>
                                <c:forEach var="tableList" items="${tableListLocation}">
                                    <tr>
                                        <td><c:out value="${tableList.ID}" /></td>
                                        <td><c:out value="${tableList.location}" /></td>
                                        <td><c:out value="${tableList.distributionCapacity}" /></td>
                                        <td><a href="objectForm?Id=<c:out value='${tableList.ID}' />&cType=Location">Edit</a></td>
                                        <td><a href="delete?Id=<c:out value='${tableList.ID}' />&cType=Location&Redirect=admin">Delete</a></td>
                                    </tr> 
                                </c:forEach>
                            </table>
                        </form>       
                        <div>
                            <form action="objectForm" method="get">
                                <input type="hidden" name="Id" value="-1" />
                                <input type="hidden" name="cType" value="Location" />
                                <input type="submit" name="submit" value="Add New Location"  class="btn btn-success">
                            </form>
                        </div>

                    </c:if>
                    <c:if test="${tableListType == 'marketingagent'}">
                        <table class="table" name="display">
                            <tr>
                                <th>ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Phone number</th>
                                <th>Email</th>
                            </tr>

                            <c:forEach var="tableList" items="${tableListAgent}">
                                <tr>
                                    <td><c:out value="${tableList.ID}" /></td>
                                    <td><c:out value="${tableList.firstName}" /></td>
                                    <td><c:out value="${tableList.lastName}" /></td>
                                    <td><c:out value="${tableList.phoneNo}" /></td>
                                    <td><c:out value="${tableList.email}" /></td>

                                </tr>

                            </c:forEach>

                        </table>

                        <div>
                            
                            <p>To Create Agents Convert Users to agents</p>
                        </div>

                    </c:if>
                    
                    <!--add users table here-->
                    <c:if test="${tableListType == 'user'}">
                        <table class="table" name="display">
                            <tr>
                                
                                <th>ID</th>
                                <th>User Name</th>
                                <th>Type</th>
                                
                            </tr>
                            <c:forEach var="tableList" items="${tableListUser}">
                             
                            <tr>
                                <td><c:out value="${tableList.ID}" /></td>
                                <td><c:out value="${tableList.userName}" /></td>
                                <td><c:out value="${tableList.userType}" /></td>
                                
                                
                            </tr>  
                                
                            </c:forEach>
                            
                            
                        </table>
                        
                        <form action="objectForm" method="get">
                                <input type="hidden" name="Id" value="-1" />
                                <input type="hidden" name="cType" value="User" />
                                <input type="submit" name="submit" value="Add New User"  class="btn btn-success">
                            </form>
                        
                    </c:if>
                    
                    
                    
                    <c:if test="${tableListType == 'clients'}">

                        <table class="table" name="display">
                            <tr>
                                <th>ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Street Number</th>
                                <th>Street Name</th>
                                <th>City</th>
                                <th>Province</th>
                                <th>Postal Code</th>
                                <th>Tel Office</th>
                                <th>Tel Cell</th>
                                <th>Email</th>
                                <th>Company</th>
                                <th>Company Type</th>

                            </tr>

                            <c:forEach var="tableList" items="${tableListClient}">
                                <tr>
                                    <td><c:out value="${tableList.ID}" /></td>
                                    <td><c:out value="${tableList.firstName}" /></td>
                                    <td><c:out value="${tableList.lastName}" /></td>
                                    <td><c:out value="${tableList.streetNumber}" /></td>
                                    <td><c:out value="${tableList.streetName}" /></td>
                                    <td><c:out value="${tableList.city}" /></td>
                                    <td><c:out value="${tableList.province}" /></td>
                                    <td><c:out value="${tableList.postalCode}" /></td>
                                    <td><c:out value="${tableList.telOffice}" /></td>
                                    <td><c:out value="${tableList.telCell}" /></td>
                                    <td><c:out value="${tableList.email}" /></td>
                                    <td><c:out value="${tableList.company}" /></td>
                                    <td><c:out value="${tableList.companyType}" /></td>
                                </tr> 
                            </c:forEach>               
                        </table>
                        <div>
                            <form action="objectForm" method="get">
                                <input type="hidden" name="Id" value="-1" />
                                <input type="hidden" name="cType" value="Client" />
                                <input type="submit" name="submit" value="Add New Client"  class="btn btn-success">
                            </form>
                        </div>
                    </c:if>
                    <c:if test="${tableListType == 'orders'}">
                        <table class="table" name="display">
                            <tr>
                                <th>ID</th>
                                <th>Agent ID</th>
                                <th>Client ID</th>
                                <th>FlyerQty</th>
                                <th>Flyer Layout</th>
                                <th>Flyer Img</th>
                                <th>Personal Copy</th>
                                <th>Paymant Info</th>
                                <th>Invoice Number</th>
                                <th>Comments</th>
                                <th>FlyerArt Approved</th>
                                <th>Payment Received</th>

                            </tr>

                            <c:forEach var="tableList" items="${tableListOrder}">
                                <tr>
                                    <td><c:out value="${tableList.ID}" /></td>
                                    <td><c:out value="${tableList.agentId}" /></td>
                                    <td><c:out value="${tableList.clientId}" /></td>
                                    <td><c:out value="${tableList.flyerQty}" /></td>
                                    <td><c:out value="${tableList.flyerLayout}" /></td>
                                    <td><c:out value='${tableList.flyerImg}' /></td>
                                    <td><c:out value="${tableList.personalCopy}" /></td>
                                    <td><c:out value="${tableList.paymentInformation}" /></td>
                                    <td><c:out value="${tableList.invoiceNumber}" /></td>
                                    <td><c:out value="${tableList.comments}" /></td>
                                    <td><c:out value="${tableList.isFlyerArtApproved}" /></td>
                                    <td><c:out value="${tableList.isPaymentReceived}" /></td>


                                </tr> 

                            </c:forEach>

                        </table>
                        <div>
                            <form action="objectForm" method="get">
                                <input type="hidden" name="Id" value="-1" />
                                <input type="hidden" name="cType" value="Order" />
                                <input type="submit" name="submit" value="Add New Order"  class="btn btn-success">
                            </form>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>  


    </body>
</html>
