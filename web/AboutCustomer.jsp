<%-- 
    Document   : AboutCustomer
    Created on : 27 Oct 2024, 11:04:41 pm
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
        <title>About | Customer</title>

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
                            <h2>About</h2>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="breadcrumb__links">
                            <a href="HomePageCustomer.jsp">Home</a>
                            <span>About</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- About Section Begin -->
        <section class="about spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="about__video set-bg" data-setbg="img/about-video.jpg">
                            <a href="https://www.youtube.com/watch?v=HX8QW9zNOqw"
                               class="play-btn video-popup"><i class="fa fa-play"></i></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="about__text">
                            <div class="section-title">
                                <span>About The Cake Cottage</span>
                                <h2>Cakes and bakes from the house of Queens!</h2>
                            </div>
                            <p>The Cake Cottage is in the business of making the world a better place with reliable, 
                                free same-day cake deliveries from your favourite local bakeries.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="about__bar">
                            <div class="about__bar__item">
                                <p>Cake design</p>
                                <div id="bar1" class="barfiller">
                                    <div class="tipWrap"><span class="tip"></span></div>
                                    <span class="fill" data-percentage="95"></span>
                                </div>
                            </div>
                            <div class="about__bar__item">
                                <p>Cake Class</p>
                                <div id="bar2" class="barfiller">
                                    <div class="tipWrap"><span class="tip"></span></div>
                                    <span class="fill" data-percentage="80"></span>
                                </div>
                            </div>
                            <div class="about__bar__item">
                                <p>Cake Recipes</p>
                                <div id="bar3" class="barfiller">
                                    <div class="tipWrap"><span class="tip"></span></div>
                                    <span class="fill" data-percentage="90"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About Section End -->

        <!-- Testimonial Section Begin -->
        <section class="testimonial spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="section-title">
                            <span>Testimonial</span>
                            <h2>Our client say</h2>
                        </div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="testimonial__slider owl-carousel">
                        <div class="col-lg-6"> <!--1-->
                            <div class="testimonial__item">
                                <div class="testimonial__author">
                                    <div class="testimonial__author__pic">
                                        <img src="img/testimonial/adiputra.jpg" alt="">
                                    </div>
                                    <div class="testimonial__author__text">
                                        <h5>Adi Putra</h5>
                                        <span>Kuala Lumpur</span>
                                    </div>
                                </div>
                                <div class="rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <p>Absolutely delicious! The cake was moist, flavorful, and beautifully decorated. 
                                    Perfect for any celebration.</p>
                            </div>
                        </div>
                        <div class="col-lg-6"> <!--2-->
                            <div class="testimonial__item">
                                <div class="testimonial__author">
                                    <div class="testimonial__author__pic">
                                        <img src="img/testimonial/Nora.jpeg" alt="">
                                    </div>
                                    <div class="testimonial__author__text">
                                        <h5>Nora Danish</h5>
                                        <span>Terengganu</span>
                                    </div>
                                </div>
                                <div class="rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <p>The cake exceeded all expectations! Just the right level of sweetness. Will definitely order again!.</p>
                            </div>
                        </div>
                        <div class="col-lg-6"> <!--3-->
                            <div class="testimonial__item">
                                <div class="testimonial__author">
                                    <div class="testimonial__author__pic">
                                        <img src="img/testimonial/izzue.jpg" alt="">
                                    </div>
                                    <div class="testimonial__author__text">
                                        <h5>Izzue Islam</h5>
                                        <span>Kelantan</span>
                                    </div>
                                </div>
                                <div class="rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <p>Perfect balance of flavors! Loved every bite, 
                                    and the presentation was stunning. Highly recommended!.</p>
                            </div>
                        </div>
                        <div class="col-lg-6"> <!--4-->
                            <div class="testimonial__item">
                                <div class="testimonial__author">
                                    <div class="testimonial__author__pic">
                                        <img src="img/testimonial/fattah amin.jpg" alt="">
                                    </div>
                                    <div class="testimonial__author__text">
                                        <h5>Fattah Amin</h5>
                                        <span>Kuala Lumpur</span>
                                    </div>
                                </div>
                                <div class="rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <p>Incredible taste and texture! It was the star of our party and everyone loved it. Will be back for more!</p>
                            </div>
                        </div>
                        <div class="col-lg-6"> <!--5-->
                            <div class="testimonial__item">
                                <div class="testimonial__author">
                                    <div class="testimonial__author__pic">
                                        <img src="img/testimonial/syafiq.jpeg" alt="">
                                    </div>
                                    <div class="testimonial__author__text">
                                        <h5>Syafiq Kyle</h5>
                                        <span>Kuala Lumpur</span>
                                    </div>
                                </div>
                                <div class="rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <p>Best cake I've had in a long time! Soft, moist, and the frosting was perfection. Made our day extra special!</p>
                            </div>
                        </div>
                        <div class="col-lg-6"> <!--6-->
                            <div class="testimonial__item">
                                <div class="testimonial__author">
                                    <div class="testimonial__author__pic">
                                        <img src="img/testimonial/mimilana.jpeg" alt="">
                                    </div>
                                    <div class="testimonial__author__text">
                                        <h5>Mimilana</h5>
                                        <span>Perak</span>
                                    </div>
                                </div>
                                <div class="rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <p>Superb quality and taste! The cake looked amazing and was a hit with everyone. Couldn’t ask for more!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonial Section End -->

        <!-- Team Section Begin -->
        <section class="team spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-7 col-sm-7">
                        <div class="section-title">
                            <span>Our team</span>
                            <h2>Sweet Baker </h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="team__item set-bg" data-setbg="img/team/shuk123.jpg">
                            <div class="team__item__text">
                                <h6>Shukry Aiman</h6>
                                <span>Chef</span>
                                <div class="team__item__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-youtube-play"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="team__item set-bg" data-setbg="img/team/Dahlia.jpg">
                            <div class="team__item__text">
                                <h6>Dahlia Abd Razak</h6>
                                <span>Asisstant Chef</span>
                                <div class="team__item__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-youtube-play"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="team__item set-bg" data-setbg="img/team/alya.jpg">
                            <div class="team__item__text">
                                <h6>Alya Maisarah</h6>
                                <span>Decorater</span>
                                <div class="team__item__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-youtube-play"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="team__item set-bg" data-setbg="img/team/rais.jpg">
                            <div class="team__item__text">
                                <h6>Rais Hamizan</h6>
                                <span>Asisstant Decorater</span>
                                <div class="team__item__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-youtube-play"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Team Section End -->

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
    </body>

</html>