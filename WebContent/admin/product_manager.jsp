<%@page import="model.Branch"%>
<%@page import="dao.BranchDAO"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	 <%
    	ProductDAO productDAO = new ProductDAO();
	 	CategoryDAO categoryDAO = new CategoryDAO();
	 	BranchDAO branchDAO = new BranchDAO();
		ArrayList<Product> lp = productDAO.getListProduct();
    	ArrayList<Category> lc = categoryDAO.getListCategory();
    	ArrayList<Branch> lb = branchDAO.getListBranch();
		
    	String action = "";
    	if(request.getParameter("action")!=null){
    		action = request.getParameter("action");
    	}
    	
   	%>
	
    <body>
	<div id="wrapper">
	<jsp:include page="header.jsp"></jsp:include>
	



<div id="page-wrapper" style="min-height: 658px;">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Products</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading"><a href="product_manager.jsp"><button type="button" class="btn btn-primary">Create</button></a></div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="dataTable_wrapper">
						<div id="dataTables-example_wrapper"
							class="dataTables_wrapper form-inline dt-bootstrap no-footer">
							<div class="row">
								<div class="col-sm-6">
									<div class="dataTables_length" id="dataTables-example_length">
										<label>Show <select name="dataTables-example_length"
											aria-controls="dataTables-example"
											class="form-control input-sm"><option value="10">10</option>
												<option value="25">25</option>
												<option value="50">50</option>
												<option value="100">100</option></select> entries
										</label>
									</div>
								</div>
								<div class="col-sm-6">
									<div id="dataTables-example_filter" class="dataTables_filter">
										<label>Search:<input type="search"
											class="form-control input-sm" placeholder=""
											aria-controls="dataTables-example"></label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<table
										class="table table-striped table-bordered table-hover dataTable no-footer"
										id="dataTables-example" role="grid"
										aria-describedby="dataTables-example_info">
										<thead>
											<tr role="row">
												<th class="sorting_asc" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="Rendering engine: activate to sort column descending"
													style="width: auto;">ID</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Tên Sản Phẩm</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Giá</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Ảnh</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Mô tả</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Hãng</th>
													<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Mã sản phẩm</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Loại</th>
												
												
											</tr>
										</thead>
										<tbody>
										<% for(Product product : lp) { %>
											<tr class="gradeA odd" role="row">
												<td class="sorting_1"><%=product.getProductID() %></td>
												<td><%=product.getProductName()%></td>
												<td><%=product.getPrice()%></td>
												<td><img src="<%=product.getProductImage()%>"></td>
												<td><%=product.getProductDescription()%></td>
												<td><%=product.getBrand()%></td>
												<td><%=product.getCategoryID()%></td>
												<td><%=product.getBranchID()%></td>
												<td width="120px">
												<center >
													<a href="product_manager.jsp?action=edit&productID=<%=product.getProductID()%>"><button type="button" class="btn btn-info" style="padding:5px;">Edit</button></a>
													<a href="${pageContext.request.contextPath}/managerProduct?action=delete&productID=<%=product.getProductID()%>"><button type="button" class="btn btn-danger" style="padding:5px;">Delete</button></a>
												
												</center>
												</td>
											</tr>
										<% } %>	
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="dataTables_info" id="dataTables-example_info"
										role="status" aria-live="polite">Showing 1 to 10 of 57
										entries</div>
								</div>
								<div class="col-sm-6">
									<div class="dataTables_paginate paging_simple_numbers"
										id="dataTables-example_paginate">
										<ul class="pagination">
											<li class="paginate_button previous disabled"
												aria-controls="dataTables-example" tabindex="0"
												id="dataTables-example_previous"><a href="#">Previous</a></li>
											<li class="paginate_button active"
												aria-controls="dataTables-example" tabindex="0"><a
												href="#">1</a></li>
											<li class="paginate_button "
												aria-controls="dataTables-example" tabindex="0"><a
												href="#">2</a></li>
											<li class="paginate_button "
												aria-controls="dataTables-example" tabindex="0"><a
												href="#">3</a></li>
											<li class="paginate_button "
												aria-controls="dataTables-example" tabindex="0"><a
												href="#">4</a></li>
											<li class="paginate_button "
												aria-controls="dataTables-example" tabindex="0"><a
												href="#">5</a></li>
											<li class="paginate_button "
												aria-controls="dataTables-example" tabindex="0"><a
												href="#">6</a></li>
											<li class="paginate_button next"
												aria-controls="dataTables-example" tabindex="0"
												id="dataTables-example_next"><a href="#">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.table-responsive -->
					
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Basic Form Elements
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                
                                <!-- form edit -->
                                
                                 <%if(action.equals("edit")) {%>
                                 	
                                 	 <form role="form" action="${pageContext.request.contextPath}/managerProduct" method="GET">
                                 	 	<div class="form-group">
                                            <label>ID</label>
                                            <input class="form-control" placeholder="Enter text" name="productID" value="<%=request.getParameter("productID") %>" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label>Tên sản phẩm</label>
                                            <input class="form-control" placeholder="Enter text" name="productName" >
                                        </div>
                                         <div class="form-group">
                                            <label>Giá</label>
                                            <input class="form-control" placeholder="Enter text" name="productPrice">
                                        </div>
                                        <div class="form-group">
                                            <label>Hãng</label>
                                            <input class="form-control" name="productBrand">
                                            <p class="help-block">Example block-level help text here.</p>
                                        </div>
                                        <div class="form-group">
                                            <label>Ảnh</label>
                                            <input type="file" name="productImage">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Mô tả</label>
                                            <textarea class="form-control" rows="3" name="productDescription"></textarea>
                                        </div>
                                     
                                       
                                        <div class="form-group">
                                            <label>Danh mục</label>
                                            <select class="form-control" name="categoryID">
                                             <% for(Category category : lc) {%>
                                               <option value="<%=category.getCategoryID() %>" ><%=category.getCategoryName() %></option>
                                             <% } %>
                                            </select>
                                        </div>
                                          <div class="form-group">
                                            <label>Loại</label>
                                            <select class="form-control" name="branchID">
                                            <%for(Branch branch : lb) { %>
                                                <option value="<%=branch.getBranchID()%>" ><%=branch.getBranchName()%></option>
                                                <% } %>
                                            </select>
                                        </div>
                                       	<input type="hidden" name="productID" value="<%=request.getParameter("productID") %>">
                                        <button type="submit" class="btn btn-success" name="action" value="update">Update</button>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                    </form>
                                 
                                 <% }else{ %>
                                 
                                <!-- form create -->
                                    <form role="form" action="${pageContext.request.contextPath}/managerProduct" method="POST" >
                                        <div class="form-group">
                                            <label>Tên sản phẩm</label>
                                            <input class="form-control" placeholder="Enter text" name="productName">
                                        </div>
                                         <div class="form-group">
                                            <label>Giá</label>
                                            <input class="form-control" placeholder="Enter text" name="productPrice">
                                        </div>
                                        <div class="form-group">
                                            <label>Hãng</label>
                                            <input class="form-control" name="productBrand">
                                            <p class="help-block">Example block-level help text here.</p>
                                        </div>
                                        <div class="form-group">
                                            <label>Ảnh</label>
                                            <input type="file" name="productImage">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Mô tả</label>
                                            <textarea class="form-control" rows="3" name="productDescription"></textarea>
                                        </div>
                                     
                                       
                                        <div class="form-group">
                                            <label>Danh mục</label>
                                            <select class="form-control" name="categoryID">
                                             <% for(Category category : lc) {%>
                                               <option value="<%=category.getCategoryID() %>" ><%=category.getCategoryName() %></option>
                                             <% } %>
                                            </select>
                                        </div>
                                          <div class="form-group">
                                            <label>Loại</label>
                                            <select class="form-control" name="branchID">
                                            <%for(Branch branch : lb) { %>
                                                <option value="<%=branch.getBranchID()%>" ><%=branch.getBranchName()%></option>
                                                <% } %>
                                            </select>
                                        </div>
                                       
                                        <button type="submit" class="btn btn-success" name="action" value="submit">Submit</button>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                    </form>
                                    
                                    <% } %>
                                    
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
	<!-- /.row -->
	
	<!-- /.row -->
	
	<!-- /.row -->
	
	<!-- /.row -->
</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	</div>
</body>