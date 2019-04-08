<%@page import="dao.ProductDAO"%>
<%@page import="dao.BillDetailDAO"%>
<%@page import="model.BillDetail"%>
<%@page import="model.Product"%>
<%@page import="dao.BillDAO"%>
<%@page import="model.Users"%>
<%@page import="model.Bill"%>
<%@page import="java.util.Map"%>
<%@page import="model.Users"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page import="model.Cart"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="model.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<link href="css/bosung.css" rel="stylesheet">
<style type="text/css">
.order-item {
    width: 100% !important;
}
.btn-huy {
    position: absolute;
    right: 10px;
    bottom: inherit !important;
    margin-top:8% ;
}
</style>
</head>
<jsp:include page="header.jsp"></jsp:include>

<%
	DecimalFormat formatter = new DecimalFormat("###,###,###");
	BillDAO billDAO = new BillDAO();
	BillDetailDAO billDetailDAO = new BillDetailDAO();
	ProductDAO productDAO = new ProductDAO();
	Users users = null;
	if (session.getAttribute("user") != null) {
		users = (Users) session.getAttribute("user");
	}
%>

<div class="container_fullwidth">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="special-deal leftbar" style="margin-top: 0;">
					<h4 class="title">
						Special <strong> Deals </strong>
					</h4>
					<div class="special-item">
						<div class="product-image">
							<a href="details.html"> <img
								src="images/products/thum/products-01.png" alt="">
							</a>
						</div>
						<div class="product-info">
							<p>
								<a href="details.html"> Licoln Corner Unit </a>
							</p>
							<h5 class="price">$300.00</h5>
						</div>
					</div>
					<div class="special-item">
						<div class="product-image">
							<a href="details.html"> <img
								src="images/products/thum/products-02.png" alt="">
							</a>
						</div>
						<div class="product-info">
							<p>
								<a href="details.html"> Licoln Corner Unit </a>
							</p>
							<h5 class="price">$300.00</h5>
						</div>
					</div>
					<div class="special-item">
						<div class="product-image">
							<a href="details.html"> <img
								src="images/products/thum/products-03.png" alt="">
							</a>
						</div>
						<div class="product-info">
							<p>
								<a href="details.html"> Licoln Corner Unit </a>
							</p>
							<h5 class="price">$300.00</h5>
						</div>
					</div>
				</div>
				<div class="product-tag leftbar">
					<h3 class="title">
						Products <strong> Tags </strong>
					</h3>
					<ul>
						<li><a href="#"> Lincoln us </a></li>
						<li><a href="#"> SDress for Girl </a></li>
						<li><a href="#"> Corner </a></li>
						<li><a href="#"> Window </a></li>
						<li><a href="#"> PG </a></li>
						<li><a href="#"> Oscar </a></li>
						<li><a href="#"> Bath room </a></li>
						<li><a href="#"> PSD </a></li>
					</ul>
				</div>
				<div class="get-newsletter leftbar">
					<h3 class="title">
						Get <strong> newsletter </strong>
					</h3>
					<p>Casio G Shock Digital Dial Black.</p>
					<form>
						<input class="email" type="text" name=""
							placeholder="Your Email..."> <input class="submit"
							type="submit" value="Submit">
					</form>
				</div>
				<div class="fbl-box leftbar">
					<h3 class="title">Facebook</h3>
					<span class="likebutton"> <a href="#"> <img
							src="images/fblike.png" alt="">
					</a>
					</span>
					<p>12k people like Flat Shop.</p>
					<ul>
						<li><a href="#"> </a></li>
						<li><a href="#"> </a></li>
						<li><a href="#"> </a></li>
						<li><a href="#"> </a></li>
						<li><a href="#"> </a></li>
						<li><a href="#"> </a></li>
						<li><a href="#"> </a></li>
						<li><a href="#"> </a></li>
					</ul>
					<div class="fbplug">
						<a href="#"> <span> <img src="images/fbicon.png" alt="">
						</span> Facebook social plugin
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-9">

				<div class="orders">
					
					<%	ArrayList<Bill> lb = billDAO.getListBillByUser(users.getUserID()); 
						for(Bill bill : lb){
					%>
					<form action="huy" method="POST">
					<div class="order">
						<div class="order-info">
							<div>
								<div class="info-order-left-text">
									Đơn hàng <a class="link"><%=bill.getBillID()%></a>
								</div>
								<p class="text info desc">Đặt ngày <%=bill.getDate()%></p>
							</div>
							<a class="pull-left info-order-left"></a><a
								class="pull-right link manage" style="color: rgb(26, 156, 183);">Tổng tiền: <%=formatter.format( bill.getTotal())%> đ</a>
							<div class="clear"></div>
						</div>
						<%	ArrayList<BillDetail> lbd = billDetailDAO.getBillDetailByBillID(bill.getBillID());
							for(BillDetail billDetail : lbd){	
						%>
						<div class="order-item">
							<div class="item-pic" data-spm="detail_image">
								<%	Product product = new Product();
										product = productDAO.getProduct(billDetail.getProductID());	
								%>
								<a href="#"><img src="<%=product.getProductImage()%>"></a>
							</div>
							<div class="item-main item-main-mini">
								<div>
									<div class="text title item-title" data-spm="details_title"><%=product.getProductName()%></div>
									<p class="text desc"></p>
									<p class="text desc bold"><%=formatter.format(product.getPrice())%> đ</p>
								</div>
							</div>
							<div class="item-quantity">
								<p class="capsule">Qty: <%=billDetail.getQuantityDetail()%></p>

							</div>
							<div class="item-status item-capsule">
								<p class="capsule"><%=bill.getBillStatus()%></p>
							</div>
							<div class="item-info">
								<%if(bill.getBillStatus().equals("Đã giao hàng")){ %>
								<p class="text delivery-success">Đã giao <%=bill.getReceiverDate()%></p>
								<% }else{ %>
								
								<%} %>
								
							</div>
							<%if(bill.getBillStatus().equals("Chờ xác nhận")){ %>
							<div class="btn-huy">
								<button type="submit" class="btn btn-warning" >Hủy Đơn Hàng</button></a>
							</div>
							<% }else{ %>
								
								<%} %>
							<div class="clear"></div>
						</div>
						<% } %>
					</div>
					<input type="hidden" name="billID" value="<%=bill.getBillID()%>">
					</form>
					<% } %>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="our-brand">
			<h3 class="title">
				<strong> Our </strong> Brands
			</h3>
			<div class="control">
				<a id="prev_brand" class="prev" href="#" style="display: block;">
					&lt; </a> <a id="next_brand" class="next" href="#"
					style="display: block;"> &gt; </a>
			</div>
			<div class="caroufredsel_wrapper"
				style="display: block; text-align: start; float: left; position: relative; top: auto; right: auto; bottom: auto; left: auto; z-index: auto; width: 1140px; height: 97px; margin: 0px; overflow: hidden;">
				<ul id="braldLogo"
					style="text-align: left; float: none; position: absolute; top: 0px; right: auto; bottom: auto; left: 0px; margin: 0px; width: 5700px; height: 97px;">
					<li style="width: 1140px;">
						<ul class="brand_item">
							<li><a href="#">
									<div class="brand-logo">
										<img src="images/envato.png" alt="">
									</div>
							</a></li>
							<li><a href="#">
									<div class="brand-logo">
										<img src="images/themeforest.png" alt="">
									</div>
							</a></li>
							<li><a href="#">
									<div class="brand-logo">
										<img src="images/photodune.png" alt="">
									</div>
							</a></li>
							<li><a href="#">
									<div class="brand-logo">
										<img src="images/activeden.png" alt="">
									</div>
							</a></li>
							<li><a href="#">
									<div class="brand-logo">
										<img src="images/envato.png" alt="">
									</div>
							</a></li>
						</ul>
					</li>
					<li style="width: 1140px;">
						<ul class="brand_item">
							<li><a href="#">
									<div class="brand-logo">
										<img src="images/envato.png" alt="">
									</div>
							</a></li>
							<li><a href="#">
									<div class="brand-logo">
										<img src="images/themeforest.png" alt="">
									</div>
							</a></li>
							<li><a href="#">
									<div class="brand-logo">
										<img src="images/photodune.png" alt="">
									</div>
							</a></li>
							<li><a href="#">
									<div class="brand-logo">
										<img src="images/activeden.png" alt="">
									</div>
							</a></li>
							<li><a href="#">
									<div class="brand-logo">
										<img src="images/envato.png" alt="">
									</div>
							</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>