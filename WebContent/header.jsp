<%@page import="java.util.Map"%>
<%@page import="model.Users"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page import="model.Cart"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="model.Item"%>
<%@page import="java.text.DecimalFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
      <meta name="description" content="">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="shortcut icon" href="images/favicon.png">
      <title>Welcome to FlatShop</title>
      <link href="css/bootstrap.css" rel="stylesheet">
      <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
      <link href="css/font-awesome.min.css" rel="stylesheet">
      <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
      <link href="css/sequence-looptheme.css" rel="stylesheet" media="all"/>
      <link href="css/style.css" rel="stylesheet">
      <link href="css/bosung.css" rel="stylesheet">
      <link href="css/bosung1.css" rel="stylesheet">
      <style type="text/css">
      .error {
    		color: red;
		}
      </style>
   </head>
<body >
	
	<%
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		CategoryDAO categoryDAO = new CategoryDAO();
		Users users = null;
		if(session.getAttribute("user") != null){
			users = (Users) session.getAttribute("user");
		}
		
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart == null){
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	
	%>



	<div class="header" ">
            <div class="container">
               <div class="row">
                  <div class="col-md-2 col-sm-2">
                     <div class="logo"><a href="index.jsp"><img src="images/logo.png" alt="FlatShop"></a></div>
                  </div>
                  <div class="col-md-10 col-sm-10">
                     <div class="header_top">
                        <div class="row">
                           <div class="col-md-3">
                              <ul class="option_nav">
                                 <li class="dorpdown">
                                    <a href="#">Eng</a>
                                    <ul class="subnav">
                                       <li><a href="#">Eng</a></li>
                                       <li><a href="#">Vns</a></li>
                                       <li><a href="#">Fer</a></li>
                                       <li><a href="#">Gem</a></li>
                                    </ul>
                                 </li>
                                 <li class="dorpdown">
                                    <a href="#">USD</a>
                                    <ul class="subnav">
                                       <li><a href="#">USD</a></li>
                                       <li><a href="#">UKD</a></li>
                                       <li><a href="#">FER</a></li>
                                    </ul>
                                 </li>
                              </ul>
                           </div>
                           <div class="col-md-6">
                              <ul class="topmenu">
                              <%if(users != null){ %>
                                 <li><a href="bill.jsp"> Đơn Mua</a></li>
                                 <%}else %>
                                  <li><a href="#"> About us</a></li>
                                 <li><a href="#">News</a></li>
                                 <li><a href="#">Service</a></li>
                                 <li><a href="#">Recruiment</a></li>
                                 <li><a href="#">Media</a></li>
                              </ul>
                           </div>
                           <div class="col-md-3">
                              <ul class="usermenu">
                           		<%if(users != null) { %>
                                 <li><a href="#" class="log">Xin chào <%=users.getName()%></a></li>
                                 <li><a href="logout" class="reg">Logout</a></li>
                                 <% }else{ %>
                                 <li><a href="login.jsp" class="log">Login</a></li>
                                 <li><a href="register.jsp" class="reg">Register</a></li>
                                 <% } %>
                              </ul>
                           </div>
                        </div>
                     </div>
                     <div class="clearfix"></div>
                     <div class="header_bottom">
                        <ul class="option">
                           <li id="search" class="search">
                              <form action="search"><input class="search-submit" type="submit"  value=""><input class="search-input" placeholder="Enter your search term..." type="text" value="" name="productName"></form>
                           </li>
                           <li class="option-cart">
                              <a href="cart.jsp" class="cart-icon">cart <span class="cart_no"><%=cart.countItem() %></span></a>
                              <ul class="option-cart-item">
                                 <li>
                                 
                                 	<%for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {%>
                                    <div class="cart-item">
                                       <div class="image"><img src="<%=list.getValue().getProduct().getProductImage() %>" alt=""></div>
                                       <div class="item-description">
                                          <p class="name"><%=list.getValue().getProduct().getProductName() %></p>
                                          <p>Size: <span class="light-red">One size</span><br>Quantity: <span class="light-red"><%=list.getValue().getQuantity()%></span></p>
                                       </div>
                                       <div class="right">
                                          <p class="price"><%=formatter.format(list.getValue().getProduct().getPrice()) %>Đ</p>
                                          <a href="addCart?action=remove&productID=<%=list.getValue().getProduct().getProductID()%>" class="remove"><img src="images/remove.png" alt="remove"></a>
                                       </div>
                                    </div>
                                    
                                    <% } %>
                                 </li>
                                 <li><span class="total">Total <strong><%=formatter.format(cart.total()) %>đ</strong></span><button class="checkout" onclick="location.href='checkout.jsp'">CheckOut</button></li>
                              </ul>
                           </li>
                        </ul>
                        <div class="navbar-header"><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                        <div class="navbar-collapse collapse">
                           <ul class="nav navbar-nav">
                              <li class="active dropdown">
                                 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Danh Mục</a>
                                 <div class="dropdown-menu">
                                    <ul class="mega-menu-links">
                                    	<%
                                    		for (Category c : categoryDAO.getListCategory())  {
                                    	%>
                                       <li><a href="product.jsp?categoryID=<%=c.getCategoryID()%>&pages=1"><%= c.getCategoryName()%></a></li>
                                       <%
                                    		}
                                       %>
                                    </ul>
                                 </div>
                              </li>
                              <li><a href="product.jsp?category=1">men</a></li>
                              <li><a href="product.jsp?category=2">women</a></li>
                              <li class="dropdown">
                                 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Fashion</a>
                                 <div class="dropdown-menu mega-menu">
                                    <div class="row">
                                       <div class="col-md-6 col-sm-6">
                                          <ul class="mega-menu-links">
                                             <li><a href="productgird.html">New Collection</a></li>
                                             <li><a href="productgird.html">Shirts &amp; tops</a></li>
                                             <li><a href="productgird.html">Laptop &amp; Brie</a></li>
                                             <li><a href="productgird.html">Dresses</a></li>
                                             <li><a href="productgird.html">Blazers &amp; Jackets</a></li>
                                             <li><a href="productgird.html">Shoulder Bags</a></li>
                                          </ul>
                                       </div>
                                       <div class="col-md-6 col-sm-6">
                                          <ul class="mega-menu-links">
                                             <li><a href="productgird.html">New Collection</a></li>
                                             <li><a href="productgird.html">Shirts &amp; tops</a></li>
                                             <li><a href="productgird.html">Laptop &amp; Brie</a></li>
                                             <li><a href="productgird.html">Dresses</a></li>
                                             <li><a href="productgird.html">Blazers &amp; Jackets</a></li>
                                             <li><a href="productgird.html">Shoulder Bags</a></li>
                                          </ul>
                                       </div>
                                    </div>
                                 </div>
                              </li>
                              <li><a href="productgird.html">gift</a></li>
                              <li><a href="productgird.html">kids</a></li>
                              <li><a href="contact.html">contact us</a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="clearfix"></div>
