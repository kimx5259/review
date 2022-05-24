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
	<h1>글 수정</h1>
	
	<form action="/board/update/${vo.bno}/${curPage}" method="post">
		제목: <input name="title" value="${vo.title}"><br>
		작성자: <input name="userid" value="${vo.userid}"><br>
		내용: <br>
		<textarea rows="10" name="content">${vo.content}</textarea><br>
		<input type="submit" value="글 수정 완료">
		
	
	</form>
	
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

</body>
</html>