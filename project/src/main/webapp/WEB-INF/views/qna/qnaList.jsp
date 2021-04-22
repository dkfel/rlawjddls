<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의</title>
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css"/>
<style>	
.form, .modifyForm{
	display:none;
}
#qna td{
	border-bottom:1px solid #c2c2d6; 
}
.titleBox{
	display:inline-block;
	position:relative;
	width:75%;
}
.title{
	display:inline-block;
	position:relative;
	width:95%;
	padding:5px;
}
.writeCmt, .modifyForm{
	padding-right:30px;
	padding-left:10px;
	margin:20px 20px 10px;
}
.box{
	position:relative;
	margin-bottom:20px;
	margin-top:10px;
	padding:15px 15px 0;
}
.btnWrite, .btnModify{
	position:absolute;
	right:7px;
	bottom:0;
}
.email{
	position:absolute;
	top:37px;
	right:5px;
	padding-top:5px;
	font-size:0.8rem;
}
.content{
	position:relative;
	left:30px;
	padding:5px;
	margin-top:10px;
	width:90%;
	padding-bottom:0;
	font-size:1rem;
}
.comment{
	font-size:1rem;
	width:85%;
	padding-left:80px;
	position:relative;
}
.btnBox{
	display:block;
	position:absolute;
	right:10px;
	top:3px;
}
</style>
</head>
<body>

	<h2>qnaList.jsp</h2>
	<hr/>
	<c:set var="page" value="${paging.currentPage}"/>
    <div id="bodyWrap">
		<table id="qna" class="qna" width="95%">
					<tr>
						<td style="border-bottom:none;text-align:right;">
							<button type="button" class="btn btn-primary islogin">문의 하기</button> <!--  data-toggle="modal" data-target="#writeModal" -->
						</td>
					</tr>
			  <c:forEach var="qnaList" items="${qnaList}">
			  	<c:if test="${qnaList.is_locked==0}">
			  	 	<tr>
						<td>
						  <div class="box">
							<div class="titleBox"><strong>Q.&nbsp;<div class="title">${qnaList.title}</div></strong></div>
						 	<div  class="btnBox">
					<%-- <c:if test="${memberDTO.member_role=='admin'}"> --%>
						 		<button type="button" class="cmt btn btn-outline-primary btn-sm">답글작성</button>
					<%-- </c:if> --%>
					<%-- <c:if test="${memberDTO.id==qnaList.qa_id}">  --%>
		 						<button type="button" class="modifyFormBtn btn btn-outline-primary btn-sm" value="${qnaList.qa_id}">수정</button>
								<a href="${contextPath}/qna/deleteQna.do?qa_id=${qnaList.qa_id}&currentPage=${page}" class="qlink btn btn-outline-primary btn-sm">삭제</a>
					<%-- </c:if> --%>
							</div>
							<div  class="email">${qnaList.email}님&nbsp;<fmt:formatDate pattern="yyyy.MM.dd" value="${qnaList.created_at}"/></div>
							<div class="content">${qnaList.content}</div>
						  </div>
						</td>
					</tr>
			  	</c:if>
			  	<c:if test="${qnaList.is_locked==1}">
			  	  <c:choose>
			  	    <c:when test="${qnaList.member_id==memberDTO.member_id || memberDTO.member_role=='admin'}">
			  	    	<tr>
							<td>
							  <div class="box">
								<div class="titleBox"><strong>Q.&nbsp;<div class="title">${qnaList.title}</div></strong></div>
							<c:if test="${memberDTO.member_role=='admin'}">
							 	<div  class="btnBox">
								 	<%-- <c:if test="${memberDTO.member_role=='admin'}"> --%>
						 		<button type="button" class="cmt btn btn-outline-primary btn-sm">답글작성</button>
					<%-- </c:if> --%>
					<%-- <c:if test="${memberDTO.id==qnaList.qa_id}">  --%>
		 						<button type="button" class="modifyFormBtn btn btn-outline-primary btn-sm" value="${qnaList.qa_id}">수정</button>
								<a href="${contextPath}/qna/deleteQna.do?qa_id=${qnaList.qa_id}&currentPage=${page}" class="qlink btn btn-outline-primary btn-sm">삭제</a>
					<%-- </c:if> --%>
							    </div>
							</c:if>
								<div  class="email">${qnaList.email}님&nbsp;<fmt:formatDate pattern="yyyy.MM.dd" value="${qnaList.created_at}"/></div>
								<div class="content">${qnaList.content}</div>
							  </div>
							</td>
						</tr>
			  	    </c:when>
			  	    <c:otherwise>
			  	    	<tr>
							<td>
							  <div class="box">
							 	<span class="title"><strong>Q.&nbsp;비밀 문의 글 입니다</strong></span>
							 	<div  class="btnBox">
						<%-- <c:if test="${memberDTO.member_role=='admin'}"> --%>
							 		<button type="button" class="cmt btn btn-outline-primary btn-sm">답글작성</button>
						<%-- </c:if> --%>
						<%-- <c:if test="${memberDTO.id==qnaList.qa_id}">  --%>
			 						<button type="button" class="modifyFormBtn btn btn-outline-primary btn-sm" value="${qnaList.qa_id}">수정</button>
									<a href="${contextPath}/qna/deleteQna.do?qa_id=${qnaList.qa_id}&currentPage=${page}" class="qlink btn btn-outline-primary btn-sm">삭제</a>
						<%-- </c:if> --%>
							    </div>
							  </div>
							</td>
						</tr>
			  	    </c:otherwise>
			  	  </c:choose>
			    </c:if>
						<tr class="form">
					    	<td style="background:#f0f0f5; width:736px;">
						    	<div class="box">
						    	  <div class="writeCmt">
						    	  	<textarea class="cmtcontent form-control" rows="7" name="content"></textarea>
						    	  	<input type="button" value="작성" class="btnWrite btn btn-outline-primary btn-sm"/>
						    	  	<input type="hidden" value="${qnaList.qa_id}" class="qa_id">
						    	  </div>
						    	</div>
					    	</td>
						</tr>
				<c:forEach var="qnaCommentList" items="${qnaCommentList}"> 			
				  <c:if test="${qnaList.qa_id==qnaCommentList.qa_id}">
					<c:if test="${qnaList.is_locked==0}">
				  	 	<tr>
							<td style="background:#f0f0f5;">
								<div class="box">
									<div class="answer"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ A.&nbsp;</strong></div>
									<div class="comment">${qnaCommentList.content}</div>
									<span class="btnBox">
							<%-- <c:if test="${memberDTO.member_role=='admin'}"> --%>
									   <input type="button" value="수정" class="modifyCmt btn btn-outline-primary btn-sm">
									   <a href="${contextPath}/qna/deleteComment.do?qa_comment_id=${qnaCommentList.qa_comment_id}&currentPage=${page}" class="qlink btn btn-outline-primary btn-sm">삭제</a>
									</span>
						    	    <div class="modifyForm">
							    	  	<textarea class="modifyCmtContent form-control" rows="7" name="modifyCmtContent">${qnaCommentList.content}</textarea>
							    	  	<input type="hidden" value="${qnaCommentList.qa_comment_id}" class="qa_comment_id">
							    	  	<input type="button" value="수정" class="btnModify btn btn-outline-primary btn-sm"/>
						    	    </div>
						    	</div>
							</td>
						</tr>
				  	</c:if>
				  	<c:if test="${qnaList.is_locked==1}">
				  	  <c:choose>
				  	    <c:when test="${qnaList.member_id==memberDTO.member_id}">
				  	    	<tr>
								<td style="background:#f0f0f5;">
									<div class="box">
										<div class="answer"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ A.&nbsp;</strong></div>
										<div class="comment">${qnaCommentList.content}</div>
										<span class="btnBox">
								<%-- <c:if test="${memberDTO.member_role=='admin'}"> --%>
										   <input type="button" value="수정" class="modifyCmt btn btn-outline-primary btn-sm">
										   <a href="${contextPath}/qna/deleteComment.do?qa_comment_id=${qnaCommentList.qa_comment_id}&currentPage=${page}" class="qlink btn btn-outline-primary btn-sm">삭제</a>
										</span>
							    	    <div class="modifyForm">
								    	  	<textarea class="modifyCmtContent form-control" rows="7" name="modifyCmtContent">${qnaCommentList.content}</textarea>
								    	  	<input type="hidden" value="${qnaCommentList.qa_comment_id}" class="qa_comment_id">
								    	  	<input type="button" value="수정" class="btnModify btn btn-outline-primary btn-sm"/>
							    	    </div>
							    	</div>
								</td>
							</tr>
				  	    </c:when>
				  	    <c:otherwise>
				  	    	<tr>
								<td colspan="2"  style="background:#f0f0f5;">
								  <div class="box">
								 	<span class="title"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ A.&nbsp;비밀 답글입니다.</strong></span>
								  </div>
								</td>
							</tr>
				  	    </c:otherwise>
				  	  </c:choose>
				    </c:if>			
				</c:if>	
				
					</c:forEach>  
			  </c:forEach>
		  <tfoot>
			  <tr>
			  	<td style="border-bottom:none;">
			  		<div style="display: block; text-align: center;">		
						<c:if test="${paging.startPage>3}">
							<a onclick="javascript:prevPaging('${paging.startPage-3}');">&lt;&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
							<c:choose>
								<c:when test="${p == paging.currentPage }">
									<b>${p}</b>
									<input type="hidden" id="currentPage" value="${p}"/>
								</c:when>
								<c:when test="${p != paging.currentPage }">
									<a onclick="javascript:paging('${p}');">${p}</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage < paging.totalPages}">
							<a onclick="javascript:nextPaging('${paging.startPage+3}');">&gt;</a>
							<a onclick="javascript:totalPage('${paging.totalPages}');">&gt;&gt;</a>
						</c:if>
					</div>
			  	</td>
			  </tr>
		  </tfoot>
		</table>
	</div>	
	<!-- 문의하기 창 -->
	<div class="modal fade" id="writeModal">
	    <div class="modal-dialog modal-lg modal-dialog-centered">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title">상품문의 하기</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body">
	           <form id="writeForm">	
					<table class="table" width="85%">
						<tr>
							<th style="width:15%">제목</th>
							<td><input type="text" id="title" class="form-control" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="form-control" rows="7" id="content"></textarea></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" id="email" class="form-control" value="${memberDTO.email}"/></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="checkbox" id="is_locked" value="0">
								<label for="is_locked">비공개</label>
							</td>
						</tr>
					</table>
			   </form>
	        </div>
	        <div class="modal-footer">
		        <input type="reset" class="btn btn-default btn-sm" value="다시쓰기"/>
		        <button type="button" class="btn btn-primary btn-sm" id="writeBtn">작성하기</button>
		        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
		    </div>
	      </div>
	    </div>
	</div>
	
	<!-- 문의 수정하기 창 -->
	<div class="modal fade" id="modifyModal">
	    <div class="modal-dialog modal-lg modal-dialog-centered">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title">상품문의 수정하기</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body">
	           <form id="modifyForm">	
					<table class="table" width="85%">
						<tr>
							<th style="width:15%">제목</th>
							<td><input type="text" id="modifyTitle" class="form-control" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="form-control" rows="5" id="modifyContent"></textarea></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" id="modifyEmail" class="form-control" readonly="readonly"/></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="hidden" id="modifyQa_id" value=""/>
								<input type="checkbox" id="modifyIs_locked" value="0">
								<label for="modifyIs_locked">비공개</label>
							</td>
						</tr>
					</table>
			   </form>
	        </div>
	        <div class="modal-footer">
		       <!--  <input type="reset" class="btn btn-default" value="다시쓰기"/> -->
		        <button type="button" class="btn btn-primary" id="modifyBtn">수정하기</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		    </div>
	      </div>
	    </div>
	</div>
