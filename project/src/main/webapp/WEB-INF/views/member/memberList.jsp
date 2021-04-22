<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- pageContext를 이용하여 request객체를 얻고
         얻어진 request객체를 이용하여   contextPath를 얻어 변수에 저장
<c:set var="변수명"       value="값" />  --%>        
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	
</script>	
</head>
<body>
	<%--
		MemberControllerImpl 컨트롤러에서  아래와같이 model이 넘어왔다
		List<MemberDTO> memberList = memberService.getMemberList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberList", memberList);//회원목록
		mv.addObject("memberCount", count);//회원수
	 --%>

	<h2>memberList.jsp</h2>
	<hr/>
	
	<table border="1" width="100%">
		<caption>회원정보(전체회원수 : ${memberCount})</caption>
		<thead>
			<tr>
				<th>번호</th>
				<th>이메일</th>
				<th>비번</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>회원권한</th>
				<th>회원상태</th>
			</tr>
		</thead>
		<tbody>
			<%-- jstl의 foreach를 이용해서  회원수만큼 반복해서 출력할 예정 --%>
			<c:forEach  var="member"  items="${memberList}">
			<tr>
				<td>${member.member_id}</td>
				<td><%-- <a href="${contextPath}/member/memberDetail.do?memberNo=${member.mno}&id=${member.id}"> --%>${member.email}</a></td>
				<td>${member.password}</td>
				<td>${member.name}</td>
				<td>${member.phone}</td>
				<td>${member.address}</td>
				<td>${member.member_role}</td>
				<td>${member.member_status}</td>
<%-- 				<td><button name="delete_btn" class="delete_btn" onClick="javascript:window.location='${contextPath}/member/deleteMember.do?memberId=${member.id}'" >삭제</button> --%>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>		
</body>
</html>










