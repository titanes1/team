<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"   %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">



#box{

	margin: auto;
	width: 1000px; 
	margin-top: 30px;

}

#title{
	text-align: center;
	font-size: 30px;
}

th{
	text-align: center;
}

td{
	text-indent: 5px;
}

</style>
<div id="box">
	
		<h1 id="title">도서목록</h1>


</head>
<body>
<table align="center"800" border="1"
 style="border-collapse:collapse;font-size:12pt"
 bordercolor="gray" cellpadding="8" cellspacing="0">
	<tr bgcolor="#dedede">
		<th width="10%">일련번호</th>
		<th width="10%">도서번호</th>
		<th width="20%">도서이미지</th>
		<th width="10%">도서제목</th>
		<th width="10%">출판사</th>
		<th width="10%">도서가격</th>
		<th width="15%">도서입고날짜</th>
		<th width="15%">비고</th>
	</tr>
	
	    <!-- 상품이 없는 경우 -->
    <c:if test="${ empty b_list }">
        <tr>
           <td colspan="7" align="center">
               <font color="red">등록된 도서가 없습니다</font>
           </td>
        </tr>
    </c:if>
    
        <!--상품이 있는 경우  -->
    <!-- for(ProductVo vo : list)  -->
    <c:forEach var="vo"  items="${ b_list }">
		<tr align="center">
			<td>${ vo.b_idx }</td>
			<td>${ vo.b_num }</td>
			<td><img src="../images/${ vo.p_image}"	width="100" height="90"></td>
			<td>
			  <a href="view.do?p_idx=${ vo.b_idx }">${ vo.b_subject }</a>
			</td>
			<td>
				${ vo.b_publish }
			</td>
			<td>
				${ vo.b_price }원
			</td>
			<td>${ vo.b_regdate }</td>
		</tr>
	</c:forEach>
	
	
</body>
</html>










