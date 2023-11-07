<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Pin</title>
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
                    <h3 class="text-center my-3">Change Pin..!!</h3>
                    <form onsubmit="return validateForm()" action="changepin" method="post">
                        <div class="form-group">
                            <label for="currentpin">Current Pin</label>
                            <input type="password" class="form-control" id="currentpin" name="currentpin" placeholder="Enter current pin.." required>
                        </div>

                        <div class="form-group">
                            <label for="newpin">New Pin</label>
                            <input type="password" class="form-control" id="newpin" name="newpin" placeholder="Enter new pin.." required>
                        </div>

                        <div class="form-group">
                            <label for="rnewpin">Repeat New Pin</label>
                            <input type="password" class="form-control" id="rnewpin" name="rnewpin" placeholder="Re-enter new pin.." required>
                        </div>

                        <div class="container text-center">
                            <button type="submit" class="btn custom-bg text-color"><b>Change Pin</b></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript to validate the "New Pin" and "Repeat New Pin" fields -->
<script>
    function validateForm() {
        var newPin = document.getElementById("newpin").value;
        var rNewPin = document.getElementById("rnewpin").value;

        if (newPin !== rNewPin) {
            alert("New Pin and Repeat New Pin do not match. Please re-enter.");
            return false; // Prevent form submission
        }

        // Continue with form submission if the pins match
        return true;
    }
</script>
</body>
</html>