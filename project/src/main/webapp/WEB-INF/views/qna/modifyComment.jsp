<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>          
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style>
.qna{
	margin:20px 20px;
	border-collapse: collapse;
}
.qna td, th{
	border-bottom:1px solid #eee; 
	padding:15px;
}
.qna input[type=text]{
	border:none;
	width:100%;
	height:50px;
	font-size:1rem;
}
textarea{
	border:none;
	width:100%;
	height:80px;
	resize:none;
	font-size:1.3rem;
}
.qlink{
	text-decoration:none;
	color:black;
	background:white;
	border:2px solid #c2c2d6;
	border-radius:20px; 
	padding:3px;
	font-size:13px;
}
caption{
	font-size:2rem;
	text-align:left;
	margin:10px 10px;
	border-bottom:2px solid #c2c2d6;
}
</style>
</head>
<body>
	<h2>modifyCommentForm.jsp</h2>
	<hr/>
	<form name="modify" id="modify" method="GET" action="${contextPath}/qna/modifyComment.do">
		<input type="hidden" name="qa_comment_id" value="${qnaComment.qa_comment_id}"/>
		<table class="qna" width="85%">
		  <caption>문의 글 수정</caption>
			<tr>
				<th style="width:15%">내용</th>
				<td><textarea name="content">${qnaComment.content}</textarea></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" value="${qnaComment.email}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:right;border-bottom:none;">
					<input type="submit" value="수정하기" class="qlink"/>
					<input type="reset" value="다시작성" class="qlink"/>
					<a href="${contextPath}/qna/qnaList.do" class="qlink">목록보기</a></td>
			</tr>
		</table>
	</form>
</body>
</html>