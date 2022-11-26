<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
.navbar-default {
    border-color: transparent;
    background-color: #f3b9b9;
}

.navbar-default .navbar-brand {
    font-family: "Kaushan Script","Helvetica Neue",Helvetica,Arial,cursive;
    color: white;
}

.navbar-default .navbar-brand:hover,
.navbar-default .navbar-brand:focus,
.navbar-default .navbar-brand:active,
.navbar-default .navbar-brand.active {
    color: #ff5c5c;
}

.navbar-default .navbar-collapse {
    border-color: rgba(255,255,255,.02);
}

.navbar-default .navbar-toggle {
    border-color: #f3b9b9;
    background-color: #f3b9b9;
}

.navbar-default .navbar-toggle .icon-bar {
    background-color: #fff;
}

.navbar-default .navbar-toggle:hover,
.navbar-default .navbar-toggle:focus {
    background-color: #fda4a4;
}

.navbar-default .nav li a {
    text-transform: uppercase;
    font-family: Montserrat,"Helvetica Neue",Helvetica,Arial,sans-serif;
    font-weight: 400;
    letter-spacing: 1px;
    color: #fff;
}

.navbar-default .nav li a:hover,
.navbar-default .nav li a:focus {
    outline: 0;
    color: #fda4a4;
}

.navbar-default .navbar-nav>.active>a {
    border-radius: 0;
    color: #fff;
    background-color: #fda4a4;
}

.navbar-default .navbar-nav>.active>a:hover,
.navbar-default .navbar-nav>.active>a:focus {
    color: #fff;
    background-color: #17d0d5;
}

@media(min-width:768px) {
    .navbar-default {
        padding: 25px 0;
        border: 0;
        background-color: transparent;
        -webkit-transition: padding .3s;
        -moz-transition: padding .3s;
        transition: padding .3s;
    }

    .navbar-default .navbar-brand {
        font-size: 2em;
        -webkit-transition: all .3s;
        -moz-transition: all .3s;
        transition: all .3s;
    }

    .navbar-default .navbar-nav>.active>a {
        border-radius: 3px;
    }

    .navbar-default.navbar-shrink {
        padding: 10px 0;
        background-color: #f3b9b9;
        box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
    }

    .navbar-default.navbar-shrink .navbar-brand {
        font-size: 1.5em;
    }
}
</style>
<body>
	<%
		String userID = null;
		//세선 정보가 있으면
		if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		}
		
	%>
	<nav class="navbar navbar-default navbar-fixed-top navbar-shrink">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="index.jsp">하루 한 권</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden active">
                        <a href="#page-top"></a>
                    </li>
                    <li class="">
                        <a class="page-scroll" href="searchBooks.jsp">Search</a>
                    </li>
                    <li class="">
                        <a class="page-scroll" href="reservation.jsp">Reservation</a>
                    </li>
                    <li class="">
                        <a class="page-scroll" href="inquiry.jsp">Inquiry</a>
                    </li>
                    <%
                    	if(userID == null) {
                    %>
				     <li class="">
                   	    <a class="page-scroll" href="login.jsp">Sign In / Up</a>
                   	</li>                
                    <%
                    	} else {
                    %>
                    <li class="">
                   	    <a class="page-scroll" href="logoutAction.jsp">LogOut</a>
                   	</li>  
                    <%
                    	}
                    %>
                </ul>
            </div>        
        </div>
    </nav>
</body>
</html>