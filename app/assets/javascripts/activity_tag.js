$(function(){
  $('.act-link').on('click',function(e){
    e.preventDefault();
    var link = $(this);
    var url = link.attr('href');
    var userId = $('#current-user').html();
    $.post(url,function(data){
      if(data.joined){
        swal({
          title: 'You selected ' + data.activity.name,
          text: 'Do you want to continue picking activities or go to your dashboard?',
          type: 'success',
          showCancelButton: 'true',
          confirmButtonText: 'Go to Dashboard',
          cancelButtonText: 'Continue'
        },
        function(isConfirm){
          if (isConfirm) {
            location.href = '/users/'+userId+'/dashboard';
          }
        });
      }else{
        swal({
          title: 'Already selected this activity',
          text: 'This message will self destruct in 2 seconds.',
          timer: 2000
        });
      }
    },'json');
  })
});
