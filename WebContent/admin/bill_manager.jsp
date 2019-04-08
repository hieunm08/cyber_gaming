<%@page import="model.Bill"%>
<%@page import="dao.BillDAO"%>
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
	 	BillDAO billDAO = new BillDAO();
    	ArrayList<Bill> listBill = billDAO.getListBill();
		
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
			<h1 class="page-header">Bills</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading"><a href="bill_manager.jsp"></a></div>
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
													style="width: auto;">Người nhận</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Địa chỉ</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">SĐT</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Ngày đặt hàng</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Ngày giao hàng</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Status</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Payment</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Note</th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">Tổng tiền </th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;">mã khách hàng </th>
												<th class="sorting" tabindex="0"
													aria-controls="dataTables-example" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: auto;"> </th>
												
												
											</tr>
										</thead>
										<tbody>
										<% for(Bill bill : listBill) { %>
											<tr class="gradeA odd" role="row">
												<td class="sorting_1"><%=bill.getBillID() %></td>
												<td class="sorting_1"><%=bill.getReceiver()%></td>
												<td class="sorting_1"><%=bill.getReceiverAdd()%></td>
												<td class="sorting_1"> <%=bill.getReceiverPhone()%></td>
												<td><%=bill.getDate()%></td>
												<td><%=bill.getReceiverDate()%></td>
												<td><%=bill.getBillStatus() %></td>
												<td><%=bill.getPayment() %></td>
												<td><%=bill.getNote()%></td>
												<td><%=bill.getTotal()%></td>
												<td><%=bill.getUserID()%></td>
												<td width="100px">
												
													<a href="bill_manager.jsp?action=edit&billID=<%=bill.getBillID()%>&userID=<%=bill.getUserID()%>"><button type="button" class="btn btn-info" style="padding:5px;">Edit</button></a>
													<a href="billDetail_manager.jsp?billID=<%=bill.getBillID()%>"><button type="button" class="btn btn-info" style="padding:5px;">Detail</button></a>
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
                                 	
                                 	 <form role="form" action="${pageContext.request.contextPath}/managerBill" method="GET">
                                 	 	<div class="form-group">
                                            <label>Mã đơn hàng</label>
                                            <input class="form-control" placeholder="Enter text" name="billID" value="<%=request.getParameter("billID") %>" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label>Mã khách hàng</label>
                                            <input class="form-control" placeholder="Enter text" name="userID" value="<%=request.getParameter("userID") %>" disabled>
                                        </div>
                                       <div class="form-group">
                                            <label>Trạng thái đơn hàng </label>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="billStatus" id="optionsRadios1" value="Đang giao hàng" checked="">Đang giao hàng
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="billStatus" id="Đã giao hàng" value="option2">Đã giao hàng
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="billStatus" id="Hủy" value="option3">Hủy
                                                </label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Ngày giao hàng</label>
                                            <input class="form-control" placeholder="08/08/2018" name="receiverDate">
                                        </div>
                                       
                                       	<input type="hidden" name="billID" value="<%=request.getParameter("billID") %>">
                                        <button type="submit" class="btn btn-success" name="action" value="update">Update</button>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                    </form>
                                 <% }else{ %>
                                 
                                <%} %> 
                                 
                                    
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