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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->

<script>
	function fn_contentView(bno, path) {
		var url = path + "/board/read?brd_no= " + bno;
		location.href = url;
	}

	var result = "${msg}";
	if (result == "regSuccess") {
		alert("게시글 등록이 완료되었습니다.");
	} else if (result == "modSuccess") {
		alert("게시글 수정이 완료되었습니다.");
	} else if (result == "delSuccess") {
		alert("게시글 삭제가 완료되었습니다.");
	}

	// move to white page
// 	$(document).on('click', '#writeBtn', function(e) {
// 		e.preventDefault();
// 		alert(path + "/board/write")
// 		location.href = path + "/board/write";
// 	});
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
								<h3 class="card-title">Article List</h3>
							</div>
							<div class="card-body">
								<table class="table table-bordered">
									<tbody>
										<c:choose>
											<c:when test="${empty boardList}">
												<tr>
													<td colspan="5" align="center">No data</td>
												</tr>
											</c:when>
											<c:when test="${!empty boardList}">
												<tr>
													<th style="width: 30px">#</th>
													<th>title</th>
													<th style="width: 100px">name</th>
													<th style="width: 150px">date</th>
													<th style="width: 60px">views</th>
												</tr>
												<c:forEach items="${boardList}" var="list">
													<tr>
														<td><a href="#" onClick="fn_contentView('${list.brd_no}','${path}')"> <c:out value="${list.brd_no}" /></a></td> 
														<%-- <td>${board.brd_no}</td> --%>
														<td><a href="${path}/board/read?brd_no=${list.brd_no}">${list.title}</a></td>
														<td>${list.user_id}</td>
														<!-- yyyy-MM-dd a HH:mm 2022-03-16 오후 21:40 -->
														<td><fmt:formatDate value="${list.reg_date}" pattern="yyyy-MM-dd HH:mm" /></td>
														<td><span class="badge bg-red">${list.view_cnt}</span></td>
													</tr>
												</c:forEach>
											</c:when>
										</c:choose>
									</tbody>
								</table>
							</div>
							<div class="card-footer">
								<div class="float-right">
									<button type="button" class="btn btn-success btn-flat" id="writeBtn">
										<i class="fa fa-pencil"></i> write
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
