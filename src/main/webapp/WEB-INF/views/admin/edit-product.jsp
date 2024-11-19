<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Thêm sản phẩm</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link rel="stylesheet" href="/css/sb-admin-2.min.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:include page="../components/adminsidebar.jsp"/>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <jsp:include page="../components/topbar.jsp"/>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">Tất Cả sản phẩm</h1>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary"></h6>
                                </div>
                                <div class="card-body">
                                    <div class="row d-flex justify-content-between">
                                        <div class="col-sm-4">
                                            <h2>Quản lý <b>sản phẩm</b></h2>
                                        </div>

                                        <div class="col-sm-4 position-relative d-flex align-items-center" style="gap: 12px;">
                                            <div class="input-group mb-3">
                                                <form id="searchForm" class="d-flex">
                                                    <input id="inputSearch" name="name" type="text" class="form-control" placeholder="Find Product" aria-describedby="button-addon2">
                                                    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Button</button>
                                                </form>
                                            </div>
                                            <!-- Display search information below -->
                                            <div class="col-sm-12 position-absolute" style="top: 60%; margin-top: 8px; padding: 0;">
                                                <div id="productTableContainer" style="display: none;">
                                                    <!-- Ket qua tim kiem se duoc hien thi tai day -->
                                                    <table class="table table-striped table-hover table-dark p-2">
                                                        <thead>
                                                            <tr class="row ms-0 me-0">
                                                                <th class="col-sm-4">Name</th>
                                                                <th class="col-sm-4">Price</th>
                                                                <th class="col-sm-4">Image</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="productTableBody">
                                                            <jsp:include page="../components/filterdatatable.jsp"/>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-4 d-flex align-items-center justify-content-end" style="gap: 12px;">
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addNewProductModal">
                                                <i class="fa-solid fa-plus"></i>   <span>Them san pham</span>
                                            </button>
                                        </div>
                                    </div>
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <span class="custom-check">
                                                        <input id="select-all" type="checkbox" name="select-all" >
                                                    </span>
                                                </th>
                                                <th>Id:</th>
                                                <th>Name:</th>
                                                <th>Price:</th>
                                                <th>Image:</th>
                                                <th>Description:</th>
                                                <th>Quantity:</th>
                                                <th>Inventory:</th>
                                                <th>Actions:</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${existProduct}" var="p">
                                                <tr>
                                                    <td>
                                                        <span class="custom-checkbox">
                                                            <input type="checkbox" name="checkbox-${p.id}" class="checkboxes">
                                                        </span>
                                                    </td>
                                                    <td>${p.id}</td>
                                                    <td>${p.name}</td>
                                                    <td>${p.price}</td>
                                                    <td><img src="<c:url value='/webapp/static/image/product/${p.image}'/>" alt="Anh san pham" width="105px" height="75px"/></td>
                                                    <td title="${p.description}">
                                                        <c:choose>
                                                            <c:when test="${fn:length(p.description) > 10}">
                                                                ${fn:substring(p.description, 0, 10)}...
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${p.description}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${p.quantity}</td>
                                                    <td>${p.inventory}</td>
                                                    <td class="d-flex align-items-center justify-content-between" style="gap: 4px !important;">
                                                        <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#updateProduct${p.id}">
                                                            <i class="fa-solid fa-pen"></i>
                                                        </button>
                                                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteProductModal${p.id}">
                                                            <i class="fa-solid fa-xmark"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pagination -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                          <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                          <li class="page-item"><a class="page-link" href="#">2</a></li>
                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                          <li class="page-item"><a class="page-link" href="#">Next</a></li>
                        </ul>
                      </nav>
                    <!-- End pagination -->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- footer -->
            <jsp:include page="../components/adminfooter.jsp"/>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Modal Add New Product -->
    <div class="modal fade" id="addNewProductModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Thêm sản phẩm</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">
                <form:form action="${pageContext.request.contextPath}/admin/add-new-product" method="post" modelAttribute="product" enctype="multipart/form-data">
                    <label for="mo-name">Name</label>
                    <form:input class="form-control" path="name" id="mo-name" type="text"/>
                    <br>
                    <label for="mo-price">Price</label>
                    <form:input class="form-control" path="price" min="0" id="mo-price" type="number" step="0.05"/>                
                    <br>
                    <label for="mo-image">Image</label>
                    <input class="form-control" id="mo-image" type="file" accept=".png, .jpg, .webp" name="imageFile"/>
                    <br>
                    <label for="mo-desc">Description</label>
                    <form:input class="form-control" path="description" id="mo-desc" type="text"/>
                    <br>
                    <label for="mo-quantity">Quantity</label>
                    <form:input class="form-control" path="quantity" min="0" id="mo-quantity" type="number" step="1"/>             
                    <br>
                    <label for="mo-inventory">Inventory</label>
                    <form:input class="form-control" path="inventory" min="0" id="mo-inventory" type="number" step="1"/>               
                    <br>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <form:button type="submit" class="btn btn-primary">Save changes</form:button>
                </form:form>
            </div>
        </div>
        </div>
    </div>
    <!-- End Modal Add New Product -->

    <!--Update Product -->
    <c:forEach items="${existProduct}" var="p">
        <div class="modal fade" id="updateProduct${p.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel${p.id}">Cập nhật sản phẩm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    <form:form action="${pageContext.request.contextPath}/admin/update-product/${p.id}" method="post" modelAttribute="product" enctype="multipart/form-data">
                        <div class="mb-2">
                            <label for="mo-name${p.id}">Name</label>
                            <form:input class="form-control" path="name" id="mo-name${p.id}" type="text" value="${p.name}"/>
                        </div>
                        <br>
                        <div class="mb-2">
                            <label for="mo-price${p.id}">Price</label>
                            <form:input class="form-control" path="price" min="0" id="mo-price${p.id}" type="number" step="0.05" value="${p.price}"/>  
                        </div>                 
                        <br>
                        <div class="mb-2">
                            <label for="mo-image${p.id}">Image</label>
                            <c:choose>
                                <c:when test="${not empty p.image}">
                                    <img src="<c:url value='/webapp/static/image/product/${p.image}'/>" alt="Anh san pham" width="105px" height="75px"/>
                                    <input class="form-control mt-3" id="mo-image${p.id}" type="file" 
                                        accept=".png, .jpg, .webp" name="imageFile" />
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control" id="mo-image${p.id}" type="file" 
                                        accept=".png, .jpg, .webp" name="imageFile" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <br>
                        <div class="mb-2">
                            <label for="mo-desc${p.id}">Description</label>
                            <form:input class="form-control" path="description" id="mo-desc${p.id}" type="text" value="${p.description}"/>
                        </div>
                        <br>
                        <div class="mb-2">
                            <label for="mo-quantity">Quantity</label>
                            <form:input class="form-control" path="quantity" min="0" id="mo-quantity${p.id}" type="number" value="${p.quantity}" step="1"/>  
                        </div>                  
                        <br>
                        <div class="mb-2">
                            <label for="mo-inventory${p.id}" placeholder="${p.inventory}">Inventory</label>
                                <form:input class="form-control" path="inventory" min="0" id="mo-inventory${p.id}" type="number" value="${p.inventory}" step="1"/>   
                        </div>                
                        <br>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <form:button type="submit" class="btn btn-primary">Save changes</form:button>
                    </form:form>
                </div>
            </div>
            </div>
        </div>
    </c:forEach>
    <!-- End Update Product -->

    <!-- Delete Product -->
    <c:forEach items="${existProduct}" var="p">
        <div class="modal fade" id="deleteProductModal${p.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel${p.id}">Xoá sản phẩm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                   <form:form action="${pageContext.request.contextPath}/admin/delete-product/${p.id}" modelAttribute="product" method="post">
                        <div>
                            <span>Bạn muốn xóa sản phẩm Id: ${p.id}</span>
                        </div>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <form:button type="submit" class="btn btn-primary">Save changes</form:button>
                   </form:form>
                </div>
            </div>
            </div>
        </div>
    </c:forEach>
    <!-- End Modal Delete Product -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Fontawesome Kit -->
    <script src="https://kit.fontawesome.com/a684fa6962.js" crossorigin="anonymous"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>
    <script src="/js/sb-admin-2.js"></script>
    <script src="/js/filterDataTable.js"></script>
    

</body>

</html>