<script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
<script src="${contextPath}/resources/external/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<script>
$(function(){
	
	//현재페이지 저장
	var currentPage = $("#currentPage").val();
	
	//수정버튼 숨기기
	$(document).on("click","input[type=reset]",function(){
 		$("#title").val("");
		$("#content").val("");
		$("#email").val("");
 	});
	
	//비공개 설정여부
	$("#is_locked").click(function(){

		if($(this).is(":checked"))
			$(this).val(1);
		else
			$(this).val(0);
	});
	$("#modifyIs_locked").click(function(){

		if($(this).is(":checked"))
			$(this).val(1);
		else
			$(this).val(0);
	});

	//로그인 검사
	$(document).on('click','.islogin',function(){
	
		var isLogin = '<%=session.getAttribute("isLogin") %>';
	 	alert(isLogin);
	 	
	 	if(isLogin!=='null'){
	 		$("#writeModal").modal("show");
	 	}else{
	 		alert('로그인 후 문의 글을 남겨주세요.');
	 		$("#writeModal").modal("hide");
	 	}
	});
	
	//문의 글 작성	
	//$("#writeBtn").click(function(){
	$(document).on('click','#writeBtn',function(){
				
			var title = $("#title").val();
			var content = $("#content").val();
			var email = $("#email").val();
			var is_locked = $("#is_locked").val();
			
			$.ajax({
				url:"${contextPath}/qna/writeQna.do",
				type:"get",
				datatype:"text",
				data:{"title":title,
					  "content":content,
					  "email":email,
					  "is_locked":is_locked},
				success:function(json){
					
					alert('문의 글이 등록되었습니다.');
					$("#bodyWrap").load("${contextPath}/qna/qnaList.do #qna");
					$("#title").val("");
					$("#content").val("");
					$("#email").val("");
				},
				error:function(request, error){
					alert('err');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
					$("#writeModal").modal("hide");
	}); 
	
	

	//문의 글 수정폼 보여주기
	//$(document).on('click','.modifyFormBtn',(e)=>{
	$(document).on('click','.modifyFormBtn',function(e){
		var qa_id = e.target.value;
		
		$.ajax({
			url:"${contextPath}/qna/modifyForm.do",
			type:"get",
			data:{"qa_id":qa_id},
			datatype:"json",
			success:function(json){
				$("#modifyTitle").val(json["title"]);
				$("#modifyContent").val(json["content"]);
				$("#modifyEmail").val(json["email"]);
				$("#modifyQa_id").val(json["qa_id"]);
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
		 $("#modifyModal").modal('show');
	});
	
	//문의 글 수정하기
	$(document).on('click','#modifyBtn',function(){
		var title = $("#modifyTitle").val();
		var content = $("#modifyContent").val();
		var is_locked = $("#modifyIs_locked").val();
		var qa_id = $("#modifyQa_id").val();
		
		$.ajax({
			url:"${contextPath}/qna/modifyQna.do",
			type:"get",
			data:{"title":title,
				  "content":content,
				  "is_locked":is_locked,
				  "qa_id":qa_id},
			success:function(){
					
				alert("문의 글을 수정했습니다.")
				$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+currentPage+" #qna");
				$("#title").val("");
				$("#content").val("");
				$("#email").val("");
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
				$("#modifyModal").modal("hide");
		
	});
	
	
	//답글 작성
	//$(".cmt").click(function(){
	$(document).on('click','.cmt',function(){
		
			var i = $(".cmt").index(this);	
		
			for(j=0;j<$(".cmt").length;j++){
				$(".form").eq(j).css('display','none');
			}
				$(".form").eq(i).css('display','block');
		
			$(".btnWrite").click(function(){
				
					var content = $(".cmtcontent").eq(i).val();
					var qa_id = $(".qa_id").eq(i).val();
					
					$.ajax({
						url:"${contextPath}/qna/writeComment.do",
						type:"get",
						datatype:"json",
						data:{"content":content,
							  "qa_id":qa_id},
						success:function(json){
							
							alert("답변이 등록되었습니다.");		
						
							/* var resultCmt = "<span>"+json["rsContent"]+"</span>"
											+"<a href='${contextPath}/qna/deleteComment.do?qa_comment_id="+json["qnaCommentId"]+"'>삭제</a>";
							$(".writeResult").eq(i).append(resultCmt); */
							$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+currentPage+" #qna");
							$(".writeResult").eq(i).css('display','block');
							$(".writeCmt").eq(i).css('display','none');
							
						},
						error:function(request, error){
							alert('err');
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
						
					});
 			});  
	}); 
	
	//답글 수정
 	//$(".modifyCmt").click(function(){
 	$(document).on('click','.modifyCmt',function(){
		
		var i = $(".modifyCmt").index(this);	
	
		for(j=0;j<$(".modifyCmt").length;j++){
			$(".modifyForm").eq(j).css('display','none');
			$(".modifyCmt").eq(j).css('visibility','visible');
		}
			$(".modifyForm").eq(i).css('display','block');
			$(".modifyCmt").eq(i).css('visibility','hidden');
			
		$(".btnModify").click(function(){

				var cmtContent = $(".modifyCmtContent").eq(i).val();
				var qa_comment_id = $(".qa_comment_id").eq(i).val();
				
				$.ajax({
					url:"${contextPath}/qna/modifyComment.do",
					type:"get",
					datatype:"json",
					data:{"content":cmtContent,
						  "qa_comment_id":qa_comment_id},
					success:function(json){
						
						alert("답변이 수정되었습니다.");	
						/* var resultCmt = json["cmtContent"];
						$(".comment").eq(i).html(resultCmt);  */
						$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+currentPage+" #qna");
						$(".modifyResult").eq(i).css('display','block');
						$(".modifyForm").eq(i).css('display','none');
						
					},
					error:function(request, error){
						alert('err');
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});   
		}); 
});
</script>	
<script>
//페이징
function paging(page){
	$.ajax({
		url:"${contextPath}/qna/qnaList.do",
		type:"get",
		data:{"currentPage":page},
		success:function(){
			alert("성공");	
			$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+page+" #qna");
		},
		error:function(request, error){
			alert('err');
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
};
function nextPaging(page){
	$.ajax({
		url:"${contextPath}/qna/qnaList.do",
		type:"get",
		data:{"currentPage":page},
		success:function(){
			$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+page+" #qna");
		},
		error:function(request, error){
			alert('err');
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
};
function totalPage(page){
	$.ajax({
		url:"${contextPath}/qna/qnaList.do",
		type:"get",
		data:{"currentPage":page},
		success:function(){
			$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+page+" #qna");
		},
		error:function(request, error){
			alert('err');
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
};
function prevPaging(page){
	$.ajax({
		url:"${contextPath}/qna/qnaList.do",
		type:"get",
		data:{"currentPage":page},
		success:function(){
			$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+page+" #qna");
		},
		error:function(request, error){
			alert('err');
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
};
</script>
</body>
</html>
