
$(function(){

//Prevent Default new page safari mobile
// var a=document.getElementsByTagName("a");
// for(var i=0;i<a.length;i++)
// {
//     a[i].onclick=function()
//     {
//         window.location=this.getAttribute("href");
//         return false
//     }
// }

});

//Cloudinary Preview Future Release
var profile_pic = function(){
  $('.cloudinary-fileupload').bind('cloudinarydone', function(e, data) {
    $('.preview').html(
      $.cloudinary.image(data.result.public_id,
        { format: data.result.format, version: data.result.version,
          crop: 'fill', width: 150, height: 100 })
    );
    $('.image_public_id').val(data.result.public_id);
    return true;
  });
}
