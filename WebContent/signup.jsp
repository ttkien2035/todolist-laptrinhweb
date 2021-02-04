<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/body.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mymodal.css">
    
</head>
<body>

<%
	String emailError = (String)request.getAttribute("emailError");
	if (emailError == null) emailError = "";
	
	String passwordError = (String)request.getAttribute("passwordError");
	if (passwordError == null) passwordError ="";
	
	String fullnameError = (String)request.getAttribute("fullnameError");
	if (fullnameError == null) fullnameError = "";
	
	String birthdateError = (String)request.getAttribute("birthdateError");
	if (birthdateError == null) birthdateError = "";
	
	String email = request.getParameter("email");
	if (email == null) email = "";
	
	String password = request.getParameter("password");
	if (password == null) password = "";
	
	String fullname = request.getParameter("fullname");
	if (fullname == null) fullname = "";
	
	String gender = request.getParameter("gender");
	String birthdate = request.getParameter("birthdate");
%>
    <a id="btn-open-signupModal" class="btn-open-mymodal">Sign Up</a>
    <div class="mymodal" id="signupModal">
        <div class="mymodal-content">
        
        	<form action="${pageContext.request.contextPath}/signup">
            <div class="mymodal-header">
                <h3>Sign Up</h3>
                <a class="btn-close-mymodal" id="btn-close-signupModal">
                    <span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                        </svg>
                    </span>
                </a>
            </div>
            <div class="mymodal-body">
                <div class="form-container">
                    

                    <div class="input-text">
                        <label for="email">Email:</label>
                        <input type="text" name="email" value="<%= email %>">
                        
                        <div class="input-error">
                    		<p><%= emailError %></p>
                      	</div>
                    </div>
    
                    <div class="input-password">
                        <label for="password">Password</label>
                        <input type="password" name="password" value="<%= password %>">
                        
                        <div class="input-error">
                    		<p><%= passwordError %></p>
                      	</div>
                    </div>

                    <div class="input-text">
                        <label for="fullname">Your name</label>
                        <input type="text" name="fullname" value="<%= fullname %>">
                    	
                    	<div class="input-error">
                    		<p><%= fullnameError %></p>
                      	</div>
                    </div>

                    <div class="input-radio">
                        <label>Gender</label>
                        <div class="radio-btn">
            
                            <input type="radio" id="male" name="gender" value=True checked>
                            <label for="male">Male</label>
                        
                            <input type="radio" id="female" name="gender" value=False 
                            	<% if (gender != null && gender.equals("False")) { %> checked <% } %> />
                            <label for="female">Female</label>
            
                        </div>
                    </div>

                    <div class="input-date">
                        <label for="birthdate">Birthdate</label>
                        <input type="date" name="birthdate" value=" <%= birthdate %>">
                        
                        <div class="input-error">
                    		<p><%= birthdateError %></p>
                      	</div>
                    </div>

                </div>
            </div>
            <div class="mymodal-footer">
                <input type="submit" value="Signup" class="btn-submit-on-form">
            </div>
            
         	</form>
        </div>
    </div>

    <%-- <script src="${pageContext.request.contextPath}/js/todoform.js"></script> --%>
    <script src="${pageContext.request.contextPath}/js/signupmodal.js"></script>

</body>
</html>