<%-- 
    Document   : AdminAddProduct
    Created on : 8 Nov 2024, 11:55:18 pm
    Author     : User
--%>

<%-- 
    Document   : AdminDashboard
    Created on : 6 Nov 2024, 6:50:59 pm
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
        <title>Add Product | Admin</title>
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
                            <h3 class="mb-0"><strong>Add Product</strong></h3>
                        </div>

                        <div class="row justify-content-center">
                            <div class="col-xl-8 col-sm-12 grid-margin stretch-card">
                                <div class="card" style="box-shadow: 0 4px 8px rgba(0,0,0,0.1); border-radius: 8px;">
                                    <div class="card-body px-4 py-4 overflow-auto" style="background: #f9f9f9;">
                                        <h4 class="card-title mb-5">Product Details</h4>
                                        <div class="table-responsive">
                                            <form action="<%=request.getContextPath()%>/ProductController" method="POST" 
                                                  enctype="multipart/form-data" 
                                                  onsubmit="javascript:alert('Product Added Succesfully');">
                                                <div class="form-group mb-3" style="margin-bottom: 1rem;">
                                                    <label for="productName" class="form-label" style="font-weight: bold;">Name</label>
                                                    <input type="text" 
                                                           class="form-control" 
                                                           id="productName" 
                                                           name="productName" 
                                                           placeholder="Example : Triple Cheese" required 
                                                           style="display: block; width: 100%; padding: .375rem .75rem; line-height: 1.5; color: #495057; background-color: #fff; border: 1px solid #ced4da; border-radius: .25rem;" />
                                                </div>
                                                <div class="form-group mb-3" style="margin-bottom: 1rem;">
                                                    <label for="productCategory" class="form-label" style="font-weight: bold;">Category</label>
                                                    <input type="text" 
                                                           class="form-control" 
                                                           id="productCategory" 
                                                           name="productCategory" 
                                                           placeholder="Example : Cupcakes" required 
                                                           style="display: block; width: 100%; padding: .375rem .75rem; line-height: 1.5; color: #495057; background-color: #fff; border: 1px solid #ced4da; border-radius: .25rem;" />
                                                </div>
                                                <div class="form-group mb-3" style="margin-bottom: 1rem;">
                                                    <label for="productPrice" class="form-label" style="font-weight: bold;">Price (RM)</label>
                                                    <input type="text" 
                                                           class="form-control" 
                                                           id="productPrice" 
                                                           name="productPrice" 
                                                           placeholder="Example : 10.00"required 
                                                           style="display: block; width: 100%; padding: .375rem .75rem; line-height: 1.5; color: #495057; background-color: #fff; border: 1px solid #ced4da; border-radius: .25rem;" />
                                                </div>
                                                <div class="form-group mb-3" style="margin-bottom: 1rem;">
                                                    <label for="productImage" class="form-label" style="font-weight: bold;">Image</label>
                                                    <input type="file" 
                                                           class="form-control" 
                                                           id="productImage" 
                                                           name="productImage" 
                                                           required style="display: block; width: 100%; padding: .375rem .75rem; line-height: 1.5; color: #495057; background-color: #fff; border: 1px solid #ced4da; border-radius: .25rem;" />
                                                </div>
                                                <input type="hidden" id="adminId" name="adminId" value="<%=admin.getAdminId()%>" />
                                                
                                                <div class="modal-footer d-flex justify-content-between" 
                                                     style="display: flex; justify-content: space-between; align-items: center;">
                                                    <button type="submit" 
                                                            class="btn btn-primary" 
                                                            name="action" 
                                                            onclick="return confirm('Add this product ?')" 
                                                            value="addProduct" 
                                                            style="margin: 5px;">
                                                        Add
                                                    </button>
                                                    <a href="AdminDashboard.jsp" 
                                                       class="btn btn-danger" 
                                                       style="margin: 5px;">
                                                        Cancel
                                                    </a>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- content-wrapper ends -->
                        <!-- partial:partials/_footer.html -->
                        <footer class="footer mt-5">
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

            <script>
                                        // JavaScript to control visibility of rows when buttons are clicked
                                        document.addEventListener("DOMContentLoaded", function () {
                                            var rows = document.getElementsByClassName("data-row");
                                            var showMoreBtn = document.getElementById("showMoreBtn");
                                            var hideBtn = document.getElementById("hideBtn");

                                            // Show more rows
                                            showMoreBtn.addEventListener("click", function () {
                                                for (var i = 3; i < rows.length; i++) {
                                                    rows[i].style.display = "table-row";
                                                }
                                                showMoreBtn.style.display = "none";
                                                hideBtn.style.display = "block";
                                            });

                                            // Hide extra rows
                                            hideBtn.addEventListener("click", function () {
                                                for (var i = 3; i < rows.length; i++) {
                                                    rows[i].style.display = "none";
                                                }
                                                showMoreBtn.style.display = "block";
                                                hideBtn.style.display = "none";
                                            });
                                        });
            </script>
    </body>
</html>
