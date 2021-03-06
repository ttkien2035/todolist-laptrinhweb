

<%@page import="mail.RandomString"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
  
	String email = (String)request.getSession().getAttribute("email");
	String password = (String)request.getSession().getAttribute("password");
    String code = (String)request.getSession().getAttribute("code");
   
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Nhập mã xác của bạn</title>      
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
		input[type=text]{
		     width: 100%;
		    height: 30px;
		    max-width: 250px;
		    border: 3px solid #3498db;
		    border-radius: 5px;
		    padding: 8px 24px;
		    margin: 4px 0px;
		    font-size: 16px;
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
                    <form action="ResetPassConfirm" class="sign-in-form" id="form" method="post">
                        <h2 class="title">Mã xác nhận đã được gửi đến <%=email       %></h2>
                        <h2 class="title">Nhập mã xác nhận để xác minh danh tính</h2>
                        <input type="text" name="maxacnhan" placeholder="Mã xác nhận">
                        <input type="hidden" name="code" value="<%=code%>">
                        <input type="submit" class="btn" value="Xác nhận" />                       
                    </form>
                </div>
                
            </div>
        </div>
    
    </body>
</html>
