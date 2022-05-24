<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!--  <!DOCTYPE html>
 <html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<form action="/member/loginPost" method="post">
id: <input name="userid"><br>
pw: <input name="userpw" type="password"><br>
<input type="submit" value="login">
</form>




</body>
</html>  -->


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
    

    

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link rel="apple-touch-icon" href="https://getbootstrap.com/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="https://getbootstrap.com//docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="https://getbootstrap.com/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="https://getbootstrap.com/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="https://getbootstrap.com/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="https://getbootstrap.com/docs/5.1/assets/img/favicons/favicon.ico">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<meta name="theme-color" content="#7952b3">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <link href="https://getbootstrap.com/docs/5.1/examples/sign-in/signin.css" rel="stylesheet">
    
  </head>
  <div>
  </div>
  <body class="text-center">
  <header>
  <nav class="fixed-top">
  <jsp:include page="../header.jsp"></jsp:include>
  </nav>
  </header>
<main class="form-signin">
  <form action="/member/loginPost" method="post" id="loginform">
    <i class="bi bi-person-badge" style="font-size: 10rem;"></i>
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating">
      <input class="form-control" name="userid" id="userid">
      <label for="floatingInput">User ID</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" name="userpw" id="userpw">
      <label for="floatingPassword">Password</label>
    </div>

    <button class="w-100 btn btn-lg btn-primary" type="submit" id="loginbtn">로그인</button>
  </form>
    <button style="margin-top: 5px;" class="w-100 btn btn-lg btn-primary" type="submit" id="signupbtn">회원가입</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
  
</main> 
  	<script type="text/javascript">
		$(document).ready(function () {
			$("#signupbtn").click(function () {
				location.assign("/member/insert");
			});
			
			$("#loginbtn").click(function (event) {
				event.preventDefault();
				
			var userid = $("[name='userid']").val();
			if(userid ==''){
				alert("아이디를 입력해주세요.");
				$("[name='userid']").focus();
				return;
			}
			var userpw = $("[name='userpw']").val();
			if(userpw ==''){
				alert("비밀번호를 입력해주세요.");
				$("[name='userpw']").focus();
				return;
			}
			
			$.ajax({
				url : "/member/passCheck",
				type : "POST",
				dataType : "text",
				data : {
					userid : $("#userid").val(),
					userpw :$("#userpw").val()
				},
				success : function (data) {
					if(data==0){
						alert("아이디 또는 패스워드가 틀렸습니다.");
						return;
					}else{
						$("#loginform").submit();
					}
				}
				});
			
			});
		});
	</script>


	<footer>
	<nav class="fixed-bottom">
  <jsp:include page="../footer.jsp"></jsp:include>
  </nav>
  
  </footer>
  </body>
</html>
