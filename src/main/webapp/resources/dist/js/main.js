var passwordRules = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/

$(function() {

	
	$(".pagination li a").click(function(event){
		self.location="?page="+$(this).text();
	})

	$(".contentTitle").click(function() {
		var blah = $(this).children("span").text();
		$("#contentTitler").val(blah);
		$("#headerForm").submit();
	})

	$("#popupRegister").click(function() {
		location.replace("/popup/register");
	});
	$("#popupCreate").click(function(){
		var checked=$("#use").is(":checked");
		if(checked){
			$("#f_use").val('Y');
		}else{
			$("#f_use").val('N');
		}
		$("#popupCreateForm").submit();
	});
	

	$("#popupDelete").click(function() {
		location.replace("/popup/delete");
	})

	$("#firstStep").click(function() {
		location.replace("/category/create")
	});

	$("#secondStep").click(function() {
		location.replace("/category/create");
	});

	$("#categoryModify").click(function() {
		location.replace("/category/modify");
	});

	$("#categoryDelete").click(function() {
		location.replace("/category/delete");
	})

	$("#educationModify").click(function() {
		location.replace("/education/modify");
	});

	$("#educationDelete").click(function() {
		location.replace("/education/delete");
	});

	$("#educationCreate").click(function() {
		location.replace("/education/create");
	});

	$("#setBoardCreate").click(function() {
		location.replace("/setBoard/create");
	});
	



	$("#setBoardDelete").click(function() {
		location.replace("/setBoard/delete")
	});

	$("#popupList").click(function() {
		location.replace("/popup/list");
	});

	$("#setBoardCancel").click(function() {
		location.replace("/setBoard/list");
	});

	$("#categoryList").click(function() {
		location.replace("/category/list");
	});

	$("#educationList").click(function() {
		location.replace("/education/list");
	});

	$("#acceptPasswordChange").click(function() {
		var pwd1 = $("#password1").val();
		var pwd2 = $("#password2").val();
		if (!pwd1 || !pwd2) {
			alert("패스워드를 입력하세요!");
			return;
		} else if (pwd1 != pwd2) {
			alert("패스워드가 일치하지 않습니다!");
			return;
		}else if(!pwd1.match(passwordRules)){
			alert("최소 1개의 숫자 혹은 특수 문자를 포함해야 하고\n6 자리에서 20 자리내의 영문 대소문자여야 합니다.")
			return;
		}
		$.ajax({
			url : "/passwordch",
			type : 'POST',
			data : $("#passwordChangeForm").serialize(),
			success : function(result) {
				alert(result);
			},
			error : function(a, b, c) {
				alert(a + " " + b + " " + c + " ");
			}
		})

	});

});