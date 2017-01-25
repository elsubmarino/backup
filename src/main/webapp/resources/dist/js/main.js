$(function(){
	$(".contentTitle").click(function(){
		var blah=$(this).children("span").text();
		$("#contentTitler").val(blah);
		$("#headerForm").submit();
	})
	
	$("#popupRegister").click(function(){
		location.replace("/popup/register");
	});
	
	$("#popupModify").click(function(){
		location.replace("/popup/modify");
	});
	
	$("#popupDelete").click(function(){
		location.replace("/popup/delete");	
	})
	
	$("#firstStep").click(function(){
		location.replace("/category/create")
	});
	
	$("#secondStep").click(function(){
		location.replace("/category/create");
	});
	
	$("#categoryModify").click(function(){
		location.replace("/category/modify");
	});
	
	$("#categoryDelete").click(function(){
		location.replace("/category/delete");
	})
	
	$("#educationModify").click(function(){
		location.replace("/education/modify");
	});
	
	$("#educationDelete").click(function(){
		location.replace("/education/delete");
	});
	
	$("#educationCreate").click(function(){
		location.replace("/education/create");
	});
	
	$("#setBoardCreate").click(function(){
		location.replace("/setBoard/create");
	});
	
	$("#setBoardModify").click(function(){
		location.replace("/setBoard/modify");
	});
	
	$("#setBoardDelete").click(function(){
		location.replace("/setBoard/delete")
	});
	
	$("#popupList").click(function(){
		location.replace("/popup/list");
	});
	
	$("#setBoardCancel").click(function(){
		location.replace("/setBoard/list");
	});
	
	
	$("#categoryList").click(function(){
		location.replace("/category/list");
	});
	
	$("#educationList").click(function(){
		location.replace("/education/list");
	});
	
});