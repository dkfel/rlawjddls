<%@ page language="java" 		  contentType="text/html; charset=utf-8"
				  pageEncoding="utf-8"  isELIgnored="false" %>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>메인</title>
		<link rel="stylesheet" href=""/>		
		<link rel="stylesheet" href=""/>		
		<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css"/>
		<link rel="shortcut icon" href="/favicon.ico">
</head>
<body>
	<h2>main(대문)</h2>
	<p>http://localhost/market/main.do<br/></p>
	<hr>
	
	
	<%-- 로그인 after  화면  ------------------------------ --%>
	<c:if test="${!empty memberDTO}">
	*세션에 담긴 로그인한 유저member_id = ${memberDTO.member_id}<br/>
	*세션에 담긴 로그인한 유저이메일 = ${memberDTO.email}<br/>
	
	${memberDTO.name}님 접속중 
	</c:if>
	

</body>
</html>










