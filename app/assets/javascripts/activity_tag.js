$(function(){
  $('.act-link').on('click',function(e){
    e.preventDefault();
    var link = $(this)
    var url = link.attr('href');
    $.post(url,function(data){
      if(data.joined){
        swal({
          title: 'You have decided to ' + data.activity.name,
          text: 'You will not be able to recover this imaginary file!',
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: "#DD6B55",
          confirmButtonText: "Yes, delete it!",
          cancelButtonText: "No, cancel plx!",
          closeOnConfirm: false,
          closeOnCancel: false
          }
        });
        //location.href="/"
      }else{
        swal('You already did this.')
      }
    },'json');
  })
});
