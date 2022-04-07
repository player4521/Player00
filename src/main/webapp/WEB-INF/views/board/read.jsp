<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- HandleBars JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
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
        self.location = "${path}/board/listPaging"
    });

    var brdNo = "${board.brd_no}"; // 현재 게시글 번호
    var replyPageNum = 1; // 댓글 페이지 번호 초기화

    // 댓글 내용 : 줄바꿈/공백처리
    Handlebars.registerHelper("escape", function(reContent) {
        var text = Handlebars.Utils.escapeExpression(reContent);
        text = text.replace(/(\r\n|\n|\r)/gm, "<br/>");
        text = text.replace(/( )/gm, "&nbsp;");
        return new Handlebars.SafeString(text);
    });

    // 댓글 등록일자 : 날짜/시간 2자리로 맞추기 
    Handlebars.registerHelper("prettifyDate", function(timeValue) {
        var dateObj = new Date(timeValue);
        var year = dateObj.getFullYear();
        var month = dateObj.getMonth() + 1;
        var date = dateObj.getDate();
        var hours = dateObj.getHours();
        var minutes = dateObj.getMinutes();
        // 2자리 숫자로 변환
        month < 10 ? month = '0' + month : month;
        date < 10 ? date = '0' + date : date;
        hours < 10 ? hours = '0' + hours : hours;
        minutes < 10 ? minutes = '0' + minutes : minutes;
        return year + "-" + month + "-" + date;
    });

    // 댓글 목록 함수 호출
    getReplies("${path}/reply/" + brdNo + "/" + replyPageNum);

    // 댓글 목록 함수
    function getReplies(replyUri) {
        $.getJSON(replyUri, function(data) {
            printReplyCount(data.pageMaker.totalCount);
            printReplies(data.reply, $(".replyDiv"), $("#replyTemplate"));
            printReplyPaging(data.pageMaker, $(".pagination"));
        });
    }

    // 댓글 갯수 출력 함수
    function printReplyCount(totalCount) {
        var replyCount = $(".replyCount");
        var collapsedBox = $(".collapsed-box");

        // 댓글이 없으면 
        if (totalCount === 0) {
            replyCount.html(" 댓글이 없습니다. 의견을 남겨주세요");
            collapsedBox.find(".btn-box-tool").remove();
            return;

        }

        // 댓글이 존재하면
        replyCount.html(" 댓글목록 (" + totalCount + ")");
        collapsedBox.find(".box-tools").html(
            "<button type='button' class='btn btn-box-tool' data-widget='collapse'>" +
            "<i class='fa fa-plus'></i>" +
            "</button>"
        );
    }

    // 댓글 목록 출력 함수
    function printReplies(replyArr, targetArea, templateObj) {
        var replyTemplate = Handlebars.compile(templateObj.html());
        var html = replyTemplate(replyArr);
        $(".replyDiv").remove();
        targetArea.html(html);
    }

    // 댓글 페이징 출력 함수 
    function printReplyPaging(pageMaker, targetArea) {
        var str = "";

        // 이전 버튼 활성화 
        if (pageMaker.prev) {
            str += "<li class=\"page-item\"><a class=\"page-link\" href='" + (pageMaker.startPage - 1) + "'>이전</a></li>";
        }

        // 페이지 번호 
        for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
            var strCalss = pageMaker.criteria.page == i ? 'class=active' : '';
            str += "<li class=\"page-item\" " + strCalss + "><a class=\"page-link\" href='" + i + "'>" + i + "</a></li>";
        }

        // 다음 버튼 활성화
        if (pageMaker.next) {
            str += "<li class=\"page-item\"><a class=\"page-link\" href='" + (pageMaker.endPage + 1) + "'>다음</a></li>";
        }
        targetArea.html(str);
    }

    // 댓글 페이지 번호 클릭 이벤트
    $(".pagination").on("click", "li a", function(event) {
        event.preventDefault();
        replyPageNum = $(this).attr("href");
        getReplies("${path}/reply/" + brdNo + "/" + replyPageNum);
    });

    // 댓글 수정을 위해 modal창에 선택한 댓글의 값들을 세팅 
    $(".replyDiv").on("click", ".replyDiv", function(event) {
        var reply = $(this);
        $(".brdReNo").val(reply.attr("data-brdReNo"));
        $("#reContent").val(reply.find(".oldReplyText").text());
    });

    // 댓글 저장 버튼 클릭 이벤트
    $(".replyAddBtn").on("click", function() {

    	// 입력 form 선택자 
        var userIdObj = $("#newReplyWriter");
        var reContentObj = $("#newReplyText");
        var userId = userIdObj.val();
        var reContent = reContentObj.val();

        // 댓글 입력처리 수행
        $.ajax({
            type: "post",
            url: "${path}/reply/",
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: "text",
            data: JSON.stringify({
            	brdNo: brdNo,
                userId: userId,
                reContent: reContent
            }),
            success: function(result) {
                console.log("result : " + result);
                if (result === "regSuccess") {
                    alert("댓글이 등록되었습니다.");
                    replyPageNum = 1; // 페이지 1로 초기화
                    getReplies("${path}/reply/" + brdNo + "/" + replyPageNum); // 댓글 목록 호출 
                    reContentObj.val(""); // 댓글 입력창 공백처리
                    userIdObj.val(""); // 댓글 입력창 공백처리 
                }
            }
        });
    });

    // modal 창의 댓글 수정버튼 클릭 이벤트
    $(".modalModBtn").on("click", function() {
        var brdReNo = $(".brdReNo").val();
        var reContent = $("#reContent").val();
        $.ajax({
            type: "put",
            url: "${path}/reply/" + brdReNo,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "PUT"
            },
            dataType: "text",
            data: JSON.stringify({
                reContent: reContent
            }),
            success: function(result) {
                console.log("result : " + result);
                if (result === "modSuccess") {
                    alert("댓글이 수정되었습니다.");
                    getReplies("${path}/reply/" + brdNo + "/" + replyPageNum); // 댓글 목록 호출
                    $("#modModal").modal("hide"); // modal 창 닫기 
                }
            }
        })
    });

    // modal 창의 댓글 삭제버튼 클릭 이벤트
    $(".modalDelBtn").on("click", function() {
        var brdReNo = $(".brdReNo").val();
        $.ajax({
            type: "delete",
            url: "${path}/reply/" + brdReNo,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "DELETE"
            },
            dataType: "text",
            success: function(result) {
                console.log("result : " + result);
                if (result === "delSuccess") {
                    alert("댓글이 삭제되었습니다.");
                    getReplies("${path}/reply/" + brdNo + "/" + replyPageNum); // 댓글 목록 호출
                    $("#delModal").modal("hide"); // modal 창 닫기 
                }
            }
        });
    });
});
</script>

