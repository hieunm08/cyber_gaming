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


	<jsp:include page="header.jsp"></jsp:include>
	
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
	
	<div class="container_fullwidth">
        <div class="container shopping-cart">
          <div class="row">
            <div class="col-md-12">
              <h3 class="title">
                Shopping Cart
              </h3>
              <div class="clearfix">
              </div>
              <table class="shop-table">
                <thead>
                  <tr>
                    <th>
                      Image
                    </th>
                    <th>
                      Details
                    </th>
                    <th>
                      Quantity
                    </th>
                    <th>
                      Price
                    </th>
                    <th>
                      Delete
                    </th>
                  </tr>
                </thead>
                <tbody>
                
                <%for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {%>
                  <tr>
                    <td>
                      <img src="<%=list.getValue().getProduct().getProductImage() %>" alt="">
                    </td>
                    <td>
                      <div class="shop-details">
                        <div class="productname">
                          <%=list.getValue().getProduct().getProductName() %>
                        </div>
                        <p>
                          <img alt="" src="images/star.png">
                          <a class="review_num" href="#">
                            02 Review(s)
                          </a>
                        </p>
                        <div class="color-choser">
                          <span class="text">
                            Product Color : 
                          </span>
                          <ul>
                            <li>
                              <a class="black-bg " href="#">
                                black
                              </a>
                            </li>
                            <li>
                              <a class="red-bg" href="#">
                                light red
                              </a>
                            </li>
                          </ul>
                        </div>
                        <p>
                          Product Code : 
                          <strong class="pcode">
                            Dress 120
                          </strong>
                        </p>
                      </div>
                    </td>
                    <td>
                      <select name="quantity">
                        <option  value="<%=list.getValue().getQuantity()%>">
                          1
                        </option>
                        <option value="<%=list.getValue().getQuantity()%>">
                          2
                        </option>
                        <option value="<%=list.getValue().getQuantity()%>">
                          3
                        </option>
                        
                      </select>
                    </td>
                    <td>
                      <h5>
                        <strong class="red">
                          <%=formatter.format(list.getValue().getProduct().getPrice()) %>Đ
                        </strong>
                      </h5>
                    </td>
                    <td>
                      <a href="addCart?action=remove&productID=<%=list.getValue().getProduct().getProductID()%>">
                        <img src="images/remove.png" alt="">
                      </a>
                    </td>
                  </tr>
                  
                  <% } %>
                </tbody>
                <tfoot>
                  <tr>
                    <td colspan="6">
                      <button class="pull-left" onclick="location.href='index.jsp'">
                        Continue Shopping
                      </button>
                      </a>
                    </td>
                  </tr>
                </tfoot>
              </table>
              <div class="clearfix">
              </div>
              <div class="row">
              
                
                <div class="col-md-4 col-sm-6">
                  <div class="shippingbox">
                    <div class="subtotal">
                      <h5>
                        Sub Total
                      </h5>
                      <span>
                       <%=formatter.format(cart.total()) %>đ
                      </span>
                    </div>
                    <div class="grandtotal">
                      <h5>
                        GRAND TOTAL 
                      </h5>
                      <span>
                        <%=formatter.format(cart.total()) %>đ
                      </span>
                    </div>
                    <button onclick="location.href='checkout.jsp'">
                      Process To Checkout
                    </button>
                  </div>
                </div>
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
