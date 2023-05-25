<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<%@ include file="header.jsp"%>

	<%
	// to check if users keyed in wrong password/username
	String message = request.getParameter("errCode");
	%>

	<section class="h-100 gradient-form" style="background-color: #eee;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-10">
					<div class="card rounded-3 text-black">
						<div class="row g-0">
							<div class="col-lg-6">
								<div class="card-body p-md-5 mx-md-4">

									<div
										class="text-center d-flex align-items-center justify-content-center pb-4">
										<!-- <img
											src="../assets/logo.png"
											style="width: 180px;" alt="logo"> -->
										<h4 class="mt-1 mb-5 pb-1">Log in</h4>
									</div>

									<form action="<%=request.getContextPath()%>/LoginServlet"
										method="GET">
										<div class="form-outline mb-4">
											<label class="form-label" for="form2Example11">Username</label>
											<input type="text" id="form2Example11" class="form-control"
												placeholder="Username" name="loginId" />
										</div>

										<div class="form-outline mb-4">
											<label class="form-label" for="form2Example22">Password</label>
											<input type="password" id="form2Example22"
												class="form-control" name="password" />
											<%
											if (message != null && message.equals("invalidLogin")) {
											%>
											<p>Wrong username or password. Try again.</p>
											<%
											}
											%>
										</div>

										<div class="text-end pt-1 mb-5 pb-1">
											<button
												class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"
												type="submit">Log in</button>
										</div>

										<div
											class="d-flex align-items-center justify-content-center pb-4">
											<p class="mb-0 me-2">Don't have an account?</p>
											<button type="button" class="btn btn-outline-danger"
												onClick="window.location.href='register.jsp'">Create
												new</button>
										</div>

									</form>

								</div>
							</div>
							<div class="col-lg-6 d-flex align-items-center gradient-custom-2">
								<div class="text-black px-3 py-4 p-md-5 mx-md-4">
									<!-- from chatgpt -->
									<img src="${pageContext.request.contextPath}/assets/KittyRead.png" alt="Kitten Reading">
									<!-- <h4 class="mb-4">We are more than just a company</h4>
									<p class="small mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit, sed do eiusmod tempor incididunt
										ut labore et dolore magna aliqua. Ut enim ad minim veniam,
										quis nostrud exercitation ullamco laboris nisi ut aliquip ex
										ea commodo consequat.</p> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 	<div class="container">
		<form>
			Email input
			<div class="form-outline mb-4">
				<input type="email" id="form2Example1" class="form-control" /> <label
					class="form-label" for="form2Example1">Email address</label>
			</div>

			Password input
			<div class="form-outline mb-4">
				<input type="password" id="form2Example2" class="form-control" /> <label
					class="form-label" for="form2Example2">Password</label>
			</div>

			2 column grid layout for inline styling
			<div class="row mb-4">
				<div class="col d-flex justify-content-center">
					Checkbox
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="form2Example31" checked /> <label class="form-check-label"
							for="form2Example31"> Remember me </label>
					</div>
				</div>

				<div class="col">
					Simple link
					<a href="#!">Forgot password?</a>
				</div>
			</div>

			Submit button
			<button type="button" class="btn btn-primary btn-block mb-4">Sign
				in</button>

			Register buttons
			<div class="text-center">
				<p>
					Not a member? <a href="#!">Register</a>
				</p>
				<p>or sign up with:</p>
				<button type="button" class="btn btn-link btn-floating mx-1">
					<i class="fab fa-facebook-f"></i>
				</button>

				<button type="button" class="btn btn-link btn-floating mx-1">
					<i class="fab fa-google"></i>
				</button>

				<button type="button" class="btn btn-link btn-floating mx-1">
					<i class="fab fa-twitter"></i>
				</button>

				<button type="button" class="btn btn-link btn-floating mx-1">
					<i class="fab fa-github"></i>
				</button>
			</div>
		</form>
	</div> -->

	<!-- 	<div class="container">
		<div class="login-container">
			<h1 class="text-center mb-4">Login</h1>
			<form action="#" method="POST">
				<div class="mb-3">
					<label for="username" class="form-label">Username</label> <input
						type="text" class="form-control" id="username" name="username"
						required>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Password</label> <input
						type="password" class="form-control" id="password" name="password"
						required>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary">Login</button>
				</div>
			</form>
		</div>
	</div>
 -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<%@ include file="footer.jsp"%>
</body>
</html>