<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js">
		var result = "${msg}";
		if (result == "regSuccess") {
			alert("게시글 등록이 완료되었습니다.");
		} else if (result == "modSuccess") {
			alert("게시글 수정이 완료되었습니다.");
		} else if (result == "delSuccess") {
			alert("게시글 삭제가 완료되었습니다.");
		}
		$(document).ready(function() {
			var formObj = $("form[role='form']");
			console.log(formObj);
			$(".modBtn").on("click", function() {
				formObj.attr("action", "${path}/article/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});
			$(".delBtn").on("click", function() {
				formObj.attr("action", "${path}/article/remove");
				formObj.submit();
			});
			$(".listBtn").on("click", function() {
				self.location = "${path}/article/list"
			});
		});

		$(document).ready(function() {
			var formObj = $("form[role='form']");
			console.log(formObj);
			$(".modBtn").on("click", function() {
				formObj.submit();
			});
			$(".cancelBtn").on("click", function() {
				history.go(-1);
			});
			$(".listBtn").on("click", function() {
				self.location = "${path}/article/list"
			});
		});
	</script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
</body>
</html>