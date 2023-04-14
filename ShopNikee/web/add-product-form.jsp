<%-- 
    Document   : add-product-form.jsp
    Created on : Apr 11, 2023, 7:55:58 PM
    Author     : LNA02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"   />
        <link rel="stylesheet" href="css/mdb.min.css" />
    </head>
    <body>
        <nav class="navbar navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="http://localhost:8080/ShopNikee/">
                    <img
                        src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Logo_NIKE.svg/1200px-Logo_NIKE.svg.png"
                        height="20"
                        alt="MDB Logo"
                        loading="lazy"
                        />
                </a>
            </div>
        </nav>
        <div class="container" style="margin:5%">
            <p>
                <button type="button" class="btn btn-light" data-mdb-ripple-color="dark">
                    <a href="ProductControllerServlet">Back to the List Product</a>
                </button>        
            </p>

            <form action="ProductControllerServlet" method="GET" class="row g-3 needs-validation" novalidate>
                <input type="hidden" name="command" value="ADD" />
                <div class="col-md-5">
                    <div class="form-outline">
                        <input name="productName" type="text" class="form-control" id="validationCustom01" value="" required />
                        <label for="validationCustom01" class="form-label">Product name</label>
                        <div class="invalid-feedback">Please enter product name!</div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="input-group form-outline">
                        <input name="price" type="number" class="form-control" id="validationCustomUsername" value="" required />
                        <label for="validationCustomUsername" class="form-label">Price</label>
                        <span class="input-group-text" id="inputGroupPrepend">$</span>
                        <div class="invalid-feedback">Please enter price!</div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="input-group form-outline">                   
                        <input name="des" type="text" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required />
                        <label for="validationCustomUsername" class="form-label">Description</label>
                        <div class="invalid-feedback">Please enter.</div>
                    </div>
                </div>
                <div class="col-10">
                    <div class="form-outline">
                        <input name="image" type="text" class="form-control" id="validationCustom03" required />
                        <label for="validationCustom03" class="form-label">Image Link</label>
                        <div class="invalid-feedback">Please provide image link.</div>
                    </div>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-dark">ADD PRODUCT</button>
                </div>
            </form> 
        </div>



        <script type="text/javascript" src="js/mdb.min.js"></script>
        <script type="text/javascript"></script> 
    </body>
</html>