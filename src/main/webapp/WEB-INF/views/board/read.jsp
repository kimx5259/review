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
  <script src="/resources/js/test.js" type="text/javascript"></script>
<style type="text/css">
	#replyContainer{
		display: none;
		margin-top: 20px;
	}
	
</style>

</head>
<body>
<header>
<jsp:include page="../header.jsp"></jsp:include>
</header>

	<div class="row mb-2 container" style="margin-top: 30px; justify-content: center; display: flex; margin: auto; margin-top: 5%; ">
		<div class="col-md-10" align="center" style=" width: 600px; text-align: center;">
			<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static" >
					<div>

						<div class="input-group mb-2">
							<span class="input-group-text" style="width: 130px;">제목</span> 
							<input class="form-control" name="title" value="${vo.title}" readonly style="background-color: white;">
						</div>

						<div class="input-group mb-2">
							<span class="input-group-text" style="width: 130px;">작성자</span> 
							<input readonly class="form-control" name="userid" value="${vo.userid}" style="background-color: white;">
						</div>
						<div class="input-group mb-2">
							<span class="input-group-text" style="width: 130px;">작성일</span> 
							<input readonly class="form-control" name="userid" value="${vo.updatedate}" style="background-color: white;">
						</div>
						<div class="input-group mb-2">
							<span class="input-group-text" style="width: 130px;">조회수</span> 
							<input readonly class="form-control" name="userid" value="${vo.viewcnt}" style="background-color: white;">
						</div>

						<div class="input-group mb-2">
							<span class="input-group-text" style="width: 130px;">내용</span> 
							<textarea rows="10" cols="50" name="content" readonly>${vo.content}</textarea><br>
						</div>
						<c:choose>
							<c:when test="${login.userid == vo.userid}">
								<button class="updateui btn btn-primary">수정</button>
								<button class="delete btn btn-info">삭제</button>
								<button class="list btn btn-info">목록</button>
									<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									댓글</button>

								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">댓글 달기</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												작성자: <input id="replyer" value="${login.userid}" readonly><br>
												댓글: <input id="reply"><br>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>
												<button id="replyinput" type="button"
													class="btn btn-primary">댓글완료</button>
											</div>
										</div>
									</div>
								</div>
								<br>
							</c:when>
							<c:when test="${login.userid != vo.userid}">
								<button class="list btn btn-info">목록</button>
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									댓글</button>

								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">댓글 달기</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												작성자: <input id="replyer" value="${login.userid}" readonly><br>
												댓글: <input id="reply"><br>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>
												<button id="replyinput" type="button"
													class="btn btn-primary">댓글완료</button>
											</div>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>




<!-- 삭제할때 get방식이 아닌 post방식으로 삭제하기 위한 form 태그 생성 -->
<form name="fordelete"></form>

	<div id="replies" class="mt-4">
		
	</div>


	<script type="text/javascript">
	var bno = ${vo.bno};
	$(document).ready(function() {
		
		getAllReplies(bno, $("#replies"));
		
		
		$("#replyinput").click(function(event) {
			event.preventDefault();
			var replyer = $("#replyer").val();
			var reply = $("#reply").val();
			
			if(replyer == ''){
				$("#replyer").focus();
				return;
			}
			if(reply == ''){
				$("#reply").focus();
				return;
			}
			
			$.ajax({
				type : "post",
				url : "/replies",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-override" : "POST"
				},
				dataType : "text",
				data : JSON.stringify({
					bno : bno,
					replyer : replyer,
					reply : reply
				}),
				success : function(result) {
					$("#replyer").val("");
					$("#reply").val("");
					$("#replyContainer").hide();
					
					getAllReplies(bno, $("#replies"));
					
				}
			});
		});
		
		
		$("#replyshow").click(function() {
			$("#replyContainer").toggle();
		});
		
		
		
		$("body").on("click", ".updateui", function() {
			location.assign("/board/updateui/${vo.bno}/${curPage}");
		});
		
		$("body").on("click", ".delete", function() {
			$("[name='fordelete']").attr("action", "/board/delete/${vo.bno}/${curPage}");
			$("[name='fordelete']").attr("method", "post");
			$("[name='fordelete']").submit();
			
			
		});
		
		$("body").on("click", ".list", function() {
			location.assign("/board/list/${curPage}");
		});
	
			
	});


</script>

<footer style="position: flex; bottom: 0; width: 100%;">
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</body>
</html>