<%-- 
    Document   : ShopCustomer
    Created on : 27 Oct 2024, 11:08:03 pm
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="dao.*"%>
<%@page import="model.*"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Cake Template">
        <meta name="keywords" content="Cake, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Shop | Customer</title>

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
        <div class="breadcrumb-option" style="position: relative;"> <!-- Added position relative here -->
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="breadcrumb__text">
                            <h2>Shop</h2>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="breadcrumb__links">
                            <a href="HomePageCustomer.jsp">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Shop Section Begin -->
        <section class="shop">
            <div class="container">
                <div id="cart-container" style="position: relative; display: inline-block; top: -50px; right: 55px; float: right;"> <!-- Changed float to right -->
                    <a href="#" onclick="openModal()">
                        <img src="img/icon/cart.png" alt="Cart" style="width: 30px; height: 30px; object-fit: contain;">
                        <span class="cart-count" id="cart-count" style="position: absolute; top: -10px; right: -10px; background: red; color: white; border-radius: 50%; padding: 2px 6px; font-size: 14px; width: 24px; height: 24px; display: flex; align-items: center; justify-content: center;">0</span>
                    </a>
                </div>

                <!-- Modal Structure -->
                <div id="cartModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.6); z-index: 1000;">
                    <div style="position: relative; margin: auto; top: 5%; width: 80%; max-width: 800px; background: #fff; padding: 20px; border-radius: 8px; max-height: 80%; overflow-y: auto;">
                        <!-- Close Button -->
                        <span onclick="closeModal()" style="position: absolute; top: 10px; right: 20px; cursor: pointer; font-size: 24px; padding: 10px;">&times;</span>

                        <!-- Breadcrumb Begin -->
                        <div class="breadcrumb-option" style="padding: 10px 0;">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="breadcrumb__text" style="display: flex; justify-content: space-between; align-items: center;">
                                    <h2 style="margin: 0; font-size: 40px;">Shopping Cart</h2>
                                </div>
                            </div>
                        </div>

                        <!-- Shopping Cart Section Begin -->
                        <section style="padding: 20px 0;">
                            <form action="CartController" method="POST">
                                <div style="display: flex; gap: 20px;">
                                    <div style="flex: 3;">
                                        <div style="overflow-x: auto;">
                                            <table style="width: 100%; border-collapse: collapse;">
                                                <!-- Table Begin -->
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: left; padding: 10px; border-bottom: 1px solid #ddd;">Product</th>
                                                        <th style="text-align: left; padding: 10px; border-bottom: 1px solid #ddd;">Quantity</th>
                                                        <th style="text-align: left; padding: 10px; border-bottom: 1px solid #ddd;">Total</th>
                                                        <th style="text-align: left; padding: 10px; border-bottom: 1px solid #ddd;"></th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <!--function updateCartModal from Script below will print in here-->
                                                </tbody>
                                                <!-- Table End -->
                                            </table>
                                        </div>

                                        <div style="display: flex; justify-content: flex-end; padding-top: 40px;">

                                            <!-- Delivery details Start-->
                                            <div class="cart__total mr-4" style="border: 1px solid #ddd; padding: 20px; border-radius: 5px; width: 45%; display: flex; flex-direction: column;">
                                                <h6 style="margin-top: 0;">Delivery Details</h6>
                                                <hr style="margin: 10px 0;">
                                                <ul style="list-style: none; padding: 0; margin: 0; flex: 1;">
                                                    <li style="padding: 5px 0;">
                                                        <strong>Name:</strong>
                                                        <div><%= customer.getCustomerName()%></div>
                                                    </li>

                                                    <li style="padding: 5px 0;">
                                                        <strong>Phone No:</strong>
                                                        <div><%=customer.getCustomerPhone()%></div>
                                                    </li>
                                                    <li style="padding: 5px 0;">
                                                        <strong>Delivery Address:</strong>
                                                        <div><%= customer.getCustomerAddress()%>, <%= customer.getCustomerZip()%>, <%= customer.getCustomerState()%></div>
                                                    </li>

                                                </ul>
                                            </div>
                                            <!-- Delivery details End-->

                                            <!-- Total Cart Begin -->
                                            <div class="cart__total" style="border: 1px solid #ddd; padding: 20px; border-radius: 5px; width: 50%; display: flex; flex-direction: column;">
                                                <h6 style="margin-top: 0;">Cart total</h6>
                                                <hr style="margin: 10px 0;">
                                                <ul style="list-style: none; padding: 0; margin: 0; flex: 1;">
                                                    <li style="display: flex; justify-content: space-between; padding: 5px 0;">Subtotal<span id="subtotal">RM 0.00</span></li>
                                                    <li style="display: flex; justify-content: space-between; padding: 5px 0;">Service Tax (6%) <span id="serviceTax">RM 0.00</span></li>
                                                    <li style="display: flex; justify-content: space-between; padding: 5px 0;">Delivery Charge <span id="deliveryCharge">RM 7.00</span></li>
                                                    <hr style="margin: 10px 0;">
                                                    <li style="display: flex; justify-content: space-between; padding: 5px 0;" name="cartTotalAmount" ><strong>Total</strong><span id="total">RM 0.00</span></li>
                                                    <hr style="margin: 10px 0;">
                                                </ul>
                                                <button class="primary-btn"
                                                        name="action"
                                                        value="addCart" 
                                                        type="submit"
                                                        style="align-self: flex-end; margin-top: 10px; text-decoration: none;
                                                        padding: 10px 20px; border-radius: 4px; width: 50%;"
                                                        onclick="return confirm('Procced to Checkout ?')">
                                                    Proceed Checkout
                                                </button>
                                            </div>
                                            <!-- Total Cart End -->

                                            <%
                                                LocalDateTime now = LocalDateTime.now();
                                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  // Customize format as needed
                                                String formattedDateTime = now.format(formatter);
                                            %>

                                            <input name="cartTotalAmount" type="hidden" value="0.00">
                                            <input name="cartDateTime" type="hidden" value="<%= formattedDateTime%>">
                                            <input name="customerId" type="hidden" value="<%=customer.getCustomerId()%>">

                                        </div>
                                        <!-- Total Cart End -->
                                    </div>
                                </div>
                            </form> 
                        </section>
                        <!-- Shopping Cart Section End -->
                    </div>
                </div>

                <div class="row">
                    <%
                        ProductDao productDao = new ProductDao();
                        List<Product> listProduct = productDao.getAllProduct();
                        for (Product product : listProduct) {
                    %>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic">
                                <img
                                    src="/CCSD/imageDB/imageProduct.jsp?id=<%=product.getProductId()%>"
                                    alt="<%=product.getProductName()%>"
                                    style="width: 100%; height: auto; object-fit: cover;" /> <!-- Responsive image -->
                                <div class="product__label">
                                    <span><%=product.getProductCategory()%></span> <!--category-->
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#"><%=product.getProductName()%></a></h6> <!--item name-->
                                <div class="product__item__price">RM <%= String.format("%.2f", product.getProductPrice())%></div> <!--price-->
                                <div class="cart_add">
                                    <a href="#" class="add-to-cart" 
                                       data-product-id="<%= product.getProductId()%>" 
                                       data-product-name="<%= product.getProductName()%>" 
                                       data-product-price="<%= product.getProductPrice()%>" 
                                       data-product-image="/CCSD/imageDB/imageProduct.jsp?id=<%=product.getProductId()%>"
                                       onclick="addToCart('<%= product.getProductId()%>', '<%= product.getProductName()%>', <%= product.getProductPrice()%>, '/CCSD/imageDB/imageProduct.jsp?id=<%=product.getProductId()%>')">
                                        Add to cart
                                    </a>

                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </section>
        <!-- Shop Section End -->


        <!-- Footer Section Begin -->
        <footer class="footer set-bg mt-4" data-setbg="img/footer-bg.jpg">
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

        <script>
                                    // Object to keep track of the cart items
                                    let cartItems = {};
                                    let total = 0; // Declare a global variable to store the total amount

                                    document.addEventListener('DOMContentLoaded', (event) => {
                                        const cartCountElement = document.getElementById('cart-count');
                                        const addToCartButtons = document.querySelectorAll('.add-to-cart');

                                        addToCartButtons.forEach(button => {
                                            button.addEventListener('click', (event) => {
                                                event.preventDefault();
                                                const productId = event.target.getAttribute('data-product-id');
                                                const productName = event.target.getAttribute('data-product-name');
                                                const productPrice = parseFloat(event.target.getAttribute('data-product-price'));
                                                const productImage = event.target.getAttribute('data-product-image');

                                                console.log({productId, productName, productPrice, productImage});

                                                // Check if the item is already in the cart
                                                if (cartItems[productId]) {
                                                    cartItems[productId].quantity += 1;
                                                } else {
                                                    cartItems[productId] = {
                                                        name: productName,
                                                        price: productPrice,
                                                        image: productImage,
                                                        quantity: 1
                                                    };
                                                }

                                                updateCartCount();
                                                updateCartModal();
                                            });
                                        });

                                        function updateCartCount() {
                                            const itemCount = Object.keys(cartItems).length;
                                            cartCountElement.textContent = itemCount;
                                        }
                                    });

                                    function updateCartModal() {
                                        const cartBody = document.querySelector('#cartModal tbody');
                                        cartBody.innerHTML = ''; // Clear previous cart content

                                        let fullCartDetails = ''; // Variable to hold all cart item details

                                        console.log(cartItems); // Check cartItems data

                                        Object.keys(cartItems).forEach(productId => {
                                            const item = cartItems[productId];
                                            console.log(item); // Check item properties

                                            const totalPrice = item.price * item.quantity;

                                            let newRow = document.createElement('tr');
                                            newRow.setAttribute('data-product-id', productId);
                                            console.log(`Image: ${item.image}, Name: ${item.name}, Price: ${item.price}, Quantity: ${item.quantity}`);

                                            // Add the input for item name and quantity combined
                                            newRow.innerHTML = '<td style="padding: 10px; border-bottom: 1px solid #ddd;">' +
                                                    '<div style="display: flex; align-items: center;">' +
                                                    '<img src="' + item.image + '" alt="" style="width: 60px; margin-right: 10px;">' +
                                                    '<div>' +
                                                    '<h6 style="margin: 0;">' + item.name + '</h6>' +
                                                    '<p style="margin: 0;" class="product-price">RM ' + item.price.toFixed(2) + '</p>' +
                                                    '</div>' +
                                                    '</div>' +
                                                    '</td>' +
                                                    '<td style="padding: 10px; border-bottom: 1px solid #ddd;">' +
                                                    '<div style="display: flex; align-items: center; gap: 8px;">' +
                                                    '<button onclick="decreaseValue(this)" style="background: none; border: none; color: #333; font-size: 18px; cursor: pointer; padding: 5px;">&minus;</button>' +
                                                    '<span class="quantity-display" style="min-width: 20px; text-align: center; font-size: 16px;">' + item.quantity + '</span>' +
                                                    '<button onclick="increaseValue(this)" style="background: none; border: none; color: #333; font-size: 18px; cursor: pointer; padding: 5px;">&#43;</button>' +
                                                    '</div>' +
                                                    '</td>' +
                                                    '<td style="padding: 10px; border-bottom: 1px solid #ddd;" class="total-price">RM ' + totalPrice.toFixed(2) + '</td>' +
                                                    '<td style="padding: 10px; border-bottom: 1px solid #ddd;" class="cart__close">' +
                                                    '<span class="icon_close" style="cursor: pointer;" onclick="removeItem(\'' + productId + '\')"></span>' +
                                                    '</td>';

                                            cartBody.appendChild(newRow);

                                            // Add the item name and quantity to the fullCartDetails string
                                            fullCartDetails += item.name + ' x ' + item.quantity + ', ';
                                        });

                                        // Add the input field for all cart details (names and quantities combined)
                                        const fullCartInput = document.createElement('tr');
                                        fullCartInput.innerHTML = '<td colspan="5" style="padding: 10px; border-bottom: 1px solid #ddd;">' +
                                                '<input type="hidden" name="cartDetail" value="' + fullCartDetails.slice(0, -2) + '" style="width: 100%; padding: 5px;" readonly>' +
                                                '</td>';
                                        cartBody.appendChild(fullCartInput);

                                        updateCartTotal();
                                    }


                                    function increaseValue(button) {
                                        const row = button.closest('tr');
                                        const productId = row.getAttribute('data-product-id');
                                        cartItems[productId].quantity += 1;
                                        updateCartModal();
                                    }

                                    function decreaseValue(button) {
                                        const row = button.closest('tr');
                                        const productId = row.getAttribute('data-product-id');
                                        if (cartItems[productId].quantity > 1) {
                                            cartItems[productId].quantity -= 1;
                                        } else {
                                            delete cartItems[productId];
                                        }
                                        updateCartModal();
                                    }

                                    function removeItem(productId) {
                                        delete cartItems[productId];
                                        updateCartModal();
                                    }

                                    function updateCartTotal() {
                                        let subtotal = 0;

                                        Object.keys(cartItems).forEach(productId => {
                                            const item = cartItems[productId];
                                            subtotal += item.price * item.quantity;
                                        });

                                        const serviceTax = subtotal * 0.06;
                                        const deliveryCharge = 7.00;
                                        total = subtotal + serviceTax + deliveryCharge;

                                        document.getElementById("subtotal").textContent = "RM " + subtotal.toFixed(2);
                                        document.getElementById("serviceTax").textContent = "RM " + serviceTax.toFixed(2);
                                        document.getElementById("deliveryCharge").textContent = "RM " + deliveryCharge.toFixed(2);
                                        document.getElementById("total").textContent = "RM " + total.toFixed(2);

                                        document.querySelector('input[name="cartTotalAmount"]').value = total.toFixed(2);

                                    }

                                    function openModal() {
                                        document.getElementById('cartModal').style.display = 'block';
                                    }

                                    function closeModal() {
                                        document.getElementById('cartModal').style.display = 'none';
                                    }

                                    window.onclick = function (event) {
                                        var modal = document.getElementById('cartModal');
                                        if (event.target === modal) {
                                            closeModal();
                                        }
                                    };
        </script>






    </body>

</html>
