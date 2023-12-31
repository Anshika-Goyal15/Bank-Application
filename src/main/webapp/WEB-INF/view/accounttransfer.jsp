<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fund Transfer</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4 admin">
				<div class="card">
					<%@ include file="components/message.jsp"%>
					<div class="card-body px-5">

						<h3 class="text-center my-3">Fund Transfer!!</h3>
						<form action="accounttransfer" method="post">

							<div class="form-group">
								<label for="email">Account Number</label> <input type="number"
									class="form-control" id="username" aria-describedby="emailHelp"
									name="toCardNo" placeholder="Enter card Id.." required>
							</div>

							<div class="form-group">
								<label for="email">Amount</label> <input type="number"
									class="form-control" id="username" aria-describedby="emailHelp"
									name="amount" placeholder="Enter amount.." required>
							</div>

							<div class="form-group">
								<label for="email">Pin</label> <input type="password"
									class="form-control" id="username" aria-describedby="emailHelp"
									name="pin" placeholder="Enter pin.." required>
							</div>

							<div class="container text-center">
								<button class="btn custom-bg text-color">
									<b>Fund Transfer</b>
								</button>
							</div>

						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>