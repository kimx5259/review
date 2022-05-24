<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${empty login}">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<a class="navbar-brand" href="/">Home</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><a class="nav-link"
								href="/member/loginGet">로그인</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/member/insert">회원가입</a></li>
						</ul>
						<form class="d-flex">
							<input id="searchByName" class="form-control me-2" type="search" placeholder="회원검색"
								aria-label="Search">
							<button name="searchByName" class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</div>
			</nav>

		</c:when>
		<c:when test="${not empty login}">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<a class="navbar-brand" href="/">Home</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							
							<li class="nav-item"><a class="nav-link">${login.userid} 님, 환영합니다.</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/member/read/${login.userid}">회원정보조회</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/member/logout">로그아웃</a></li>
						</ul>
						<form class="d-flex">
							<input id="searchByName" class="form-control me-2" type="search" placeholder="회원검색"
								aria-label="Search">
							<button name="searchByName" class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</div>
			</nav>
		</c:when>
	</c:choose>
	
	
	<script type="text/javascript">
 $(document).ready(function() {
	 
	 $("[name='searchByName']").click(function (event) {
		event.preventDefault();
		var userid = document.getElementById("searchByName").value; 
		if(userid == ''){
			alert("검색하실 회원 아이디를 입력하세요");
			return;
		} 
		else{
		location.assign("/member/searchByName/"+userid);
		}
		
	});
	
});

</script>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		
</body>
</html>