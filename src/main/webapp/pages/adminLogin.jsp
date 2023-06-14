<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<style>
#loginForm {
	box-shadow: -1px 4px 40px 10px rgba(0, 0, 0, 0.54);
	-webkit-box-shadow: -1px 4px 40px 10px rgba(0, 0, 0, 0.54);
	-moz-box-shadow: -1px 4px 40px 10px rgba(0, 0, 0, 0.54);
}
</style>
<body>
	<%@ include file="header.jsp"%>
	
	<%
	// to check if users keyed in wrong password/username
	String message = request.getParameter("errCode");
	%>
	
	
	<section class="h-100 gradient-form" style="background-color: #0C243C;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-10">
					<div class="card rounded-3 text-black" id="loginForm" style="background-color: #0C243C;">
						<div class="row g-0">
							<div class="col-lg-6">
								<div class="card-body p-md-5 mx-md-4">

									<div
										class="text-center d-flex align-items-center justify-content-center pb-4">
										<!-- <img
											src="../assets/logo.png"
											style="width: 180px;" alt="logo"> -->
										<h4 class="mt-1 mb-5 pb-1">Admin Log in</h4>
									</div>

									<form action="<%=request.getContextPath()%>/AdminLoginServlet"
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
	
	<%@ include file="footer.jsp"%>
	
</body>
</html>