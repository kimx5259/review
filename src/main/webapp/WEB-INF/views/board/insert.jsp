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
<jsp:include page="../header.jsp"></jsp:include>
</header>

<main>
	
	
	
			<div class="row mb-2 container" style="margin-top: 30px; justify-content: center; display: flex; margin: auto; margin-top: 10%; ">
		<div class="col-md-10" align="center" style=" width: 600px; text-align: center;">
				<h1>리뷰 작성</h1>
			<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static" >
					<form action="/board/insert" method="post">

						<div class="input-group mb-2">
							<span class="input-group-text" style="width: 130px;">제목</span> 
							<input class="form-control" name="title">
						</div>

						<div class="input-group mb-2">
							<span class="input-group-text" style="width: 130px;">작성자</span> 
							<input readonly class="form-control" name="userid" value="${mvo.userid }" style="background-color: white;">
						</div>

						<div class="input-group mb-2">
							<span class="input-group-text" style="width: 130px;">내용</span> 
							<textarea rows="10" cols="50" name="content"></textarea><br>
						</div>

						<input type="submit" value="리뷰작성완료">
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
</main>
	<script type="text/javascript">
		$(document).ready(function () {
			$("input[type='submit']").click(function (event) {
				event.preventDefault();
				
			var title = $("[name='title']").val();
			if(title ==''){
				$("[name='title']").focus();
				return;
			}
			var userid = $("[name='userid']").val();
			if(userid ==''){
				$("[name='userid']").focus();
				return;
			}
			var content = $("[name='content']").val();
			if(content ==''){
				$("[name='content']").focus();
				return;
			}
			$("form").submit();
			
			
			});
			
			
		});
	</script>
	<footer style="position: fixed; bottom: 0; width: 100%;">
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</body>
</html>