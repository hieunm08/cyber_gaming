<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="model.Cart"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		DecimalFormat formatter = new DecimalFormat("###,###,###");
	
		ProductDAO productDAO = new ProductDAO();
		String categoryID = "";
		if(request.getParameter("category")!=null){
			categoryID = request.getParameter("category");
		}
		Cart cart =(Cart) session.getAttribute("cart");
		if(cart == null){
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	
	
	%>
    
	<div class="clearfix"></div>
	<div class="container_fullwidth">
            <div class="container">
               <div class="hot-products">
                  <h3 class="title"><strong>New</strong> Products</h3>
                  <div class="control"><a id="prev_hot" class="prev" href="#" style="display: block;">&lt;</a><a id="next_hot" class="next" href="#" style="display: block;">&gt;</a></div>
                  <div class="caroufredsel_wrapper" style="display: block; text-align: start; float: left; position: relative; top: auto; right: auto; bottom: auto; left: auto; z-index: auto; width: 1140px; height: 593px; margin: 0px; overflow: hidden;"><ul id="hot" style="text-align: left; float: none; position: absolute; top: 0px; right: auto; bottom: auto; left: 0px; margin: 0px; width: 5700px; height: 593px;">
                     <li style="width: 1140px;">
                        <div class="row">
                        
                        <%
                			for(Product p : productDAO.getListProductNews()) {
                
               			 %>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="offer">- %20</div>
                                 <div class="thumbnail"><a href="detail.jsp?product=<%=p.getProductID()%>"><img src="<%=p.getProductImage()%>" alt="<%=p.getProductName() %>" alt="Product Name"></a></div>
                                 <div class="productname"><%=p.getProductName() %></div>
                                 <h4 class="price"><%=formatter.format(p.getPrice())%> VNĐ</h4>
                                 <div class="button_group"><a href="addCart?action=add&productID=<%=p.getProductID()%>"><button class="button add-cart" type="button">Add To Cart</button></a><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                              </div>
                           </div>
                           
                           <% } %>
                           
                        </div>
                     </li>
                     <li style="width: 1140px;">
                        <div class="row">
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="offer">- %20</div>
                                 <div class="thumbnail"><a href="details.html"><img src="images/products/small/products-01.png" alt="Product Name"></a></div>
                                 <div class="productname">Iphone 5s Gold 32 Gb 2013</div>
                                 <h4 class="price">$451.00</h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                              </div>
                           </div>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="thumbnail"><a href="details.html"><img src="images/products/small/products-02.png" alt="Product Name"></a></div>
                                 <div class="productname">Iphone 5s Gold 32 Gb 2013</div>
                                 <h4 class="price">$451.00</h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                              </div>
                           </div>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="offer">New</div>
                                 <div class="thumbnail"><a href="details.html"><img src="images/products/small/products-03.png" alt="Product Name"></a></div>
                                 <div class="productname">Iphone 5s Gold 32 Gb 2013</div>
                                 <h4 class="price">$451.00</h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                              </div>
                           </div>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="thumbnail"><a href="details.html"><img src="images/products/small/products-04.png" alt="Product Name"></a></div>
                                 <div class="productname">Iphone 5s Gold 32 Gb 2013</div>
                                 <h4 class="price">$451.00</h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                              </div>
                           </div>
                        </div>
                     </li>
                  </ul></div>
               </div>
               <div class="clearfix"></div>
               <div class="featured-products">
                  <h3 class="title"><strong>Featured </strong> Products</h3>
                  <div class="control"><a id="prev_featured" class="prev" href="#" style="display: block;">&lt;</a><a id="next_featured" class="next" href="#" style="display: block;">&gt;</a></div>
                  <div class="caroufredsel_wrapper" style="display: block; text-align: start; float: left; position: relative; top: auto; right: auto; bottom: auto; left: auto; z-index: auto; width: 1140px; height: 593px; margin: 0px; overflow: hidden;"><ul id="featured" style="text-align: left; float: none; position: absolute; top: 0px; right: auto; bottom: auto; left: 0px; margin: 0px; width: 5700px; height: 593px;">
                     <li style="width: 1140px;">
                        <div class="row">
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="thumbnail"><a href="details.html"><img src="images/products/small/products-05.png" alt="Product Name"></a></div>
                                 <div class="productname">Iphone 5s Gold 32 Gb 2013</div>
                                 <h4 class="price">$451.00</h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                              </div>
                           </div>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="thumbnail"><a href="details.html"><img src="images/products/small/products-06.png" alt="Product Name"></a></div>
                                 <div class="productname">Iphone 5s Gold 32 Gb 2013</div>
                                 <h4 class="price">$451.00</h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                              </div>
                           </div>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="offer">New</div>
                                 <div class="thumbnail"><a href="details.html"><img src="images/products/small/products-07.png" alt="Product Name"></a></div>
                                 <div class="productname">Iphone 5s Gold 32 Gb 2013</div>
                                 <h4 class="price">$451.00</h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                              </div>
                           </div>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="thumbnail"><a href="details.html"><img src="images/products/small/products-04.png" alt="Product Name"></a></div>
                                 <div class="productname">Iphone 5s Gold 32 Gb 2013</div>
                                 <h4 class="price">$451.00</h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                              </div>
                           </div>
                        </div>
                     </li>
                     <li style="width: 1140px;">
                        <div class="row">
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="thumbnail"><a href="details.html"><img src="images/products/small/products-01.png" alt="Product Name"></a></div>
                                 <div class="productname">Iphone 5s Gold 32 Gb 2013</div>
                                 <h4 class="price">$451.00</h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                              </div>
                           </div>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="thumbnail"><a href="details.html"><img src="images/products/small/products-02.png" alt="Product Name"></a></div>
                                 <div class="productname">Iphone 5s Gold 32 Gb 2013</div>
                                 <h4 class="price">$451.00</h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                              </div>
                           </div>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="thumbnail"><a href="details.html"><img src="images/products/small/products-03.png" alt="Product Name"></a></div>
                                 <div class="productname">Iphone 5s Gold 32 Gb 2013</div>
                                 <h4 class="price">$451.00</h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                              </div>
                           </div>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="thumbnail"><a href="details.html"><img src="images/products/small/products-04.png" alt="Product Name"></a></div>
                                 <div class="productname">Iphone 5s Gold 32 Gb 2013</div>
                                 <h4 class="price">$451.00</h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                              </div>
                           </div>
                        </div>
                     </li>
                  </ul></div>
               </div>
               <div class="clearfix"></div>
               <div class="our-brand">
                  <h3 class="title"><strong>Our </strong> Brands</h3>
                  <div class="control"><a id="prev_brand" class="prev" href="#" style="display: block;">&lt;</a><a id="next_brand" class="next" href="#" style="display: block;">&gt;</a></div>
                  <div class="caroufredsel_wrapper" style="display: block; text-align: start; float: left; position: relative; top: auto; right: auto; bottom: auto; left: auto; z-index: auto; width: 1140px; height: 50px; margin: 0px; overflow: hidden;"><ul id="braldLogo" style="text-align: left; float: none; position: absolute; top: 0px; right: auto; bottom: auto; left: 0px; margin: 0px; width: 5700px; height: 50px;">
                     <li style="width: 1140px;">
                        <ul class="brand_item">
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/themeforest.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/photodune.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/activeden.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                              </a>
                           </li>
                        </ul>
                     </li>
                     <li style="width: 1140px;">
                        <ul class="brand_item">
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/themeforest.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/photodune.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/activeden.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                              </a>
                           </li>
                        </ul>
                     </li>
                  </ul></div>
               </div>
            </div>
         </div>

