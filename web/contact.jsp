<%-- 
    Document   : contact
    Created on : 27 Oct 2024, 10:26:23 pm
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="dao.*"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Cake Template">
        <meta name="keywords" content="Cake, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>The Cake Cottage | Contact</title>

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
                                <div class="header__top__left">
                                    <ul>
                                        <li>
                                            <a href="login.jsp" id="loginLink">LOG IN</a>
                                        </li>
                                    </ul>
                                </div>
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

        <!-- Contact Section Begin -->
        <section class="contact spad">
            <div class="container">
                <div class="map">
                    <div class="container">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-4 col-md-7">
                                <div class="map__inner">
                                    <h6>The Cake Cottage</h6>
                                    <ul>
                                        <li>Ken 2 Damansara, Damansara Intan, 47400 Petaling Jaya, Selangor</li>
                                        <li>info@thecakecottage.my</li>
                                        <li>+60 111 700 0689</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="map__iframe">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3983.871170044961!2d101.62559007480904!3d3.128740096846759!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc479e1fc8c2a1%3A0x25aa4630770db5a5!2sCakesCrush!5e0!3m2!1sen!2smy!4v1730384444997!5m2!1sen!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
                <div class="contact__address">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="contact__address__item">
                                <h6>Selangor</h6>
                                <ul>
                                    <li>
                                        <span class="icon_pin_alt"></span>
                                        <p>Ken 2 Damansara, Damansara Intan, 47400 Petaling Jaya, Selangor</p>
                                    </li>
                                    <li><span class="icon_headphones"></span>
                                        <p>+60 111 700 0689</p>
                                    </li>
                                    <li><span class="icon_mail_alt"></span>
                                        <p>info@thecakecottage.my</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="contact__address__item">
                                <h6>Kuala Lumpur</h6>
                                <ul>
                                    <li>
                                        <span class="icon_pin_alt"></span>
                                        <p>Plaza Damas, B-0-5, 3, Jalan Sri Hartamas 1, 50480 Kuala Lumpur</p>
                                    </li>
                                    <li><span class="icon_headphones"></span>
                                        <p>+60 12 365 4142</p>
                                    </li>
                                    <li><span class="icon_mail_alt"></span>
                                        <p>info@thecakecottage.my</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="contact__address__item">
                                <h6>Pulau Pinang</h6>
                                <ul>
                                    <li>
                                        <span class="icon_pin_alt"></span>
                                        <p>19, Lebuh Melayu, George Town, 10100 George Town, Pulau Pinang</p>
                                    </li>
                                    <li><span class="icon_headphones"></span>
                                        <p>+60 19 825 0493</p>
                                    </li>
                                    <li><span class="icon_mail_alt"></span>
                                        <p>info@thecakecottage.my</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="contact__text">
                            <h3>Contact With us</h3>
                            <ul>
                                <li>Representatives or Advisors are available:</li>
                                <li>Mon-Fri: 5:00am to 9:00pm</li>
                                <li>Sat-Sun: 6:00am to 9:00pm</li>
                            </ul>
                            <img src="img/cake-piece.png" alt="">
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="contact__form">
                            <form action="#">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <input type="text" placeholder="Name">
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="text" placeholder="Email">
                                    </div>
                                    <div class="col-lg-12">
                                        <textarea placeholder="Message"></textarea>
                                        <button type="submit" class="site-btn">Send Us</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Contact Section End -->

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
    </body>

</html>
