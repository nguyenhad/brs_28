$(document).ready(function(){
  $('#favorite_form').submit(function(e){
    e.preventDefault();
    var url = $(this).attr('action');
    var method = $(this).attr('method');
    var data = $(this).serializeArray();
    $.ajax({
      url: url,
      method: method,
      data: data,
      dataType: 'json',
      success: function(){
        if($('#is_favorite').attr('value') == "true"){
          $('#is_favorite').val('false');
        }else{
          $('#is_favorite').val('true');
        }
        $('#button_favorite').toggleClass('btn-warning');
        $('#button_favorite').toggleClass('btn-default');
        if($('#button_favorite').attr('value') == 'Mark as favorite'){
          $('#button_favorite').val('Unmark as favorite');
        }else{
          $('#button_favorite').val('Mark as favorite');
        }
      }
    });
  });

  $('#status_form').submit(function(e){
    e.preventDefault();
    var url = $(this).attr('action');
    var method = $(this).attr('method');
    var data = $(this).serializeArray();
    $.ajax({
      url: url,
      method: method,
      data: data,
      dataType: 'json',
      success: function(){
        if($('#status').attr('value') == 'reading'){
          $('#status').val('read');
          $('#button_status').val('Mark as read');
          $('#button_status').removeClass('btn-primary');
          $('#button_status').addClass('btn-success');
        }else if($('#status').attr('value') == 'read'){
          $('#status').val('unread');
          $('#button_status').val('Mark as unread');
          $('#button_status').removeClass('btn-success');
          $('#button_status').addClass('btn-default');
        }else if($("#status").attr('value') == 'unread'){
          $('#status').val('reading');
          $('#button_status').val('Mark as reading');
          $('#button_status').removeClass('btn-default');
          $('#button_status').addClass('btn-primary');
        }
      }
    });
  });
});
