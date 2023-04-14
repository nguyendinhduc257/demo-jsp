<%-- 
    Document   : update-product-form
    Created on : Apr 11, 2023, 7:56:15 PM
    Author     : LNA02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <a class="navbar-brand" href="http://localhost:8080/ShopNike/">
                    <img
                        src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Logo_NIKE.svg/1200px-Logo_NIKE.svg.png"
                        height="20"
                        alt="MDB Logo"
                        loading="lazy"
                        />
                </a>
            </div>
        </nav>
        <div id="container" style="margin: 5%">
            <h1 style="text-align: center">Update Product</h1>
            <hr>
            
            
            <form action="ProductControllerServlet" method="GET" class="row g-3 needs-validation" novalidate>
                <input type="hidden" name="command" value="UPDATE">
                <input type="hidden" name="id" value="${THE_PRODUCT.id}">
                
                <div class="col-md-5">
                    <div class="form-outline">
                        <input name="productName" value="${THE_PRODUCT.productName}" type="text" class="form-control" id="validationCustom01" required />
                        <label for="validationCustom01" class="form-label">Product name</label>
                        <div class="invalid-feedback">Please enter product name!</div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="input-group form-outline">
                        <input type="number" name="price" value="${THE_PRODUCT.price}" class="form-control" id="validationCustomUsername" required />
                        <label for="validationCustomUsername" class="form-label">Price</label>
                        <span class="input-group-text" id="inputGroupPrepend">$</span>
                        <div class="invalid-feedback">Please enter price!</div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="input-group form-outline">                   
                        <input name="des" value="${THE_PRODUCT.des}" type="text" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required />
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
                    <button type="submit" class="btn btn-dark">UPDATE PRODUCT</button>
                </div>
            </form> 

        </div>


    </body>
</html>