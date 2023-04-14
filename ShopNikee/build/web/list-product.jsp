<%-- 
    Document   : list-product
    Created on : Apr 7, 2023, 1:39:55 PM
    Author     : LNA02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- Tabs navs -->
        <ul class="nav nav-tabs nav-fill mb-3" id="ex1" role="tablist">
            <li class="nav-item" role="presentation">
                <a
                    class="nav-link active"
                    id="ex2-tab-1"
                    data-mdb-toggle="tab"
                    href="#ex2-tabs-1"
                    role="tab"
                    aria-controls="ex2-tabs-1"
                    aria-selected="true"
                    >PRODUCT</a
                >
            </li>
            <li class="nav-item" role="presentation">
                <a
                    class="nav-link"
                    id="ex2-tab-2"
                    data-mdb-toggle="tab"
                    href="#ex2-tabs-2"
                    role="tab"
                    aria-controls="ex2-tabs-2"
                    aria-selected="false"
                    >PRODUCT MANAGER</a
                >
            </li>
        </ul>
        <!-- Tabs navs -->

        <!-- Tabs content -->
        <div class="tab-content" id="ex2-content">
            <div class="tab-pane fade show active" id="ex2-tabs-1" role="tabpanel" aria-labelledby="ex2-tab-1">
                <section style="background-color: #eee;">
                    <div class="container py-5">
                        <div class="row">
                            <c:forEach var="tempProduct" items="${productlist}">

                                <div class="col-md-12 col-lg-4 mb-4 mb-lg-0" style="margin-top:20px">
                                    <div class="card text-black">
                                        <img src="${tempProduct.image}" class="card-img-top" alt="image"/>
                                        <div class="card-body">
                                            <div class="text-center mt-1">
                                                <h4 class="card-title">${tempProduct.productName}</h4>
                                                <h6 class="text-primary mb-1 pb-3">Starting at $ ${tempProduct.price}</h6>
                                            </div>

                                            <div class="text-center">
                                                <div class="d-flex flex-column mb-4">
                                                    <span>${tempProduct.des}</span>
                                                </div>
                                                <a href="#" class="btn btn-primary">More Infor</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </section>
            </div>
            <div class="tab-pane fade"  id="ex2-tabs-2" role="tabpanel" aria-labelledby="ex2-tab-2">
                <div id="wrapper">
                </div>
                <div id="container">
                    <%--put the new button here --%>
                    <hr>
                    <button onclick="window.location.href = 'add-product-form.jsp';return false;" type="submit" class="btn btn-light" data-mdb-ripple-color="dark" style="margin-left: 2%">
                        Add Product
                    </button>
                    
                    <div id="content">
                        <table border="1" class="table table-bordered border-primary" style="margin: 2%">
                            <thead>
                                <tr>
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="tempProduct" items="${productlist}">
                                    <!-- set up a link for each student -->
                                    <c:url var="tempLink" value="ProductControllerServlet">
                                        <c:param name="command" value="LOAD"></c:param>
                                        <c:param name="id" value="${tempProduct.id}"></c:param>

                                    </c:url>
                                    <!-- set up a link to delete a student -->
                                    <c:url var="deleteLink" value="ProductControllerServlet">
                                        <c:param name="command" value="DELETE"></c:param>
                                        <c:param name="id" value="${tempProduct.id}"></c:param>

                                    </c:url>

                                    <tr>
                                        <td> ${tempProduct.productName}</td>
                                        <td> ${tempProduct.price}</td>
                                        <td> ${tempProduct.des}</td>
                                        <td>
                                            <div class="btn-group shadow-0" role="group">
                                                <button type="button" class="btn btn-outline-primary" data-mdb-color="dark"> 
                                                    <a href="${tempLink}">Update</a>
                                                </button>
                                                <button type="button" class="btn btn-outline-danger" data-mdb-color="dark">
                                                    <a href="${deleteLink}"onclick="if (!(confirm('Sure?')))return false" >Delete</a>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- Tabs content -->

        <script type="text/javascript" src="js/mdb.min.js"></script>
        <script type="text/javascript"></script>        
    </body>
</html>

