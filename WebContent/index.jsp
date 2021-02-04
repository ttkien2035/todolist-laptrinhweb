<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/body.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mymodal.css">
    <meta charset="utf-8">
    
    <!--====== Title ======-->
    <title>To do list app with Calendar, Planner, Reminders</title>
        
    <!--====== Magnific Popup CSS ======-->
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
        
    <!--====== Slick CSS ======-->
    <link rel="stylesheet" href="assets/css/slick.css">
        
    <!--====== Line Icons CSS ======-->
    <link rel="stylesheet" href="assets/css/LineIcons.css">
        
    <!--====== Bootstrap CSS ======-->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    
    <!--====== Default CSS ======-->
    <link rel="stylesheet" href="assets/css/default.css">
    
    <!--====== Style CSS ======-->
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
    .mymodal {
    /* display: block; */
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    right: 0;
    display: flex;
    /* justify-content: center;
    align-items: center; */
    display: none;
    padding: 1%;

    overflow: auto;
	border: none;
	
}

.mymodal-content {
	border-radius: 5px;
	border: none;
    position: relative;
    width: fit-content;
    height: fit-content;
    max-width: 50%;

    /* overflow: auto; */
    margin: auto;
    background:#c9daf9;

    animation-name: mymodalopen;
    animation-duration: 0.8s;
}

@keyframes mymodalopen {
    from {opacity: 0}
    to {opacity: 1}
}

.mymodal-header {
	font-family: 'Varela Round', sans-serif;
	background: #92b4f2;
	border-radius: 5px 5px 0 0;
	border:none;
    display: flex;
    justify-content: space-between;
    align-items: center;
    /* padding: 12px 32px 12px 48px; */
    padding: 8px 12px 8px 24px;
    color: #00002A;
}

.mymodal-header h3 {
    /* color: #CFD4DD; */
    font-size: 20px;
    /* font-weight: 400; */
    margin: 0;
}

.mymodal-header a.btn-close-mymodal {
    color:  #00002A;
    /* color: #CFD4DD; */
    /* opacity: 0.5; */
    /* padding: 4px; */
    border-radius: 50%;
}

.mymodal-header a.btn-close-mymodal:hover {
    /* opacity: 1; */
    color:  #00002A;
    background-color: rgba(113,102,249,0.1);
    cursor: pointer;
}

.mymodal-body {
    padding: 16px 48px;
    line-height: 1.5;
    color: #00002A;
}

.mymodal-body p {
    margin: 0;
}
.mymodal-footer {
	border:none;
    padding: 8px 48px;
    background: #92b4f2;
	border-radius: 0px 0px 5px 5px;
    display: flex;
    justify-content: space-evenly;
}

.mymodal-footer a.btn-on-mymodal {
    
    background-color: #7166F9;	
    background-image: 
        -webkit-linear-gradient(
            45deg,
            rgba(255, 255, 255, .4) 25%,
			transparent 25%,
            transparent 50%, 
            rgba(255, 255, 255, .4) 50%,
            rgba(255, 255, 255, .4) 75%,
            transparent 75%,
            transparent);

    padding: 12px 16px;
    border-radius: 6px;
    color: #ffffff;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    
}

.mymodal-footer a.btn-on-mymodal:hover {
    background-color: #4CD7F6;
}

input[type=submit].btn-submit-on-form {
    font-size: 14px;
    font-weight: 500;

    outline: none;

    width: fit-content;

    background-color: #3498db;
	
    padding: 8px 32px;
    color: #ffffff;
    border: none;
    border-radius: 5px;

    font-family: 'Varela Round', sans-serif;
    font-size: 16px;
    font-weight: 400;

    align-self: center;
}

input[type=submit].btn-submit-on-form:hover {
    background-color: #007bff;
    color: #ffffff;
    cursor: pointer;
    outline: none;
}


a.btn-open-mymodal {
    width: fit-content;

    background-color: #000000;	
    /* background-image: 
        -webkit-linear-gradient(
            45deg,
            rgba(255, 255, 255, .4) 25%,
			transparent 25%,
            transparent 50%, 
            rgba(255, 255, 255, .4) 50%,
            rgba(255, 255, 255, .4) 75%,
            transparent 75%,
            transparent); */

    padding: 8px 12px;

    color: #ffffff;
    /* font-size: 14px;
    font-weight: 500; */

    border: 4px #ffffff solid;
    border-radius: 30px;
    /* box-shadow: 5px 2px 10px rgba(0,0,0,0.1), 0 1px 2px rgba(0,0,0,0.2); */
    
    /* letter-spacing: 0.2em; */
    /* text-transform: uppercase; */
}

