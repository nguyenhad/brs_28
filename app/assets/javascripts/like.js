$(document).ready(function(){
  $('.like-form').submit(function(e){
    e.preventDefault();
    var url = $(this).attr('action');
    var method = $(this).attr('method');
    var data = $(this).serializeArray();
    console.log(method)
    $.ajax({
      url: url,
      method: method,
      data: data,
      dataType: 'json',
      success: function(result){
        $('#button_like_' + result.activity_id).toggleClass('btn-default');
        $('#button_like_' + result.activity_id).toggleClass('btn-info');
        $('#icon-' + result.activity_id).toggleClass('glyphicon-thumbs-down');
        $('#icon-' + result.activity_id).toggleClass('glyphicon-thumbs-up');
        if(method == 'post'){
          method = 'delete'
        }else{
          method = 'post'
        }
      }
    });
  });
});
