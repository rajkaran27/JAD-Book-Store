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

<style>
#loginForm {
	box-shadow: -1px 4px 40px 10px rgba(0, 0, 0, 0.54);
	-webkit-box-shadow: -1px 4px 40px 10px rgba(0, 0, 0, 0.54);
	-moz-box-shadow: -1px 4px 40px 10px rgba(0, 0, 0, 0.54);
}
</style>

</head>
<body>
	<%@ include file="header.jsp"%>

	<%
	String message = request.getParameter("errCode");
	%>

	<section class="h-100 gradient-form" style="background-color: #0C243C;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-10">
					<div class="card rounded-3" id="loginForm"
						style="background-color: #0C243C;">
						<div class="row g-0">
							<div class="col-lg-6">
								<div class="card-body p-md-5 mx-md-4">

									<div
										class="text-center d-flex align-items-center justify-content-center pb-4">
										<h4 class="mt-1 mb-5 pb-1">Customer Log in</h4>
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
											if (message != null) {
												if (message.equals("invalidLogin")) {
											%>
											<p>Wrong username or password. Try again.</p>
											<%
											} else if (message.equals("accessDenied")) {
											%>
											<p>Access Denied.</p>
											<%
											} else if (message.equals("registered")) {
											%>
											<p>You have joined the kittens!</p>
											<%
											}
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
								<div class="text-black px-3 py-4 p-md-5 mx-md-4"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<%@ include file="footer.jsp"%>
</body>
</html>