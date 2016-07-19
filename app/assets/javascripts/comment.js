$(document).ready(function(){
  $('#comment_form').submit(function(e){
    e.preventDefault();
    var url = $(this).attr('action');
    var method = $(this).attr('method');
    var data = $(this).serializeArray();
    console.log(data)
    $.ajax({
      url: url,
      method: method,
      data: data,
      dataType: 'json',
      success: function(result){
        $("#" + result.container).append(to_html(result));
        $('#comment').val('');
      }
    });
  });

  function to_html(obj){
    var new_comment;
    new_comment = "<table class='table'><tr><td rowspan='2'>";
    new_comment += "<img src='" + obj.ava +"'width='50' height='50'></td>";
    new_comment += "<td><h4><a href='" + obj.user_url + "'>"
      + obj.user_name + '</a></h4></td>';
    new_comment += '<td>' + obj.content + '</td></tr>';
    new_comment += '<tr><td>' + obj.time + '</td>';
    new_comment += "<td><a href='#'>Edit</a> |<a href='#'>Delete</a></td></tr>"
    return new_comment;
  }
});
