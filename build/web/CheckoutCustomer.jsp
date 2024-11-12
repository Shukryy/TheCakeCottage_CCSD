<%-- 
    Document   : CheckoutCustomer
    Created on : 7 Nov 2024, 4:27:10 pm
    Author     : User
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.*"%>
<%@page import="connection.DbCon"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Cake Template">
        <meta name="keywords" content="Cake, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Checkout | Customer</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/barfiller.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <%
            int customerId = 0;
            if (request.getParameter("customerId") != null) {
                customerId = Integer.parseInt(request.getParameter("customerId"));
            }

            CustomerDao customerDao = new CustomerDao();
            Customer customer = (Customer) request.getSession().getAttribute("customer");
        %>

    </head>

    <body>

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="header__top__inner">
                                <div class="header__logo" style="position: absolute; left: 53%; top: 50%; transform: translate(-50%, -50%);">
                                    <a href="index.jsp"><img src="img/logo4.png" alt="" width="200" height="79"></a>
                                </div>
                                <div class="header__top__right">
                                    <div class="header__top__right__links">
                                        <a href="ProfileCustomer.jsp">
                                            <img src="img/icon/profile.png" alt="" style="width: 45px; height: 45px; object-fit: contain;">
                                        </a>
                                    </div>
                                    <div class="header__top__right__cart">
                                        <a onclick="location.href = '<%=request.getContextPath()%>/CustomerController?action=signout'" value="Logout">
                                            <img src="img/icon/logout.png" alt="" style="width: 50px; height: 49px; object-fit: contain;">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="canvas__open"><i class="fa fa-bars"></i></div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="HomePageCustomer.jsp">Home</a></li>
                                <li><a href="AboutCustomer.jsp">About</a></li>
                                <li><a href="ShopCustomer.jsp">Shop</a></li>
                                <li><a href="ContactCustomer.jsp">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="breadcrumb__text">
                            <h2>Checkout</h2>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="breadcrumb__links">
                            <a href="HomePageCustomer.jsp">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
                <div class="section-title">
                    <hr>
                </div> 
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Checkout Customer Section Begin -->
        <div class="container">
            <div class="row">
                <%
                    CartDao cartDao = new CartDao();
                    List<Cart> listCart = cartDao.getAllCart();
                    for (Cart cart : listCart) {
                %>
                <div class="col-lg-10 col-md-6">
                    <div class="container" style="font-family: Arial, sans-serif; max-width: 600px; margin: 10px; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background-color: #f9f9f9;">
                        <div class="about__text" style="text-align: center;">
                            <div class="section-title mb-0" style="font-size: 1.5em; color: #333; margin-bottom: 20px;">
                                <span>Order Details</span>
                            </div>
                            <div class="order-details" style="text-align: left;">
                                <div class="order-detail-item" style="margin-bottom: 10px;">
                                    <strong style="color: #555;">Total Amount:</strong> <span id="totalAmount">RM <%= String.format("%.2f", cart.getCartTotalAmount())%></span>
                                </div>
                                <div class="order-detail-item" style="margin-bottom: 10px;">
                                    <strong style="color: #555;">Customer Name:</strong> <span id="customerName"><%= customer.getCustomerName()%></span>
                                </div>
                                <div class="order-detail-item" style="margin-bottom: 10px;">
                                    <strong style="color: #555;">Cart ID:</strong> <span id="cartId"><%= cart.getCartId()%></span>
                                </div>
                                <div class="order-detail-item" style="margin-bottom: 10px;">
                                    <strong style="color: #555;">Date & Time:</strong> <span id="purchaseDateTime"><%= cart.getCartDateTime()%></span>
                                </div>
                                <div class="order-detail-item" style="margin-bottom: 10px;">
                                    <strong style="color: #555;">Item Details:</strong> 
                                    <span id="orderDetails"><br><%= cart.getCartDetail().replace(",", "<br>")%></span>
                                </div>
                            </div>

                            <!-- Hidden form to send payment data -->
                            <form id="paymentForm" method="POST" action="<%=request.getContextPath()%>/PaymentController">
                                <input type="hidden" name="paymentType" value="PayPal">
                                <input type="hidden" name="paymentStatus" value="Success">
                                <input type="hidden" name="cartTotalAmount" value="<%= cart.getCartTotalAmount()%>">
                                <input type="hidden" name="cartId" value="<%= cart.getCartId()%>">
                                <input type="hidden" name="customerId" value="<%= customer.getCustomerId()%>">                   
                            </form>

                            <!-- PayPal Button -->
                            <div class="section-title mt-3 mb-5" style="margin-top: 20px; margin-bottom: 20px;" id="paypal-button-container"></div>

                        </div>
                    </div>

                    <!-- PayPal SDK -->
                    <script src="https://www.paypal.com/sdk/js?client-id=AVRsgv_7-Dal72uH7M6wHiSBTAkwmSpdeeU3MXmbaqZCx30QECtAmGd7kee3_gwDgshnhnIqZeDjROGz&components=buttons&currency=MYR"></script>

                    <script>
                                            var total = <%= cart.getCartTotalAmount()%>;

                                            // Render the PayPal button
                                            paypal.Buttons({
                                                // Create the payment order
                                                createOrder: function (data, actions) {
                                                    return actions.order.create({
                                                        purchase_units: [{
                                                                amount: {
                                                                    value: total.toFixed(2),
                                                                    currency_code: 'MYR'
                                                                }
                                                            }]
                                                    });
                                                },

                                                // Handle the payment success
                                                onApprove: function (data, actions) {
                                                    return actions.order.capture().then(function (details) {
                                                        // After payment approval, redirect to PaymentController directly
                                                        window.location.href = "<%=request.getContextPath()%>/PaymentController?action=addPayment&paymentType=PayPal&paymentStatus=Success&cartTotalAmount=" + total + "&cartId=<%= cart.getCartId()%>&customerId=<%= customer.getCustomerId()%>";
                                                    });
                                                },

                                                // Handle payment error
                                                onError: function (err) {
                                                    alert('Payment Failed: ' + err);
                                                }
                                            }).render('#paypal-button-container');
                    </script>

                </div>
                <%
                    }
                %>
            </div>
        </div>
        <!-- Checkout Customer Section End -->


        <!-- Footer Section Begin -->
        <footer class="footer set-bg mt-5" data-setbg="img/footer-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="footer__widget">
                            <h6>WORKING HOURS</h6>
                            <ul>
                                <li>Monday - Friday: 08:00 am – 08:30 pm</li>
                                <li>Saturday: 10:00 am – 16:30 pm</li>
                                <li>Sunday: 10:00 am – 16:30 pm</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="index.jsp"><img src="img/footer1-logo.png" alt="" width="200" height="79"></a>
                            </div>
                            <p>Delicious cakes and pastries made with love and the finest ingredients.</p>
                            <div class="footer__social">
                                <a href="https://www.facebook.com/cakerush.malaysia/" target="_blank"><i class="fa fa-facebook"></i></a>
                                <a href="https://x.com/secretrecipemy_" target="_blank"><i class="fa fa-twitter"></i></a>
                                <a href="https://www.instagram.com/cakerush.my" target="_blank"><i class="fa fa-instagram"></i></a>
                                <a href="https://www.youtube.com/@cakerushmy" target="_blank"><i class="fa fa-youtube-play"></i></a>
                            </div>

                        </div>  
                    </div>
                    <div class="col-lg-4">
                        <div class="footer__newslatter">
                            <h6>Subscribe</h6>
                            <p>Get latest updates and offers.</p>
                            <form action="#">
                                <input type="text" placeholder="Email">
                                <button type="submit"><i class="fa fa-send-o"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7">
                            <p class="copyright__text text-white">
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                                All rights reserved | Cake CCSD
                            </p>
                        </div>
                        <div class="col-lg-5">
                            <div class="copyright__widget">
                                <ul>
                                    <li><a href="PrivacyPolicyCustomer.jsp">Privacy Policy</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                    <li><a href="https://maps.app.goo.gl/kT9BCcwxwjEnKW6T7" target="blank">Site Map</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.barfiller.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>


