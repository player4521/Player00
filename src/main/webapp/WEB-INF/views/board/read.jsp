<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jstl,c태그를 사용할 수 있도록 해줌 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl,fmt태그를 사용할 수 있도록 해줌 -->
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
			formObj.attr("action", "${path}/board/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		$(".delBtn").on("click", function() {
			formObj.attr("action", "${path}/board/remove");
			formObj.submit();
		});
		$(".listBtn").on("click", function() {
			self.location = "${path}/board/list"
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
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">title : ${board.title}</h3>
							</div>
							<div class="card-body" style="height: 700px">
								${board.content}</div>
							<div class="card-footer">
								<div class="user-block">
									<img class="img-circle img-bordered-sm"
										src="${path}/dist/img/user1-128x128.jpg" alt="user image">
									<span class="username"> <a href="#">${board.user_id} Chef</a>
									</span> <span class="description"><fmt:formatDate
											pattern="yyyy-MM-dd" value="${board.reg_date}" /></span>
								</div>
							</div>
							<div class="card-footer">
								<form role="form" method="post">
									<input type="hidden" name=brd_no
										value="${board.brd_no}">
								</form>
								<button type="submit" class="btn btn-primary listBtn">
									<i class="fa fa-list"></i> list
								</button>
								<div class="float-right">
									<button type="submit" class="btn btn-warning modBtn">
										<i class="fa fa-edit"></i> modify
									</button>
									<button type="submit" class="btn btn-danger delBtn">
										<i class="fa fa-trash"></i> delete
									</button>
								</div>
							</div>
						</div>
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
