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
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Navbar -->
		<%@ include file="../include/main_header.jsp"%>
		<!-- /.navbar -->
		<!-- Main Sidebar Container -->
		<%@ include file="../include/left_column.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Main content -->
			<div class="content">
				<div class="container-fluid">
					<section class="content container-fluid">
						<h3>
							<i class="fa fa-warning text-red"></i> ${exception.getMessage()}
						</h3>
						<ul>
							<c:forEach items="${exception.getStackTrace()}" var="stack">
								<li>${stack.toString()}</li>
							</c:forEach>
						</ul>
					</section>
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
