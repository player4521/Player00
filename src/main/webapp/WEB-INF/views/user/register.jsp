<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="${path}/"><b>Player</b>0</a>
		</div>
		<div class="card">
			<div class="card-body register-card-body">
				<p class="login-box-msg">Register a new membership</p>
				<form action="${path}/user/register" method="post">
					<div class="input-group mb-3">
						<input type="text" name="playerId" class="form-control"
							placeholder="ID">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-exclamation"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="text" name="playerName" class="form-control"
							placeholder="Name">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="email" name="playerMail" class="form-control"
							placeholder="Mail">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" name="playerPw" class="form-control"
							placeholder="Password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="비밀번호 확인">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-8">
							<div class="icheck-primary">
								<input type="checkbox" id="agreeTerms" name="terms"
									value="agree"> <label for="agreeTerms"> I agree
									to the <a href="#">terms</a>
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">Register</button>
						</div>
						<!-- /.col -->
					</div>
				</form>
				<a href="${path}/user/login" class="text-center">I already have
					a membership</a>
			</div>
			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.register-box -->
	<%@ include file="../include/plugin_js.jsp"%>
	<script> $(function () { $('input').iCheck({ checkboxClass: 'icheckbox_square-blue', radioClass: 'iradio_square-blue', increaseArea: '20%' // optional }); }); </script>
</body>
</html>
