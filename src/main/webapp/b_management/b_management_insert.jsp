<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>Insert title here</title>

<style type="text/css">
#box {
	width: 750px;
	margin: auto;
	margin-top: 50px;
}

#id_msg {
	margin-left: 10px;
	width: 300px;
}
</style>


<script type="text/javascript">

	//문서네에 Element 배치가 완료 되면 펑션 시작해!
	$(document).ready(function(){
		
		//도서 입력창에서 키가 입력되면
		$("#b_num").keyup(function(event){
			
			var b_num = $(this).val();
			
			if(regular_b_num.test(b_num)==false){
				
				//적용하기 버튼 비 활성화
				$("#btn_register").attr("disabled", true);
				return;
				
				
			}
			
			
			//서버에서 사용 가능여부(jQuery Ajax)
			
			$.ajax({
				
				rul			:		'check_b_num.do',
				data		:		{'b_num' : b_num},
				dataType	:		'json',
				success		:		function(res_data){
					
					if(){
						$("#b_num_msg").html("입력 가능한 도서입니다").css("color","blue");
						
						//적용버튼 활성화 하기 
						$("#btn_register").attr("disabled", false);
						
					}else{
						$("#b_num_msg").html("이미 적용된 도서입니다").css("color","red");
						
					}
					
				},
				error		:		function(err){
					
					alert(err.responseText);
					
				}
				
				
				
			});
			
			
		});
		
		
		
	});
	
	
	
	
	function send(f){
		
		//체크할 목록 :  
		var   b_num			=	f.b_num.value.trim();
		var	b_subject		=	f.b_subject.value.trim();
		var	b_publish		=	f.b_publish.value.trim();
		var	b_price			=	f.b_price.value.trim();	
		
		
		if(b_num==''){
			
			alert("도서번호를 입력하세요");
			f.b_num.value	=	'';
			f.b_num.focus();
			return;
			
		}
		
		if(b_subject==''){
			
			alert("도서제목을 입력하세요");
			f.b_subject.value	=	'';
			f.b_subject.focus();
			return;
			
		}
		
		if(b_publish==''){
			
			alert("출판사를 입력하세요");
			f.b_publish.value	=	'';
			f.b_publish.focus();
			return;
			
		}
		
		if(b_price	==''){
			
			alert("도서가격을 입력하세요");
			f.b_price.value	=	'';
			f.b_price.focus();
			return;
			
		}

		f.action	=	"b_insert.do";//Member Insert Action
		f.submit();
		
	}
	
</script>

</head>
<body>
	<div id="box">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4>도서 정보 입력</h4>
			</div>
			<div class="panel-body">
				<table class="table table-striped">

					<tr>
						<th>도서번호</th>
						<td><input name="b_num" id="b_num"><span id="b_num_msg"></span></td>
						
					</tr>

					<tr>
						<th>도서제목</th>
						<td><input name="b_subject"  id="b_subject"></td>
					</tr>

					<tr>
						<th>출판사</th>
						<td><input name="b_publish" id="b_publish"></td>
					</tr>
					
					<tr>
						<th>도서가격</th>
						<td><input name="b_price" id="b_price"></td>
					</tr>

					<tr>

						<td colspan="4" align="center"><input class="btn btn-info"
							id="btn_regster" type="button" value="입력"
							onclick="send(this.form)"> <input class="btn btn-default"
							type="button" value="도서목록" onclick="location.href='b_list.do'"></td>

					</tr>

				</table>

			</div>

		</div>

	</div>

	

</body>
</html>