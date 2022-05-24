<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>


<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<h1 style="text-align: center; margin: 10px;">게시글 목록</h1>
	<button class="list btn btn-primary" id="write" style="margin: 8px; float: right;">게시글 작성</button>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">게시글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pt.list}" var="vo">
				<tr>
					<td>${vo.bno}</td>
					<td><a href="/board/read/${vo.bno}/${pt.curPage}">${vo.title}</a></td>
					<td>${vo.userid}</td>
					<td>${vo.updatedate}</td>
					<td>${vo.viewcnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#write").click(function() {
				location.assign("/board/insertui/${login.userid}");
			});
		});
	
	</script>
	<div style="margin-left: 45%;">
	<jsp:include page="page.jsp" ></jsp:include>
	</div>
	<footer style="position: fixed; bottom: 0; width: 100%;">
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>