<!-- Handlebars의 댓글 목록 Template코드 -->
<script id="replyTemplate" type="text/x-handlebars-template">
	{{#each.}}
	<div class="post replyDiv" data-brdReNo={{brdReNo}}>
		<div class="user-block">
 			<img class="img-circle img-bordered-sm" src="${path}/dist/img/user1-128x128.jpg" alt="user image">
 			<span class="username">
 				<a href="#">{{userId}}</a>
 				<a href="#" class="float-right btn-box-tool replyDelBtn" data-toggle="modal" data-target="#delModal">
 					<i class="fa fa-times"> 삭제</i>
				</a>
				<a href="#" class="float-right btn-box-tool replyModBtn" data-toggle="modal" data-target="#modModal">
				<i class="fa fa-edit"> 수정</i>
				</a>
			</span>
			<span class="description"></span>
		</div>
		<div class="oldReplyText">{{reContent}}</div>
		<br/>
	</div>
	{{/each}}
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
										src="${path}/dist/img/user1-128x128.jpg" alt="user image"> <span
										class="username"> <a href="#">${board.user_id} Chef</a>
									</span> <span class="description"><fmt:formatDate
											pattern="yyyy-MM-dd" value="${board.reg_date}" /></span>
								</div>
							</div>
							<div class="card-footer">
								<form role="form" method="post">
									<input type="hidden" name="brd_no" value="${board.brd_no}">
									<input type="hidden" name="page" value="${criteria.page}">
									<input type="hidden" name="perPageNum" value="${criteria.perPageNum}">
									<input type="hidden" name="searchType" value="${criteria.searchType}">
									<input type="hidden" name="keyword" value="${criteria.keyword}">
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
			<div class="content">
				<div class="container-fluid">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<form class="form-horizontal">
									<div class="row">
										<div class="form-group col-sm-8">
											<input class="form-control input-sm" id="newReplyText"
												type="text" placeholder="insert reply...">
										</div>
										<div class="form-group col-sm-2">
											<input class="form-control input-sm" id="newReplyWriter"
												type="text" placeholder="writer">
										</div>
										<div class="form-group col-sm-2">
											<button type="button" class="btn btn-primary btn-sm btn-block replyAddBtn">
												<i class="fa fa-save"></i> SAVE
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content -->
			<div class="content">
				<div class="container-fluid">
					<div class="col-lg-12">
						<div class="card card-primary card-outline">
							<%--댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기--%>
							<div class="card-header">
								<a href="" class="link-black text-lg">
									<i class="fas fa-comments margin-r-5 replyCount"></i>
								</a>
								<div class="card-tools">
									<button type="submit" class="btn primary" data-widget="collapse">
										<i class="fa fa-plus"></i>
									</button>
								</div>
							</div>
							<%--댓글 목록--%>
							<div class="card-body replyDiv"></div>
							<%--댓글 페이징--%>
							<div class="card-footer">
								<nav aria-label="Contacts Page Navigation">
									<ul class="pagination pagination-sm no-margin justify-content-center m-0"></ul>
								</nav>
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
