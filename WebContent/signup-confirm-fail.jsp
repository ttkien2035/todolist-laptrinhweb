

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Sign Up Fail !!!</title>        
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
            <div class="forms-container">
                <div class="signin-signup">
                    <form action="signup-confirm.jsp" class="sign-in-form" id="form" method="post">
                        <h2 class="title">Mã xác nhận không chính xác </h2>
                        <input type="submit" class="btn" value="Nhập lại ?" />                       
                    </form>
                </div>
                
            </div>
            <div class="panels-container">
                <div class="panel right-panel">
                </div>
            </div>
        </div>
    
    </body>
</html>