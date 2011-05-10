$(function(){
  if($("#notice").html() != "" || $("#alert").html())
  {
    setTimeout(function(){ $("#flash").fadeOut(2000); }, 1000);
  }
})