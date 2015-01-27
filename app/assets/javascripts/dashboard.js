$(function(){

  toggle_profile_edit();

});


var toggle_profile_edit = function() {
  var btn = $('.toggle_edit');
  var bio = $('.bio');
  var form = $('.form')
  btn.on('click', function(e){
    e.preventDefault();
    bio.fadeOut(function(){
      form.removeClass('hide').fadeIn()

    });

  })
};
