<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Email to Reset Password</title>
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
    <script src="https://kit.fontawesome.com/8a5c84a665.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        body{
        background:#c9daf9;
        font-family: 'Roboto', sans-serif;
        }
        input[type=submit] {
	    font-size: 14px;
	    font-weight: 500;
	
	    outline: none;
	    width: fit-content;
	    background-color: #3498db;
	    height: 50px;
	    padding: 8px 32px;
	    color: #ffffff;
	    border: none;
	    border-radius: 5px;
	
	    font-family: 'Varela Round', sans-serif;
	    font-size: 16px;
	    font-weight: 400;
	
	    align-self: center;
		}
		input[type=submit]:hover {
		    background-color: #007bff;
		    color: #ffffff;
		    cursor: pointer;
		    outline: none;
		}
		input[type=text],input[type=password]{
		     width: 100%;
		    height: 30px;
		    max-width: 250px;
		    border: 3px solid #3498db;
		    border-radius: 5px;
		    padding: 8px 24px;
		    margin: 4px 0px;
		    font-size: 20px;
		    justify-self: center;
		}
		input[type=text]:hover{
		    border: 3px solid #007bff;
		}
		.signin-signup{
			padding:20px;
		    width: 50%;
		    position: fixed;
		    top: 30%;
		    right: 25%;
		    border: none;
		    border-radius:10px;
		    background:#92b4f2;
		}
        </style>  
</head>
<body>
    <div class="container">
    	<div class="signin-signup">
	    	<div class="title">
	        	<h2>Reset Password</h2>
	       	</div>
	
	
	
	
	
	
	
	       	<div class="reset-password-form-container">
	        	<form action="resetPassword" method="post">
	            	<div class="form-component">
				        <table>
							<tr>
								<td><label>Email     </label></td>
								<td><input type="text" name="email" value="<c:out value='${email}'/>" required>
	                 				<p style="color: red;"><i><c:out value="${emailError}"/></i></p>
	                 			</td>
							</tr>
							<tr>
								<td><label>New Password</label></td>
								<td><input type="password" name="password" value="<c:out value='${password}'/>" required>
	                  	<p></p>
	                 			</td>
							</tr>
						</table>
	                </div>
	                        
	              	<div class="form-component">
	                	<input type="submit" value="Reset">
	               	</div>   
	  			</form>
	    	</div>
	    </div>
	</div>
    
</body>
</html>