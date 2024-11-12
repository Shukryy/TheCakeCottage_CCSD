<%-- 
    Document   : AdminUpdateProduct
    Created on : 9 Nov 2024, 12:29:30 am
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="dao.*"%>
<%@page import="model.*"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Update Product | Admin</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <link rel="stylesheet" href="assets/vendors/font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" href="assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <!-- endinject -->
        <!-- Layout styles -->
        <link rel="stylesheet" href="assets/css/vertical-light-layout/style.css">
        <!-- End layout styles -->
        <link rel="shortcut icon" href="assets/images/favicon.png" />

        <%
            Customer customer = (Customer) request.getSession().getAttribute("customer");

            Admin admin = (Admin) request.getSession().getAttribute("admin");
        %>
    </head>
    <body>
        <div class="container-scroller">

            <!-- partial:partials/_sidebar.html -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <div class="text-center sidebar-brand-wrapper d-flex align-items-center">
                    <a class="sidebar-brand brand-logo mb-3" href="AdminDashboard.jsp"><img src="/CCSD/img/logo4.png" alt="logo" /></a>
                    <a class="sidebar-brand brand-logo-mini ps-4 pt-3" href="AdminDashboard.jsp">
                        <img src="/CCSD/img/icon-cake-mini.png" alt="logo" style="width: 23px; height: 25px;" />
                    </a>
                </div>
                <ul class="nav mb">
                    <li class="nav-item mt-3">
                        <a class="nav-link" href="AdminDashboard.jsp">
                            <i class="mdi mdi-home menu-icon"></i>
                            <span class="menu-title">Dashboard</span>
                        </a>
                    </li>        
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                            <i class="mdi mdi-crosshairs-gps menu-icon"></i>
                            <span class="menu-title">Product</span>
                            <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="ui-basic">
                            <ul class="nav flex-column sub-menu">          
                                <li class="nav-item"> <a class="nav-link" href="AdminAddProduct.jsp">Add Product</a></li>
                                <li class="nav-item"> <a class="nav-link" href="AdminUpdateProduct.jsp">Update Product</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">        
                <!-- partial:partials/_navbar.html -->
                <nav class="navbar col-lg-12 col-12 p-lg-0 fixed-top d-flex flex-row">
                    <div class="navbar-menu-wrapper d-flex align-items-stretch justify-content-between">
                        <a class="navbar-brand brand-logo-mini align-self-center d-lg-none" href="AdminDashboard.jsp"><img src="/CCSD/img/icon-cake-mini.png" alt="logo" /></a>
                        <button class="navbar-toggler navbar-toggler align-self-center me-2" type="button" data-toggle="minimize">
                            <i class="mdi mdi-menu"></i>
                        </button>

                        <ul class="navbar-nav navbar-nav-right ml-lg-auto">
                            <li class="nav-item  nav-profile dropdown border-0">
                                <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-bs-toggle="dropdown">
                                    <img class="nav-profile-img me-2" alt="" src="/CCSD/img/icon/profile.png">
                                    <span class="profile-name"><%= admin.getAdminName()%></span>
                                </a>
                                <div class="dropdown-menu navbar-dropdown w-100" aria-labelledby="profileDropdown">
                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/AdminController?action=signout">
                                        <i class="mdi mdi-logout me-2 text-primary"></i> Signout </a>
                                </div>
                            </li>
                        </ul>
                        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                            <span class="mdi mdi-menu"></span>
                        </button>
                    </div>
                </nav>
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper pb-0">
                        <div class="page-header flex-wrap">
                            <h3 class="mb-0"><strong>Update Product</strong></h3>
                        </div>

                        <div class="row justify-content-center">
                            <div class="col-xl-8 col-sm-6 grid-margin stretch-card">
                                <div class="card" style="box-shadow: 0 4px 8px rgba(0,0,0,0.1); border-radius: 8px;">
                                    <div class="card-body px-0 overflow-auto" style="padding: 20px;">
                                        <h4 class="card-title ps-4" style="padding-left: 20px; font-weight: bold;">Product Details</h4>
                                        <div class="table-responsive">
                                            <table class="table" style="width: 100%; border-collapse: separate; border-spacing: 0 10px;">
                                                <thead class="bg-light" style="background-color: #f8f9fa;">
                                                    <tr>
                                                        <th style="padding: 10px; text-align: center;">No</th>
                                                        <th style="padding: 10px; text-align: center;">Name</th>
                                                        <th style="padding: 10px; text-align: center;">Category</th>
                                                        <th style="padding: 10px; text-align: center;">Price</th>
                                                        <th style="padding: 10px; text-align: center;">Image</th>
                                                        <th style="padding: 10px; text-align: center;">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        ProductDao productDao = new ProductDao();
                                                        int count = 0;
                                                        List<Product> listProduct = productDao.getAllProduct();
                                                        for (Product product : listProduct) {
                                                    %>
                                                    <tr class="data-row" style="transition: background-color 0.3s; border-bottom: 1px solid #dee2e6;">
                                                        <td style="padding: 10px; text-align: center;"><%= ++count%></td>
                                                        <td style="padding: 10px; text-align: center;"><%= product.getProductName()%></td>
                                                        <td style="padding: 10px; text-align: center;">
                                                            <div class="badge badge-inverse-success" style="background-color: #28a745; color: #fff; padding: 5px 10px; border-radius: 5px;">
                                                                <%= product.getProductCategory()%>
                                                            </div>
                                                        </td>
                                                        <td style="padding: 10px; text-align: center;">RM <%= String.format("%.2f", product.getProductPrice())%></td>
                                                        <td style="padding: 10px; text-align: center;">
                                                            <div class="d-flex" style="display: flex; justify-content: center;">
                                                                <img src="/CCSD/imageDB/imageProduct.jsp?id=<%= product.getProductId()%>" alt="Product Image" style="width: 100px; height: auto; border-radius: 5px;" />
                                                            </div>
                                                        </td>
                                                        <td style="padding: 10px; text-align: center;">
                                                        <td style="padding: 10px; text-align: center;">
                                                            <button type="button" 
                                                                    data-bs-toggle="modal" 
                                                                    data-bs-target="#ModalUpdatesProduct<%=product.getProductId()%>" 
                                                                    class="btn btn-primary btn-action" 
                                                                    style="margin: 5px; padding: 5px 10px; font-size: 14px;">
                                                                Update
                                                            </button>

                                                            <a onclick="return confirm('Are you sure to delete this product?')" 
                                                               href="<%=request.getContextPath()%>/ProductController?productId=<%= product.getProductId()%>&action=deleteProduct" 
                                                               class="btn btn-danger btn-action" 
                                                               style="margin: 5px; padding: 5px 10px; font-size: 14px;">
                                                                <i class="fa fa-trash-o"></i> 
                                                                Delete
                                                            </a>

                                                            <!-- Modal for Update Product -->
                                                            <div class="modal fade" id="ModalUpdatesProduct<%= product.getProductId()%>" tabindex="-1" aria-labelledby="detailsProductLabel" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content" style="border-radius: 10px; box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);">
                                                                        <div class="modal-header" style="background-color: #f8f9fa; border-bottom: 1px solid #dee2e6;">
                                                                            <h5 class="modal-title" id="detailsProductLabel" style="font-weight: bold; color: #343a40;"><%= product.getProductName()%></h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="background-color: transparent; border: none;"></button>
                                                                        </div>
                                                                        <div class="modal-body" style="padding: 20px;">
                                                                            <form action="ProductController?productId=<%= product.getProductId()%>" method="POST" enctype="multipart/form-data" onsubmit="return confirm('Successfully Update The Product');">
                                                                                <input type="hidden" name="productId" value="<%= product.getProductId()%>">
                                                                                <div class="mb-3" style="margin-bottom: 1rem;">
                                                                                    <label for="productName" class="form-label" style="font-weight: bold; color: #495057; text-align: left; display: block;">Name</label>
                                                                                    <input type="text" class="form-control" id="productName" name="productName" value="<%= product.getProductName()%>" required style="display: block; width: 100%; padding: .375rem .75rem; line-height: 1.5; color: #495057; background-color: #fff; border: 1px solid #ced4da; border-radius: 5px;">
                                                                                </div>
                                                                                <div class="mb-3" style="margin-bottom: 1rem;">
                                                                                    <label for="productCategory" class="form-label" style="font-weight: bold; color: #495057; text-align: left; display: block;">Category</label>
                                                                                    <input type="text" class="form-control" id="productCategory" name="productCategory" value="<%= product.getProductCategory()%>" required style="display: block; width: 100%; padding: .375rem .75rem; line-height: 1.5; color: #495057; background-color: #fff; border: 1px solid #ced4da; border-radius: 5px;">
                                                                                </div>
                                                                                <div class="mb-3" style="margin-bottom: 1rem;">
                                                                                    <label for="productPrice" class="form-label" style="font-weight: bold; color: #495057; text-align: left; display: block;">Price</label>
                                                                                    <input type="text" class="form-control" id="productPrice" name="productPrice" value="<%= product.getProductPrice()%>" required style="display: block; width: 100%; padding: .375rem .75rem; line-height: 1.5; color: #495057; background-color: #fff; border: 1px solid #ced4da; border-radius: 5px;">
                                                                                </div>
                                                                                <div class="mb-3" style="margin-bottom: 1rem;">
                                                                                    <label for="productImage" class="form-label" style="font-weight: bold; color: #495057; text-align: left; display: block;">Image</label>
                                                                                    <input type="file" class="form-control" id="productImage" name="productImage" required style="display: block; width: 100%; padding: .375rem .75rem; line-height: 1.5; color: #495057; background-color: #fff; border: 1px solid #ced4da; border-radius: 5px;">
                                                                                </div>
                                                                                <input type="hidden" name="adminId" value="<%= admin.getAdminId()%>">
                                                                                <div class="modal-footer" style="border-top: 1px solid #dee2e6;">
                                                                                    <button type="submit" 
                                                                                            name="action" 
                                                                                            value="updateProduct" 
                                                                                            class="btn btn-primary" 
                                                                                            style="background-color: #007bff; border-color: #007bff; border-radius: 5px;"
                                                                                            onclick="return confirm('Are you sure to update this product?')">
                                                                                        Update
                                                                                    </button>
                                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="background-color: #6c757d; border-color: #6c757d; border-radius: 5px;">Cancel</button>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <footer class="footer">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                                All rights reserved | The Cake Cottage CCSD                            
                            </span>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        <script src="assets/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <script src="assets/vendors/chart.js/Chart.min.js"></script>
        <script src="assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
        <script src="assets/vendors/flot/jquery.flot.js"></script>
        <script src="assets/vendors/flot/jquery.flot.resize.js"></script>
        <script src="assets/vendors/flot/jquery.flot.categories.js"></script>
        <script src="assets/vendors/flot/jquery.flot.fillbetween.js"></script>
        <script src="assets/vendors/flot/jquery.flot.stack.js"></script>
        <script src="assets/vendors/flot/jquery.flot.pie.js"></script>
        <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="assets/js/off-canvas.js"></script>
        <script src="assets/js/hoverable-collapse.js"></script>
        <script src="assets/js/misc.js"></script>
        <script src="assets/js/settings.js"></script>
        <script src="assets/js/todolist.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page -->
        <script src="assets/js/dashboard.js"></script>
        <script src="assets/js/proBanner.js"></script>
        <!-- End custom js for this page -->

    </body>
</html>

