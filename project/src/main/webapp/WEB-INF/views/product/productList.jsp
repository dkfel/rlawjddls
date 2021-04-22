<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>메인</title>
<link rel="stylesheet" href="" />
<link rel="stylesheet" href="" />
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css" />
<link rel="shortcut icon" href="/favicon.ico">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="http://www.w3cschool.cc/try/jeasyui/jquery.easyui.min.js"></script>
<style type="text/css">
.products {
	list-style: none;
	margin-right: 300px;
	padding: 0px;
	height: 100%;
}

.products li {
	display: inline;
	float: left;
	margin: 10px;
}

.item {
	display: block;
	text-decoration: none;
}

.item img {
	border: 1px solid #333;
}

.item p {
	margin: 0;
	font-weight: bold;
	text-align: center;
	color: #c3c3c3;
}

.cart {
	position: fixed;
	right: 0;
	top: 0;
	width: 300px;
	height: 100%;
	background: #ccc;
	padding: 0px 10px;
}

h1 {
	text-align: center;
	color: #555;
}

h2 {
	position: absolute;
	font-size: 16px;
	left: 10px;
	bottom: 20px;
	color: #555;
}

.total {
	margin: 0;
	text-align: right;
	padding-right: 20px;
}
</style>
<script>
	var data = {
		"total" : 0,
		"rows" : []
	};
	var totalCost = 0;

	$(function() {
		$('#cartcontent').datagrid({
			singleSelect : true
		});
		$('.item').draggable({
			revert : true,
			proxy : 'clone',
			onStartDrag : function() {
				$(this).draggable('options').cursor = 'not-allowed';
				$(this).draggable('proxy').css('z-index', 10);
			},
			onStopDrag : function() {
				$(this).draggable('options').cursor = 'move';
			}
		});
		$('.cart').droppable({
			onDragEnter : function(e, source) {
				$(source).draggable('options').cursor = 'auto';
			},
			onDragLeave : function(e, source) {
				$(source).draggable('options').cursor = 'not-allowed';
			},
			onDrop : function(e, source) {
				var name = $(source).find('p:eq(0)').html();
				var price = $(source).find('p:eq(1)').html();
				addProduct(name, parseFloat(price.split('\')[1]));
			}
		});
	});

	function addProduct(name, price) {
		function add() {
			for (var i = 0; i < data.total; i++) {
				var row = data.rows[i];
				if (row.name == name) {
					row.quantity += 1;
					return;
				}
			}
			data.total += 1;
			data.rows.push({
				name : name,
				quantity : 1,
				price : price
			});
		}
		add();
		totalCost += price;
		$('#cartcontent').datagrid('loadData', data);
		$('div.cart .total').html('Total: \' + totalCost);
	}
</script>
</head>
<body style="margin: 0; padding: 0; height: 100%; background: #fafafa;">
	<ul class="products">
		<li><a href="#" class="item"> <img src="${contextPath}/resources/productImg/1.jpg" />
				<div>
					<p>고당도 아삭아삭 청송사과 10kg가정용(42~54과)기스과</p>
					<p>가격:\37500</p>
				</div>
		</a></li>
		<li><a href="#" class="item"> <img src="${contextPath}/resources/productImg/2.jpg" />
				<div>
					<p>생생스토리 토마토 대저토마토2.5kg로얄과</p>
					<p>가격:\16900</p>
				</div>
		</a></li>
		<li><a href="#" class="item"> <img src="${contextPath}/resources/productImg/3.jpg" />
				<div>
					<p>농협상품명 의성진 경북사과 꿀부사 가정용 흠과 3kg 19과내 </p>
					<p>가격:\13900</p>
				</div>
		</a></li>
		<li><a href="#" class="item"> <img src="${contextPath}/resources/productImg/4.jpg" />
				<div>
					<p>무농약블루베리즙 무농약블루베리즙 80mm/30포</p>
					<p>가격:\42000</p>
				</div>
		</a></li>
		<li><a href="#" class="item"> <img src="${contextPath}/resources/productImg/5.jpg" />
				<div>
					<p>영주풍기사과 꿀맛사과 10kg 34 42과 가정용 흠집사과</p>
					<p>가격:\48600</p>
				</div>
		</a></li>
		<li><a href="#" class="item"> <img src="${contextPath}/resources/productImg/6.jpg" />
				<div>
					<p>농협 껍질째먹는 세척사과 7.5kg 26 30과</p>
					<p>가격:\42000</p>
				</div>
		</a></li>
		<li><a href="#" class="item"> <img src="${contextPath}/resources/productImg/7.jpg" />
				<div>
					<p>썬키스트 블랙라벨 고당도 오렌지(30개입 7kg내외)</p>
					<p>가격:\26900</p>
				</div>
		</a></li>
		<li><a href="#" class="item"> <img src="${contextPath}/resources/productImg/8.jpg" />
				<div>
					<p>영주풍기사과 꿀맛사과 10kg 28 32과 가정용 흠집사과</p>
					<p>가격:\49900</p>
				</div>
		</a></li>
	</ul>
	<div class="cart">
		<h1>Shopping Cart</h1>
		<div style="background: #fff">
			<table id="cartcontent" fitColumns="true" style="width: 300px; height: auto;">
				<thead>
					<tr>
						<th field="name" width=140>Name</th>
						<th field="quantity" width=60 align="right">Quantity</th>
						<th field="price" width=60 align="right">Price</th>
					</tr>
				</thead>
			</table>
		</div>
		<p class="total">Total: $0</p>
		<h2>Drop here to add to cart</h2>
	</div>
</body>
</html>









