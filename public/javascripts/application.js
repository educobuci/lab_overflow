$(function(){
  if($("#notice").html() != "" || $("#alert").html())
  {
    setTimeout(function(){ $("#flash").fadeOut(2000); }, 1000);
  }
  
  $('.accept').bind('click', function() {
  	var info = ($(this).attr('checked'))?'answer_id='+$(this).val():'answer_id=';
    $.ajax({
  	  url: '/questions/'+$('.details').attr('data-id')+'/accept', data:info, type:'get', dataType: 'json'
	});
	
	if($(this).attr('checked')){
		$('.accept:checked').prop("checked",false);
		$(this).prop("checked",true);
	}else{
		$('.accept:checked').prop("checked",false);	
	}
  })
})