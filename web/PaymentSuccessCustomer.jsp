<%-- 
    Document   : PaymentSuccessCustomer
    Created on : 6 Nov 2024, 10:24:51 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
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
        <title>Payment | Customer</title>

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
                            <h2>Payment</h2>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="breadcrumb__links">
                            <a href="HomePageCustomer.jsp">Home</a>
                            <span>Payment</span>
                        </div>
                    </div>
                </div>
                <div class="section-title">
                    <hr>
                </div> 
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- About Section Begin -->
        <div class="container">
    <div class="row">
        <div class="col-lg-10 col-md-6">
            <div class="about__text">
                <div class="section-title mb-0">
                    <span>Payment Success</span>
                </div>
                <p>Thank you for your purchase. Your payment has been processed successfully.</p>
                <div class="section-title mt-3 mb-5">
                    <button type="button" id="redirectButton" onclick="redirectToShop()">Redirect to Shop (8)</button>
                </div>
            </div>  
        </div>
    </div>
</div>

<script>
    let countdown = 10; // Set countdown time in seconds
    const button = document.getElementById("redirectButton");

    // Function to redirect to the specified page
    function redirectToShop() {
        window.location.href = "HomePageCustomer.jsp";
    }

    // Set the initial button text with countdown
    button.innerHTML = "Redirect to Shop (" + countdown + ")";

    // Update the button text every second
    const interval = setInterval(function() {
        countdown--;
        console.log("Countdown:", countdown); // Debugging log to check countdown in console
        button.innerHTML = "Redirect to Shop (" + countdown + ")"; // Update button text with countdown

        // Redirect when countdown reaches 0
        if (countdown <= 0) {
            clearInterval(interval); // Stop the interval
            redirectToShop();
        }
    }, 1000); // Update every 1 second

    // Allow manual redirect on button click before timer ends
    button.onclick = function() {
        clearInterval(interval); // Stop countdown if button is clicked
        redirectToShop();
    };
</script>



        <!-- About Section End -->



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