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
	function fn_contentView(bno, path) {
		var url = path + "/board/read?brd_no= " + bno;
		location.href = url;
	}

	$(document).ready(function() {
		var result = "${msg}";
		if (result == "regSuccess") {
			alert("게시글 등록이 완료되었습니다.");
		} else if (result == "modSuccess") {
			alert("게시글 수정이 완료되었습니다.");
		} else if (result == "delSuccess") {
			alert("게시글 삭제가 완료되었습니다.");
		}

		// TODO 글쓰기 버튼 동작안함
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".writeBtn").on("click", function() {
			formObj.attr("action", "${path}/board/write");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#searchBtn").on("click", function (event) {
            self.location = "${path}/board/listPaging${pageMaker.makeQuery(1)}"
            + "&searchType=" + $("select option:selected").val()
            + "&keyword=" + encodeURIComponent($("#keywordInput").val());
        });
	});

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
														<td><a href="${path}/board/read${pageMaker.makeSearch(pageMaker.criteria.page)}&brd_no=${list.brd_no}">${list.title}</a>
														<span class="badge bg-teal"><i class="fas fa-comment"></i> + ${list.reply_cnt}</span>
														</td>
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
<!-- 							<div class="card-footer"> -->
<!-- 								<div class="float-right"> -->
<!-- 									<button type="button" class="btn btn-success btn-flat" -->
<!-- 										id="writeBtn"> -->
<!-- 										<i class="fa fa-pencil"></i> write -->
<!-- 									</button> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="card-footer">
								<nav aria-label="Contacts Page Navigation">
									<ul class="pagination justify-content-center m-0">
										<c:if test="${pageMaker.prev}">
											<li class="page-item"><a class="page-link"
												href="${path}/board/listPaging${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
										</c:if>
										<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
											<li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
												<a class="page-link" href="${path}/board/listPaging${pageMaker.makeQuery(idx)}">${idx}</a>
											</li>
										</c:forEach>
										<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
											<li><a class="page-link" href="${path}/board/listPaging${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
							<div class="card-footer">
								<div class="row">
									<div class="form-group col-sm-2">
										<select class="form-control" name="searchType" id="searchType">
											<option value="n"
												<c:out value="${criteria.searchType == null ? 'selected' : ''}"/>>:::::: 선택 ::::::</option>
											<option value="t"
												<c:out value="${criteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
											<option value="c"
												<c:out value="${criteria.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
											<option value="w"
												<c:out value="${criteria.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
											<option value="tc"
												<c:out value="${criteria.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
											<option value="cw"
												<c:out value="${criteria.searchType eq 'cw' ? 'selected' : ''}"/>>내용+작성자</option>
											<option value="tcw"
												<c:out value="${criteria.searchType eq 'tcw' ? 'selected' : ''}"/>>제목+내용+작성자</option>
										</select>
									</div>
									<div class="form-group col-sm-10">
										<div class="input-group">
											<input type="text" class="form-control" name="keyword"
												id="keywordInput" value="${criteria.keyword}"
												placeholder="검색어"> <span class="input-group-btn">
												<button type="button" class="btn btn-primary btn-flat"
													id="searchBtn">
													<i class="fa fa-search"></i> 검색
												</button>
											</span>
										</div>
									</div>
								</div>
								<div class="float-right">
									<button type="button" class="btn btn-success btn-flat"
										id="writeBtn">
										<i class="fa fa-pencil"></i> 글쓰기
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
