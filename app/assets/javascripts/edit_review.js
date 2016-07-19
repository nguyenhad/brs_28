$(document).ready(function(){
  $('.edit-link').click(function(e){
  e.preventDefault();
  var id = $(this).attr('value');
  $('#review_content_' + id).hide();
  $('#edit-form-' + id).show();
  });

  $('.edit-review-form').submit(function(e){
    e.preventDefault();
    var url = $(this).attr('action');
    var method = $(this).attr('method');
    var data = $(this).serializeArray();
    console.log(data)
    $.ajax({
      url: url,
      data: data,
      method: method,
      dataType: 'json',
      success: function(result){
        $('#edit-form-' + result.id).hide();
        $('#review_content_' + result.id).text(result.content);
        $('#review_content_' + result.id).show();
      }
    });
  });
});
