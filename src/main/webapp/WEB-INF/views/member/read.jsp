<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	
<style type="text/css">
	#info{
		background-color: white;
	}


</style>
</head>

<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>

	<div style="position: relative; left: 350px; margin-top: 100px; width: 50%;">
		<div style="text-align: center;">
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default" style="width: 160px;">회원아이디</span>
				<input readonly type="text" id="info" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" value="${vo.userid}">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default" style="width: 160px;">회원이름</span>
				<input readonly type="text" id="info" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" value="${vo.username}">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default" style="width: 160px;">회원이메일</span>
				<input readonly type="text" id="info" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" value="${vo.email}">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default" style="width: 160px;">회원가입날짜</span>
				<input readonly type="text" id="info" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" value="${fn:substring(vo.regdate, 0, 10)} ${fn:substring(vo.regdate, 23, 28)}">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default" style="width: 160px;">회원정보 수정날짜</span>
				<input readonly type="text" id="info" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" value="${fn:substring(vo.updatedate, 0, 10)} ${fn:substring(vo.updatedate, 23, 28)}">
			</div>
			<button name="update" class="btn btn-success">회원정보수정</button>
			<button name="delete" class="btn btn-danger">회원탈퇴</button>
			<button name="list" class="btn btn-info">회원목록</button>
		</div>
	</div>

	<!-- 회원탈퇴를 하기위해 post형식이 필요함 -> form태그가 필요 -->
	<form></form>


	<script type="text/javascript">
		//jquery사용
		$(document)
				.ready(
						function() {
							$("[name='update']").click(function() {
								location.assign("/member/update/${vo.userid}");
							});

							$("[name='delete']").click(
											function() {
												var userpw = prompt("비밀번호를 입력하세요.");
												$("form")
														.attr("method", "post");
												$("form").attr("action",
														"/member/delete");
												$("form")
														.append(
																'<input type="password" name="userpw" value="'+userpw+'">');
												$("form")
														.append(
																'<input type="hidden" name="userid" value="${vo.userid}">');
												if(userpw=='' || userpw!=${vo.userpw}){
													alert("비밀번호가 일치하지 않습니다.");
													return;
												} else{
													alert("회원이 성공적으로 탈퇴되었습니다.")
												$("form").submit();
												}
											});

							
							$("[name='list']").click(function() {
								location.assign("/member/list");
							});
						});
	</script>

	<footer style="position: fixed; bottom: 0; width: 100%;">
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>