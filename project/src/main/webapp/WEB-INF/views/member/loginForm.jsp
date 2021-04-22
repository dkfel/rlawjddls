<%@ page language="java" 		  contentType="text/html; charset=utf-8"
				  pageEncoding="utf-8"  isELIgnored="false" %>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<script>
	$(function(){
		$("#frm1").submit(function(
			var email=$("input[name=email]").val();  		
			email=$.trim(email);
			if(!email){
				alert("이메일을 입력해 주세요")
			}//if
			
			var pwd=$("input[name=password]").val();  		
			pwd=$.trim(pwd);
			if(!pwd){
				alert("비밀번호를 입력해 주세요");
			}//if
		));
		
	});
</script>
<title>로그인</title>
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css" />
</head>
<body>
		<div id="preview">
				<div class="login">
						<div class="container">
										<div class="jumbotron" style="padding-top: 20px">
												<div class="content">
																<header>
																				<h2 style="text-align: center;">로그인</h2>
																</header>
												</div>
												<form method="post" id="frm1" action="${contextPath}/member/login.do">
														<c:if test="${errors.emailOrPwNotMatch}">
														아이디와 암호가 일치하지 않습니다.
														</c:if>
														<h3 style="text-align: center;"></h3>
														<div class="form-group">
																<span class="joinFrmText">이메일:</span><br /> <input type="text" class="form-control" placeholder="이메일" id="email" name="email" value="${param.email}" maxlength="20">
														</div>
														<div class="form-group">
																<span class="joinFrmText">암호:</span><br /> <input type="password" class="form-control" placeholder="비밀번호" id="password" name="password" maxlength="20">
														</div>
														<input type="submit" id="login" class="btn btn-primary form-control" value="로그인">
												</form>
										</div>
								</div>
						</div>
				</div>
		</div>
		<script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
		<script src="${contextPath}/resources/external/bootstrap-4.6.0/js/bootstrap.min.js"></script>
</body>
</html>