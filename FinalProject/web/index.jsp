<%-- 
    Document   : index
    Created on : 4-Apr-2018, 8:09:42 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <form role="form">
                        <div class="form-group">
                            <div class="form-group">

                                <label for="id">
                                    Id:
                                </label>
                                <input type="text" class="form-control" id="id" />
                            </div> 
                            <label for="locationName">
                                Location Name:
                            </label>
                            <input type="text" class="form-control" id="locationName" />
                        </div>
                        <div class="form-group">

                            <label for="distributionCapacity">
                                Distribution Capacity:
                            </label>
                            <input type="text" class="form-control" id="distributionCapacity" />
                        </div> 
                        <button type="submit" class="btn btn-primary">
                            Add Location
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
