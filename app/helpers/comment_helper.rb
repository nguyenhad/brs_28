module CommentHelper
  def json_data comment
    data = Hash.new
    data[:container] = "comment_list_" + comment.review.id.to_s
    data[:id] = comment.id
    data[:ava] = comment.user.avatar.url.to_s
    data[:user_name] = comment.user.name
    data[:user_url] = "users/" + comment.user.id.to_s
    data[:content] = comment.content
    data[:time] = comment.created_at.strftime("%d-%m-%Y %I:%M %p")
    return data
  end
end
