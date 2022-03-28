<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".modBtn").on("click", function() {
			formObj.submit();
		});
		
		// TODO 버튼 동작 안함
		$(".cancelBtn").on("click", function() {
			history.go(-1);
		});
		
		// TODO 버튼 동작 안함. 버튼타입을 submit으로 할 경우 동작하지만 이동 후 수정완료메세지가 출력됨
		$(".listBtn").on("click", function() {
			self.location = "${path}/board/listPaging?page=${criteria.page}
			+ "&perPageNum=${criteria.perPageNum}";
			+ "&searchType=${criteria.searchType}";
			+ "&keyword=${criteria.keyword}";
		});
	});
</script>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- Navbar -->
		<%@ include file="../include/main_header.jsp"%>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<%@ include file="../include/left_column.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Starter Page</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Starter Page</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<div class="content">
				<div class="container-fluid">
					<div class="col-lg-12">
						<form role="form" id="writeForm" method="post"
							action="${path}/board/modify">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">write</h3>
								</div>
								<div class="card-body">
									<input type="hidden" name="brd_no" value="${board.brd_no}">
									<input type="hidden" name="page" value="${criteria.page}">
									<input type="hidden" name="perPageNum" value="${criteria.perPageNum}">
									<input type="hidden" name="searchType" value="${criteria.searchType}">
									<input type="hidden" name="keyword" value="${criteria.keyword}">
									<div class="form-group">
										<label for="title">title</label> <input class="form-control"
											id="title" name="title" placeholder="insert title"
											value="${board.title}">
									</div>
									<div class="form-group">
										<label for="content">content</label>
										<textarea class="form-control" id="content" name="content"
											rows="30" placeholder="insert content" style="resize: none;">${board.content}</textarea>
									</div>
									<div class="form-group">
										<label for="writer">name</label> <input class="form-control"
											id="user_id" name="user_id" value="${board.user_id}" readonly>
									</div>
								</div>
								<div class="card-footer">
									<button type="button" class="btn btn-primary listBtn">
										<i class="fa fa-list"></i> list
									</button>
									<div class="float-right">
										<button type="button" class="btn btn-warning cancelBtn">
											<i class="fa fa-trash"></i> cancle
										</button>
										<button type="submit" class="btn btn-success modBtn">
											<i class="fa fa-save"></i> save
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
			<div class="p-3">
				<h5>Title</h5>
				<p>Sidebar content</p>
			</div>
		</aside>
		<!-- /.control-sidebar -->

		<!-- Main Footer -->
		<%@ include file="../include/main_footer.jsp"%>

	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->
	<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>
