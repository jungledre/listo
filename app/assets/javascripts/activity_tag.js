$(function(){
  $('.act-link').on('click',function(e){
    e.preventDefault();
    var link = $(this)
    var url = link.attr('href');
    $.post(url,function(data){
      if(data.joined){
        swal({
          title: 'You have decided to go ' + data.activity.name
        })
        //location.href="/"
      }else{
        swal({
          title: 'You have already selected this activity.',
          text: 'This message will self destruct in 2 seconds.',
          timer: 2000
        });
      }
    },'json');
  })
});
