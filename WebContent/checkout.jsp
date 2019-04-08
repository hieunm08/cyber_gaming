<%@page import="model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%
		Users users = (Users) session.getAttribute("user");
		if(users==null){
			response.sendRedirect("login.jsp");
		}
	
	%>
	<jsp:include page="header.jsp"></jsp:include>
		
	<div class="container_fullwidth">
        <div class="container">
          <div class="row">
            <div class="col-md-3">
              <div class="special-deal leftbar" style="margin-top:0;">
                <h4 class="title">
                  Special 
                  <strong>
                    Deals
                  </strong>
                </h4>
                <div class="special-item">
                  <div class="product-image">
                    <a href="details.html">
                      <img src="images/products/thum/products-01.png" alt="">
                    </a>
                  </div>
                  <div class="product-info">
                    <p>
                      <a href="details.html">
                        Licoln Corner Unit
                      </a>
                    </p>
                    <h5 class="price">
                      $300.00
                    </h5>
                  </div>
                </div>
                <div class="special-item">
                  <div class="product-image">
                    <a href="details.html">
                      <img src="images/products/thum/products-02.png" alt="">
                    </a>
                  </div>
                  <div class="product-info">
                    <p>
                      <a href="details.html">
                        Licoln Corner Unit
                      </a>
                    </p>
                    <h5 class="price">
                      $300.00
                    </h5>
                  </div>
                </div>
                <div class="special-item">
                  <div class="product-image">
                    <a href="details.html">
                      <img src="images/products/thum/products-03.png" alt="">
                    </a>
                  </div>
                  <div class="product-info">
                    <p>
                      <a href="details.html">
                        Licoln Corner Unit
                      </a>
                    </p>
                    <h5 class="price">
                      $300.00
                    </h5>
                  </div>
                </div>
              </div>
              <div class="product-tag leftbar">
                <h3 class="title">
                  Products 
                  <strong>
                    Tags
                  </strong>
                </h3>
                <ul>
                  <li>
                    <a href="#">
                      Lincoln us
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      SDress for Girl
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Corner
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Window
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      PG
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Oscar
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Bath room
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      PSD
                    </a>
                  </li>
                </ul>
              </div>
              <div class="get-newsletter leftbar">
                <h3 class="title">
                  Get 
                  <strong>
                    newsletter
                  </strong>
                </h3>
                <p>
                  Casio G Shock Digital Dial Black.
                </p>
                <form>
                  <input class="email" type="text" name="" placeholder="Your Email...">
                  <input class="submit" type="submit" value="Submit">
                </form>
              </div>
              <div class="fbl-box leftbar">
                <h3 class="title">
                  Facebook
                </h3>
                <span class="likebutton">
                  <a href="#">
                    <img src="images/fblike.png" alt="">
                  </a>
                </span>
                <p>
                  12k people like Flat Shop.
                </p>
                <ul>
                  <li>
                    <a href="#">
                    </a>
                  </li>
                  <li>
                    <a href="#">
                    </a>
                  </li>
                  <li>
                    <a href="#">
                    </a>
                  </li>
                  <li>
                    <a href="#">
                    </a>
                  </li>
                  <li>
                    <a href="#">
                    </a>
                  </li>
                  <li>
                    <a href="#">
                    </a>
                  </li>
                  <li>
                    <a href="#">
                    </a>
                  </li>
                  <li>
                    <a href="#">
                    </a>
                  </li>
                </ul>
                <div class="fbplug">
                  <a href="#">
                    <span>
                      <img src="images/fbicon.png" alt="">
                    </span>
                    Facebook social plugin
                  </a>
                </div>
              </div>
            </div>
            <div class="col-md-9">
              <div class="checkout-page">
                <ol class="checkout-steps">
                  <li class="steps">
                    <div class="step-title">
                     <a href="login.jsp" >
                      01. checkout opition
                      </a>
                    </div>
                  </li>
                  <li class="steps active">
                    <a href="checkout.jsp" class="step-title">
                      02. billing information
                    </a>
                    <div class="step-description">
                    
                      <form action="checkout" method="POST">
                        <div class="row">
                          <div class="col-md-6 col-sm-6">
                            <div class="your-details">
                              <h5>
                                Your Persional Details
                              </h5>
                              <div class="form-row">
                                <label class="lebel-abs">
                                  Full Name 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="text" class="input namefild" name="receiver">
                              </div>
                              <div class="form-row">
                                <label class="lebel-abs">
                                  Email 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="text" class="input namefild" name="email">
                              </div>
                              <div class="form-row">
                                <label class="lebel-abs">
                                  Telephone 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="text" class="input namefild" name="phone">
                              </div>
                              <p>
                                <span class="input-radio">
                                  <input type="radio" name="user">
                                </span>
                                <span class="text">
                                  I wish to subscribe to the Herbal Store newsletter.
                                </span>
                              </p>
                              <p>
                                <span class="input-radio">
                                  <input type="radio" name="user">
                                </span>
                                <span class="text">
                                  My delivery and billing addresses are the same.
                                </span>
                              </p>
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-6">
                            <div class="your-details">
                              <h5>
                                Your Address
                              </h5>
                              <div class="form-row">
                                <label class="lebel-abs">
                                  Address 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="text" class="input namefild" name="address">
                              </div>
                             <div class="form-group">
                                            <label class="lebel-abs">Payment</label>
                                            
                                            <select name="payment">
                                                <option>Cash</option>
                                                <option>Credit Card</option>
                                            </select>
                                        </div>
                              <div class="form-row">
                                <label class="lebel-abs">
                                  Note 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="text" class="input namefild" name="note">
                              <p class="privacy">
                                <span class="input-radio">
                                  <input type="radio" name="user">
                                </span>
                                <span class="text">
                                  I have read and agree to the 
                                  <a href="#" class="red">
                                    Privacy Policy
                                  </a>
                                </span>
                              </p>
                              <button type="submit">
                                Continue
                              </button>
                            </div>
                          </div>
                        </div>
                      </form>
                      
                      
                    </div>
                  </li>
                  <li class="steps">
                    <a href="checkout2.html" class="step-title">
                      03. Shipping information
                    </a>
                  </li>
                  <li class="steps">
                    <a href="#" class="step-title">
                      04. shipping method 
                    </a>
                  </li>
                  <li class="steps">
                    <a href="#" class="step-title">
                      05. payment information 
                    </a>
                  </li>
                  <li class="steps">
                    <a href="#" class="step-title">
                      06. oder review
                    </a>
                  </li>
                </ol>
              </div>
            </div>
          </div>
          <div class="clearfix">
          </div>
          <div class="our-brand">
            <h3 class="title">
              <strong>
                Our 
              </strong>
              Brands
            </h3>
            <div class="control">
              <a id="prev_brand" class="prev" href="#" style="display: block;">
                &lt;
              </a>
              <a id="next_brand" class="next" href="#" style="display: block;">
                &gt;
              </a>
            </div>
            <div class="caroufredsel_wrapper" style="display: block; text-align: start; float: left; position: relative; top: auto; right: auto; bottom: auto; left: auto; z-index: auto; width: 1140px; height: 97px; margin: 0px; overflow: hidden;"><ul id="braldLogo" style="text-align: left; float: none; position: absolute; top: 0px; right: auto; bottom: auto; left: 0px; margin: 0px; width: 5700px; height: 97px;">
              <li style="width: 1140px;">
                <ul class="brand_item">
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/envato.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/themeforest.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/photodune.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/activeden.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/envato.png" alt="">
                      </div>
                    </a>
                  </li>
                </ul>
              </li>
              <li style="width: 1140px;">
                <ul class="brand_item">
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/envato.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/themeforest.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/photodune.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/activeden.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/envato.png" alt="">
                      </div>
                    </a>
                  </li>
                </ul>
              </li>
            </ul></div>
          </div>
        </div>
      </div>

	<jsp:include page="footer.jsp"></jsp:include>