<%-- 
    Document   : ProfileCustomer
    Created on : 27 Oct 2024, 11:43:51 pm
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
        <title>Profile | Customer</title>

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

        <link rel="icon" href="/img/logoIcon.png" type="image/x-icon"/>
        <!--<!-- SweetAlert2 Library -->
        <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
        <!-- SweetAlert2 JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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

        <!-- Profile Section Begin -->
        <section class="about spad" style="margin-top: -30px;">
            <div class="container">
                <div class="about__text" style="background-color: #ffffff; padding: 50px; border-radius: 10px; max-width: 60%; width: 100%; margin: 0 auto;">
                    <div class="text-center">
                        <span style="color: #f08632; font-size: 28px; font-weight: bold;">Profile</span>
                    </div>
                    <div>
                        <div class="text-center text-md">
                            <span style="color:red; font-size: 17px">${error}</span>
                        </div>

                        <form action="CustomerController" 
                              method="POST" 
                              onsubmit="javascript:alert('Account Successfully Updated');">
                            <div>
                                <input type="text" 

                                       placeholder="Name" 
                                       name="customerName" 
                                       value="<%=customer.getCustomerName()%>" 
                                       style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px; margin-top: 10px;">
                            </div>
                            <div class="mt-3">
                                <input type="text" 
                                       pattern="[0-9]{10,11}"
                                       placeholder="Phone Number" 
                                       name="customerPhone" 
                                       value="<%=customer.getCustomerPhone()%>" 
                                       style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px;">
                                <p style="margin-left: 10px; color: grey;" align="left">* Phone Number without dashes (-), for example: 0169242601</p>
                            </div>

                            <div class="mt-3">
                                <input type="text" 
                                       placeholder="Address" 
                                       name="customerAddress" 
                                       value="<%=customer.getCustomerAddress()%>"
                                       style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px;">
                            </div>

                            <div class="mt-3">
                                <input type="text" 
                                       placeholder="ZIP Code" 
                                       pattern="[0-9]{5}"
                                       name="customerZip" 
                                       value="<%=customer.getCustomerZip()%>"
                                       style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px;">
                            </div>

                            <div class="mt-3">
                                <input type="text" 
                                       placeholder="State" 
                                       name="customerState" 
                                       value="<%=customer.getCustomerState()%>"
                                       style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px;">
                            </div>

                            <div class="mt-3">
                                <input type="email" 
                                       pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                       placeholder="Email" 
                                       name="customerEmail" 
                                       value="<%=customer.getCustomerEmail()%>"
                                       style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px;">
                                <p style="margin-left: 10px; color: grey;" align="left">* Example : customer123@gmail.com</p>
                            </div>

                            <div class="mt-3">
                                <input type="password" 
                                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                       title="Must contain at least one number, one uppercase letter, and one lowercase letter, and be at least 8 characters long."
                                       placeholder="Password" 
                                       name="customerPassword" 
                                       Id="customerPassword"
                                       value="<%=customer.getCustomerPassword()%>"
                                       style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px;">
                            </div>

                            <div class="text-center mt-5" style="display: flex; justify-content: center; gap: 20px;">
                                <button class="btn btn-primary py-3" 
                                        name="action" 
                                        value="update" 
                                        type="submit" 
                                        style="color: white; font-weight: bold; border: none; border-radius: 5px; width: 30%;"
                                        onclick="return confirm('Are you sure to update this profile ?')">
                                    Update
                                </button>
<!--                                <button class="btn btn-danger py-3" 
                                        name="action" 
                                        value="delete" 
                                        type="submit" 
                                        style="color: white; font-weight: bold; border: none; border-radius: 5px; width: 30%;"
                                        onclick="return confirm('Are you sure to deactive this account ?')">
                                    Deactivate
                                </button>-->

                                <input name="customerId" type="hidden" value="<%=customer.getCustomerId()%>">

                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Register Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer set-bg" data-setbg="img/footer-bg.jpg">
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
                                All rights reserved | The Cake Cottage CCSD
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
        <script src="js/script.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
