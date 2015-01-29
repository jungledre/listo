var eventAlert = function(){
  var eventId = $('#event-user').html();
  swal({
    title: 'Event created!',
    text: 'Click on the button below to see where you will be meeting.',
    type: 'success',
    confirmButtonText: 'Go to event page'
  },
  function(isConfirm){
    if (isConfirm){
      location.href = '/events/'+eventId;
    }
  });
};
