<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
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
<header>
		<nav >
			<jsp:include page="../header.jsp" />
		</nav>
	</header>

		<div class="row mb-2 container" style="margin-top: 30px; justify-content: center; display: flex; margin: auto; margin-top: 10%; ">
		<div class="col-md-10" align="center" style=" width: 600px; text-align: center;">
			<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static" >

					<form action="/member/insert" method="post" id="insertform">
						<div class="input-group mb-2">
							<span class="input-group-text" style="width: 130px;">아이디</span> 
							<input class="form-control" id="userid" name="userid" maxlength="6"> &nbsp;&nbsp;
							<button id="idcheck" type="button" class="btn btn-secondary" style="border-radius: 10px;">중복검사</button> &nbsp;
							<div style="height: 20px; margin: auto; " >
							<p id="idCheckResult" style="background-color: powderblue; border-radius: 5px;" >${name}</p>
							</div>
						</div>

						<div class="input-group mb-2">
							<span class="input-group-text" style="width: 130px;">비밀번호</span> 
							<input class="form-control" type="password" id="userpw" name="userpw" maxlength="10">
						</div>
						<div class="input-group mb-2">
							<span class="input-group-text" style="width: 130px;">비밀번호 확인</span> 
							<input class="form-control" type="password" id="userpw2" name="userpw2" maxlength="10">
						</div>

						<div class="input-group mb-2">
							<span class="input-group-text" style="width: 130px;">이름</span> 
							<input class="form-control" id="username" name="username" maxlength="15">
						</div>

						<div class="input-group mb-2">
							<span class="input-group-text" style="width: 130px;">이메일</span> 
							<input type="email" class="form-control" maxlength="30" id="email" name="email" placeholder="사용하시는 이메일 주소를 넣어주세요">
						</div>

						<input type="submit" id="signup" value="회원 등록">
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function () {
			
			$("#signup").click(function(event) {
				event.preventDefault();
				var userid = $("[name='userid']").val();
				var userpw = $("[name='userpw']").val();
				var userpw2 = $("[name='userpw2']").val();
				var username = $("[name='username']").val();
				var email = $("[name='email']").val();
				var idCheckResult = document.getElementById("idCheckResult").innerHTML;
				
				if(userid==''){
					alert("id를 입력하세요");
					$("[name='userid']").focus();
					return;
				}
				if(userpw==''){
					alert("비밀번호를 입력하세요");
					$("[name='userpw']").focus();
					return;
				}
				if(userpw2==''){
					alert("비밀번호 확인칸을 입력하세요");
					$("[name='userpw2']").focus();
					return;
				}
				if(username==''){
					alert("성함을 입력하세요");
					$("[name='username']").focus();
					return;
				}
				if(email==''){
					alert("이메일을 입력하세요");
					$("[name='email']").focus();
					return;
				}
				if(userpw!=userpw2){
					alert("비밀번호가 일치하지 않습니다");
					return;
				} 
				if(idCheckResult==''){
					alert("아이디 중복검사를 해주세요.");
					return;
				}
				if(idCheckResult=="사용불가"){
					alert("사용불가능한 아이디 입니다. 아이디를 변경하고 중복검사를 다시 해주세요.");
					return;
				}
				else{
					$("form").submit();
				}
				
			});
			
			$("#idcheck").click(function (event) {
				event.preventDefault();
				var userid = $("[name='userid']").val();
				if(userid ==''){
					$("[name='userid']").focus();
				} else{
					/* ajax통신 */
					$.ajax({
						type : 'post',
						url : '/member/idcheck',
						data : {
							'userid' : userid
						},
						dataType : 'text',
						success : function (result) {
								$("p#idCheckResult").text(result);
						}
					});
				}
				
			});
			
		});
	
	</script>
	
	<footer>
		<nav class="fixed-bottom">
			<jsp:include page="../footer.jsp" />
		</nav>
	</footer>

</body>
</html>