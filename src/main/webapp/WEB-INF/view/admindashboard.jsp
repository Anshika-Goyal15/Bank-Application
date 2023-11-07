<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminDashboard</title>
<%@ include file="components/common_cs_js.jsp"%>

</head>
<body>
	<%@ include file="components/navbar.jsp"%>

	<div class="container admin mt-2">
		<%@ include file="components/message.jsp"%>
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card hover" data-toggle="modal"
					data-target="#show-users-modal">
					<div class="card-body text-center">
						<div class="container"></div>
						<p>click here to see:</p>
						<h2 class="text-muted">Total Customers</h2>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card hover" data-toggle="modal"
					data-target="#total-account-modal">
					<div class="card-body text-center">
						<div class="container"></div>
						<p>click here to see:</p>
						<h2 class="text-muted">Total Accounts</h2>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card hover" data-toggle="modal"
					data-target="#show-transaction-modal">
					<div class="card-body text-center">
						<div class="container"></div>
						<p>click here to see:</p>
						<h2 class="text-muted">Total Transaction</h2>
					</div>
				</div>
			</div>
		</div>





	</div>



	<!-- show users modal -->

	<div class="modal fade" id="show-users-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white text-center">
					<h5 class="modal-title" id="exampleModalLongTitle">Total
						Customer</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
						<table class="table">
							<thead class="custom-bg text-white">
								<tr>
								<tr>
									<th scope="col">Customer Id</th>
									<th scope="col">First Name</th>
									<th scope="col">Last Name</th>
									<th scope="col">Mobile No</th>
									<th scope="col">Date of Birth</th>
									<th scope="col">Gender</th>
									<th scope="col">Branch</th>
									<th scope="col">Permanent Address</th>
									<th scope="col">Present Address</th>
									<th scope="col">Register Date</th>
								</tr>
								</tr>
							</thead>
							<%
							List<Customer> customers = customerDao.findAll();
							%>
							<tbody>
								<%
								if (customers != null) {
									for (Customer c : customers) {

										Branch b = null;
										Optional<Branch> ob = branchDao.findById(c.getBranchId());
										if (ob.isPresent()) {
									b = ob.get();
										}
								%>
								<tr>
									<td class="mid-align"><%=c.getId()%></td>
									<td class="mid-align"><%=c.getFirstName()%></td>
									<td class="mid-align"><%=c.getLastName()%></td>
									<td class="mid-align"><%=c.getPhoneNumber()%></td>
									<td class="mid-align"><%=c.getDob()%></td>
									<td class="mid-align"><%=c.getGender()%></td>
									<td class="mid-align"><%=b.getName()%></td>
									<td class="mid-align"><%=c.getPermentAddress()%></td>
									<td class="mid-align"><%=c.getPresentAddress()%></td>
									<td class="mid-align"><%=c.getDate()%></td>
								</tr>
								<%
								}
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- end of show users modal -->

	<!-- total users modal -->

	<div class="modal fade" id="total-account-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white text-center">
					<h5 class="modal-title" id="exampleModalLongTitle">Total
						Account</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
						<table class="table">
							<thead class="custom-bg text-white">
								<tr>
									<th scope="col">Account Id</th>
									<th scope="col">Customer Name</th>
									<th scope="col">Phone</th>
									<th scope="col">Email Id</th>
									<th scope="col">Card No</th>
									<th scope="col">Pin</th>
									<th scope="col">Account Type</th>
									<th scope="col">Account Status</th>
									<th scope="col">Change Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								List<Account> accounts = accountDao.findAll();
								%>

								<%
								if (accounts != null) {
									for (Account acc : accounts) {

										Customer cust = null;

										Optional<Customer> oc = customerDao.findById(acc.getCustomerId());
										if (oc.isPresent()) {
									cust = oc.get();
										}
								%>
								<tr>
									<td class="mid-align"><%=acc.getId()%></td>
									<td class="mid-align"><%=cust.getFirstName() + " " + cust.getLastName()%></td>
									<td class="mid-align"><%=cust.getPhoneNumber()%></td>
									<td class="mid-align"><%=cust.getEmailId()%></td>
									<td class="mid-align"><%=acc.getCardNo()%></td>
									<td class="mid-align">*****</td>
									<td class="mid-align"><%=acc.getType()%></td>
									<td class="mid-align"><%=acc.getStatus()%></td>
									<%
									if (acc.getStatus().equals(Constants.AccountStatus.OPEN.value())) {
									%>
									<td class="mid-align"><a
										href="changeAccountStatus?accountId=<%=acc.getId()%>&accountStatus=<%=Constants.AccountStatus.LOCK.value()%>"><button
												type="button" class="btn custom-bg text-white">Lock</button>
									</a></td>
									<%
									} else {
									%>
									<td class="mid-align"><a
										href="changeAccountStatus?accountId=<%=acc.getId()%>&accountStatus=<%=Constants.AccountStatus.OPEN.value()%>"><button
												type="button" class="btn custom-bg text-white">Open</button>
									</a></td>
									<%
									}
									%>
								</tr>
								<%
								}
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ********************* -->

	<!-- show transaction modal -->

	<div class="modal fade" id="show-transaction-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white text-center">
                <h5 class="modal-title" id="exampleModalLongTitle">Total Transactions</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <!-- Input fields for date filtering -->
                <div class="row mt-3">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="startDate">Start Date:</label>
                            <input type="date" id="startDated" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="endDate">End Date:</label>
                            <input type="date" id="endDated" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-primary" onclick="filterTransactions()">Filter</button>
                    </div>
                </div>

                <div class="table-responsive" id="transactionTable1">
                    <table class="table" id="transactionTable1">
                        <thead class="custom-bg text-white">
                            <tr>
                                <th scope="col">Customer Name</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Email Id</th>
                                <th scope="col">Card No</th>
                                <th scope="col">To Card No</th>
                                <th scope="col">Transaction Type</th>
                                <th scope="col">Amount</th>
                                <th scope="col">Transaction Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            List<AccountTransaction> transactions = accountTransactionDao.findAll();
                            transactions.sort(Comparator.comparing(AccountTransaction::getDate).reversed());
                            %>

                            <%
                            if (transactions != null) {
                                for (AccountTransaction transaction : transactions) {

                                    Account acc = null;
                                    Optional<Account> oa = accountDao.findById(transaction.getAccountId());
                                    if (oa.isPresent()) {
                                        acc = oa.get();
                                    }

                                    Customer cust = null;

                                    Optional<Customer> oc = customerDao.findById(acc.getCustomerId());
                                    if (oc.isPresent()) {
                                        cust = oc.get();
                                    }
                            %>
                            <tr>
                                <td class="mid-align"><%=cust.getFirstName() + " " + cust.getLastName()%></td>
                                <td class="mid-align"><%=cust.getPhoneNumber()%></td>
                                <td class="mid-align"><%=cust.getEmailId()%></td>
                                <td class="mid-align"><%=acc.getCardNo()%></td>

                                <%
                                if (acc.getType().equals(Constants.TransactionType.ACCOUNT_TRANSFER.value())) {
                                %>
                                <td class="mid-align"><%=accountDao.getById(transaction.getToAccountId()).getCardNo()%></td>
                                <%
                                } else {
                                %>
                                <td class="mid-align">---</td>
                                <%
                                }
                                %>

                                <td class="mid-align"><%=transaction.getType()%></td>
                                <td class="mid-align"><%=transaction.getAmount()%></td>
                                <td class="mid-align"><%=transaction.getDate()%></td>

                            </tr>
                            <%
                            }
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function filterTransactions() {
        var startDateStr = document.getElementById("startDated").value;
        var endDateStr = document.getElementById("endDated").value;
        var startDate = new Date(startDateStr);
        var endDate = new Date(endDateStr);
        console.log(startDate);
        console.log(endDate);

        // Perform filtering here based on the 'startDate' and 'endDate' values
        // You can use JavaScript to hide/show table rows based on the date range

        // Example: Loop through all rows in the table and hide/show based on date
        // Check if the input date strings are valid
        if (isNaN(startDate) || isNaN(endDate)) {
            alert("Invalid date format. Please use yyyy-mm-dd.");
            return;
        }

        // Include the end of the day for the endDate
        endDate.setHours(23, 59, 59, 999);
        
        var table = document.getElementById("transactionTable1");
        var rows = table.getElementsByTagName("tr");

        for (var i = 1; i < rows.length; i++) { // Start from 1 to skip the header row
            var transactionDate = new Date(rows[i].cells[7].innerHTML); // Assuming date is in the 7th column
            if (transactionDate >= startDate && transactionDate <= endDate) {
                rows[i].style.display = "table-row"; // Show the row
            } else {
                rows[i].style.display = "none"; // Hide the row
            }
        }
    }
</script>




</body>
</html>