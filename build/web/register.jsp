<%-- 
    Document   : login
    Created on : 26 Oct 2024, 3:01:49 pm
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
        <title>Register</title>

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
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="about.jsp">About</a></li>
                                <li><a href="shop.jsp">Shop</a></li>
                                <li><a href="contact.jsp">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Register Section Begin -->
        <section class="about spad" style="margin-top: -30px;">
            <div class="container">
                <div class="about__text" style="background-color: #ffffff; padding: 50px; border-radius: 10px; max-width: 60%; width: 100%; margin: 0 auto;">
                    <div class="text-center">
                        <span style="color: #f08632; font-size: 28px; font-weight: bold;">Register</span>
                    </div>
                    <div>
                        <div class="text-center text-md">
                            <span style="color:red; font-size: 17px">${error}</span>
                        </div>

                        <form action="<%=request.getContextPath()%>/CustomerController" method="POST" onsubmit="javascript:alert('Account Successfully Registered');">
                            <div>
                                <input type="text" placeholder="Name" name="customerName" required="" style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px; margin-top: 10px;">
                            </div>
                            <div class="mt-3">
                                <input type="tel" placeholder="Phone Number" name="customerPhone" required="" style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px;">
                                <p style="margin-left: 10px; color: grey;" align="left">* Enter Phone Number without dashes (-), for example: 0169242601</p>
                            </div>

                            <div class="mt-3">
                                <input type="text" placeholder="Address" name="customerAddress" required="" style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px;">
                            </div>

                            <div class="mt-3">
                                <input type="text" placeholder="ZIP Code" name="customerZip" required="" style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px;">
                            </div>

                            <div class="mt-3">
                                <input type="text" placeholder="State" name="customerState" required="" style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px;">
                            </div>

                            <div class="mt-3">
                                <input type="email" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                       placeholder="Email" name="customerEmail" required="" style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px;">
                                <p style="margin-left: 10px; color: grey;" align="left">* Example : customer123@gmail.com</p>
                            </div>

                            <div class="mt-3">
                                <input type="password" 
                                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                       title="Must contain at least one number, one uppercase letter, and one lowercase letter, and be at least 8 characters long."
                                       placeholder="Password" 
                                       name="customerPassword" 
                                       Id="customerPassword"
                                       required="" 
                                       style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px;">
                            </div>

                            <div class="mt-3">
                                <input type="password" 
                                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                       title="Must contain at least one number, one uppercase letter, and one lowercase letter, and be at least 8 characters long."
                                       placeholder="Confirm Password" 
                                       name="ConfirmPassword" 
                                       Id="ConfirmPassword"
                                       required="" 
                                       style="width: 100%; padding: 10px; border-radius: 5px; border: 2px solid #f08632; font-size: 16px;">
                            </div>

                            <div class="text-center mt-3">
                                <a href="login.jsp" style="color: #3A3A3A; text-decoration: none; font-weight: bold; transition: color 0.3s;" onmouseover="this.style.color = 'blue'" onmouseout="this.style.color = '#3A3A3A'">Already have an account? Login Here</a>
                            </div>

                            <div class="text-center mt-3">
                                <button class="btn btn-warning w-50 py-3" 
                                        name="action" 
                                        value="register" 
                                        type="submit" 
                                        style="color: white; font-weight: bold; border: none; border-radius: 5px;"
                                        onclick="return Validate()">REGISTER</button>
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
                                    <li><a href="PrivacyPolicy.jsp">Privacy Policy</a></li>
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

        <script>
                                    function Validate() {
                                        var password = document.getElementById("customerPassword").value;
                                        var confirmPassword = document.getElementById("ConfirmPassword").value;
                                        if (password !== confirmPassword) {
                                            alert("Passwords Do Not Match.");
                                            return false;
                                        }
                                        return true;
                                    }
        </script>
    </body>
</html>