<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>



<%-- 	<form action="/member/update" method="post">
		userid: <input readonly name="userid" value="${vo.userid}"><br>
		userpw: <input name="userpw" type="password"><br>
		username: <input name="username" value="${vo.username}"><br>
		email: <input name="email" value="${vo.email}"><br> 
		<input type="submit" value="수정완료">
	</form> --%>
	<form action="/member/update" method="post">
	<div style="position: relative; left: 350px; margin-top: 100px; width: 50%;">
		<div style="text-align: center;">
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default" style="width: 160px;">회원아이디</span>
				<input style="background-color: white;" readonly type="text" name="userid" id="info" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" value="${vo.userid}">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default" style="width: 160px;">회원비밀번호</span>
				<input type="password" name="userpw" id="info" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default" style="width: 160px;">회원이름</span>
				<input type="text" name="username" id="info" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" value="${vo.username}">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default" style="width: 160px;">회원이메일</span>
				<input type="text" name="email" id="info" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" value="${vo.email}">
			</div>
			<input type="submit" class="btn btn-success" value="수정완료">	
		</div>
	</div>
	</form>

	<script type="text/javascript">
		$(document).ready(function() {
			$("input[type='submit']").click(function (event) {
				event.preventDefault();
				
				var pw = $("[name='userpw']").val();
				var username = $("[name='username']").val();
				var email =$("[name='email']").val();
				if(pw=='' || pw!=${vo.userpw}){
					alert("회원 비밀번호를 확인해주세요.");
					$("[name='userpw']").focus();
					return;
				}
				if(username ==''){
					alert("회원이름을 작성하세요.");
					$("[name='username']").focus();
					return;
				}
				if(email==''){
					alert("이메일을 입력하세요");
					$("[name='email']").focus();
					return;
				} else{
				$("form").submit();
				}
				
			});
		});
	
	</script>

	<footer style="position: fixed; bottom: 0; width: 100%;">
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>