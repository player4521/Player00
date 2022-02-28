<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="UTF-8">
<%@ include file="../include/head.jsp"%>
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
							action="${path}/article/modify">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">write</h3>
								</div>
								<div class="card-body">
									<input type="hidden" name="article_no"
										value="${article.article_no}">
									<div class="form-group">
										<label for="title">title</label> <input class="form-control"
											id="title" name="title" placeholder="insert title"
											value="${article.title}">
									</div>
									<div class="form-group">
										<label for="content">content</label>
										<textarea class="form-control" id="content" name="content"
											rows="30" placeholder="insert content" style="resize: none;">${article.content}</textarea>
									</div>
									<div class="form-group">
										<label for="writer">name</label> <input class="form-control"
											id="writer" name="writer" value="${article.writer}" readonly>
									</div>
								</div>
								<div class="card-footer">
									<button type="button" class="btn btn-primary">
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
