var passwordRules = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/

$(function() {
	//비밀번호 변경시 엔터키
	$("#passwordChange").keydown(function(key){
		if(key.keyCode==13){
			$("#acceptPasswordChange").trigger("click");
		}
	});
	
	
	// 총 :~ 수직정렬
	var search = document.getElementById("search");
	var count = document.getElementById("count");
	if (search!=null && count != null) {
		search=search.offsetHeight;
		count.style.lineHeight = search + "px";
	}

	var pathName = location.pathname;
	if (pathName.indexOf("popup") != -1) {
		$(".treeview").removeClass("active");
		$(".treeview").eq(1).addClass("active");
	} else if (pathName.indexOf("setBoard") != -1) {
		$(".treeview").removeClass("active");
		$(".treeview").eq(2).addClass("active");
	} else if (pathName.indexOf("canonical") != -1) {
		$(".treeview").removeClass("active");
		$(".treeview").eq(3).addClass("active");
	}else if (pathName.indexOf("category") != -1) {
		$(".treeview").removeClass("active");
		$(".treeview").eq(4).addClass("active");
	} else if (pathName.indexOf("education/") != -1) {
		$(".treeview").removeClass("active");
		$(".treeview").eq(5).addClass("active");
	} else if (pathName.indexOf("security_service") != -1) {
		$(".treeview").removeClass("active");
		$(".treeview").eq(7).addClass("active");
	} else if (pathName.indexOf("education_qna") != -1) {
		$(".treeview").removeClass("active");
		$(".treeview").eq(8).addClass("active");
	} else if (pathName.indexOf("meta") != -1) {
		$(".treeview").removeClass("active");
		$(".treeview").eq(9).addClass("active");
	} else if (pathName.indexOf("online/") != -1) {
		$(".treeview").removeClass("active");
		$(".treeview").eq(6).addClass("active");
	} else if (pathName.indexOf("statistics") != -1) {
		$(".treeview").removeClass("active");
		$(".treeview").eq(10).addClass("active");
	} 

	$("#search").click(function() {
		var temp = $("[name='keyword']").val().trim();
		$("[name='keyword']").val(temp);
		$("#searchForm").submit();
	});
	$(".pagination li a").click(function(event) {
		self.location = "?page=" + $(this).text();
	})

	$(".contentTitle").click(function() {
		var blah = $(this).children("span").text();
		$("#contentTitler").val(blah);
		$("#headerForm").submit();
	})

	


	$("#popupDelete").click(function() {
		location.replace("/admin/popup/delete");
	})

	$("#firstStep").click(function() {
		location.replace("/category/create")
	});

	$("#categoryModify").click(function() {
		location.replace("/category/modify");
	});

	$("#categoryDelete").click(function() {
		location.replace("/category/delete");
	})

	$("#educationModify").click(function() {
		location.replace("/admin/education/modify");
	});

	$("#educationDelete").click(function() {
		location.replace("/admin/education/delete");
	});

	$("#setBoardCreate").click(function() {
		location.replace("/admin/setBoard/create");
	});

	$("#setBoardDelete").click(function() {
		location.replace("/admin/setBoard/delete")
	});

	$("#popupList").click(function() {
		location.replace("/admin/popup/list");
	});

	$("#setBoardCancel").click(function() {
		location.replace("/admin/setBoard/list");
	});

	$("#categoryList").click(function() {
		location.replace("/category/list");
	});

	$("#educationList").click(function() {
		location.replace("/admin/education/list");
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
		} else if (!pwd1.match(passwordRules)) {
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