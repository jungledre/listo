$(function(){
  $('.act-link').on('click',function(e){
    e.preventDefault();
    var link = $(this)
    var url = link.attr('href');
    $.post(url,function(data){
      if(data.joined){
        swal('You have decided to ' + data.activity.name)
        //location.href="/"
      }else{
        swal('You already did this.')
      }
    },'json');
  })
});
