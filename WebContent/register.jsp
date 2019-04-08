<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
              
              
              
            </div>
            <div class="col-md-9">
              <div class="checkout-page">
                <ol class="checkout-steps">
                  <li class="steps active">
                    <a href="checkout.html" class="step-title">
                      01. checkout opition
                    </a>
                    <div class="step-description">
                      <div class="row">
                        <div class="col-md-6 col-sm-6">
                          <div class="run-customer">
                            <h5>
                              Register
                            </h5>
                             <span style="color: red">${message}</span>
                             
                            <form id="rf" action="register" method="POST">
                            <div class="form-row">
                                <label class="lebel-abs">
                                  Name 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="text" class="input namefild" name="fullname">
                              </div>
                              <div class="form-row">
                                <label class="lebel-abs">
                                  Username 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="text" class="input namefild" name="username">
                              </div>
                              <div class="form-row">
                                <label class="lebel-abs">
                                  Password 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="password" id="password" class="input namefild" name="password">
                              </div>
                               <div class="form-row">
                                <label class="lebel-abs">
                                  Re Password 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="password" id="repassword" class="input namefild" name="repassword">
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
                              <div class="form-row">
                                <label class="lebel-abs">
                                  Email 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="text" class="input namefild" name="email">
                              </div>
                               <button type="submit">
                               Register
                              </button>
                            </form>
                            
                          </div>
                        </div>
                      </div>
                    </div>
                  </li>
                    			
                  <li class="steps">
                    <a href="checkout2.html" class="step-title">
                      02. billing information
                    </a>
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
      							 <script type="text/javascript" src="js/script.min.js" ></script>
      							 <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
      							 <script type="text/javascript" src="js/jquery.validate.min.js"></script>
                                
                                <script type="text/javascript">
                               /*  jQuery.validator.setDefaults({
                                	  debug: true,
                                	  success: "valid"
                                	});
                                	$( "#rf" ).validate({
                                	  rules: {
                                	    password: "required",
                                	    repassword: {
                                	      equalTo: "#password"
                                	    }
                                	  }
                                	}); */
                                 $(document).ready(function() {

                            		//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
                            		$("#rf").validate({
                            			rules: {
                            				fullname: "required",
                            				username: "required",
                            				password: "required",
                            				repassword: "required",
                            				repassword: {
                            					equalTo: "#password"
                            				}
                            			},
                            			messages: {
                            				fullname: "Vui lòng nhập tên của bạn!",
                            				username: "Vui lòng nhập tài khoản",
                            				password: "Vui lòng nhập mật khẩu!",
                            				repassword: "Vui lòng nhập lại mật khẩu",
                            				repassword: "mật khẩu không trùng khớp!"
                            			}
                            		});
                            	}); 
                                
                               </script>               
	
	<jsp:include page="footer.jsp"></jsp:include>