a.btn-open-mymodal:hover {
    background-color: #4CD7F6;
    cursor: pointer;
}

a.btn-open-mymodal svg {
    width: 16px;
    height: 16px;
    justify-content: middle;
    vertical-align: middle;
    display: inline-block;
    vertical-align:top;
}


/* responsive */
@media only screen and (max-width: 850px) {
    .mymodal {
        padding: 0px;
        overflow: auto;
    }
    
    .mymodal-content {
        width: 100%;
        height: auto;
        max-width: 100%;

        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .mymodal-header {
        width: 100%;
        padding: 8px 8px 8px 16px;
    }

    .mymodal-footer {
        width: 100%;
        padding: 8px 0px;
    }

    .mymodal-body {
        padding: 8px 0px;
    }
}
    </style>
</head>
<body>

<%
	String emailError = (String)request.getAttribute("emailError");
	if (emailError == null) emailError = "";
	String passwordError = (String)request.getAttribute("passwordError");
	if (passwordError == null) passwordError ="";
	String email = request.getParameter("email");
	if (email == null) email = "";
	String password = request.getParameter("password");
	String fullNameError = (String)request.getAttribute("fullNameError");
	if (fullNameError == null) fullNameError = "";
	
	String birthdateError = (String)request.getAttribute("birthdateError");
	if (birthdateError == null) birthdateError = "";
	if (password == null) password = "";
	
	String fullName = request.getParameter("fullName");
	if (fullName == null) fullName = "";
	
	String gender = request.getParameter("gender");
	String birthdate = request.getParameter("birthdate");
%>
<section id="home" style="height:500px;" class="slider_area">
    <div id="carouselThree" class="carousel slide" data-ride="carousel">

        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="slider-content">
                                <h1 class="title">Organize your life in seconds</h1>
                                <p class="text">Having a list of all your tasks will allow you to sit down and make a plan. One study showed that fifteen minutes spent planning could save an hour of execution time!</p>
                                <ul class="slider-btn rounded-buttons">
                                    <li><a class="main-btn rounded-one" id="btn-open-signupModal">SIGN UP</a></li>
                                    <li><a class="main-btn rounded-two"id="btn-open-loginModal">LOGIN</a></li><br>                                    
                                    <li><a href="reset-password.jsp" class="main-btn rounded-three"id="btn-open-loginModal">RESET PASSWORD</a></li>
                                </ul>
                            </div>
                        </div>
                    </div> <!-- row -->
                </div> <!-- container -->
                <div class="slider-image-box d-none d-lg-flex align-items-end">
                    <div class="slider-image" style="z-index: -100;position: relative;">
                        <img src="assets/images/slider/1.png" alt="Hero">
                    </div> <!-- slider-imgae -->
                </div> <!-- slider-imgae box -->
            </div> <!-- carousel-item -->

        
        </div>
    </div>
</section>
<div class="mymodal" id="loginModal" style="z-index:900000;">
    <div class="mymodal-content">
        
        <form action="${pageContext.request.contextPath}/login">
        <div class="mymodal-header">
            <h3>Login</h3>
            <a class="btn-close-mymodal" id="btn-close-loginModal">
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
                    <input type="email" name="email" value="<%= email%>">
                    
                    <div class="input-error">
                        <p><%= emailError %></p>
                      </div>
                                    
                </div>

                <div class="input-password">
                    <label for="password">Password</label>
                    <input type="password" name="password" value="<%= password%>">
                    
                    <div class="input-error">
                        <p><%= passwordError %></p>
                      </div>
                </div>
                <div>
                    <a href="reset-password.jsp">Reset password</a>
                </div>

            </div>
            
        </div>
        <div class="mymodal-footer">
            <input type="submit" value="Login" class="btn-submit-on-form">
        </div>
        </form>
    </div>
</div>
<div class="mymodal" id="signupModal" style="z-index:900000;">
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
                        <input type="text" name="fullname" value="<%= fullName %>">>
                    	
                    	<div class="input-error">
                    		<p><%= fullNameError %></p>
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

    <script src="${pageContext.request.contextPath}/js/indexform.js"></script>
    <script src="${pageContext.request.contextPath}/js/indexmodal.js"></script>

</body>
</html>