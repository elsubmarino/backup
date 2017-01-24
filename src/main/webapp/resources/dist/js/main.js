$(function(){
	$(".contentTitle").click(function(){
		var blah=$(this).children("span").text();
		$("#contentTitler").val(blah);
		$("#headerForm").submit();
	})
	
	$("#pollRegister").click(function(){
		location.replace("/poll/register");
	});
});