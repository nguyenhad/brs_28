module CommentHelper
  def json_data comment
    data = Hash.new
    data[:container] = "comment_list_" + comment.review.id.to_s
    data[:id] = comment.id
    if comment.user.avatar.present?
      data[:ava] = comment.user.avatar.url.to_s
    else
      data[:ava] = "/assets/" + Settings.users.default_avatar
    end
    data[:user_name] = comment.user.name
    data[:user_url] = "users/" + comment.user.id.to_s
    data[:content] = comment.content
    data[:time] = comment.created_at.strftime t("views.comments.time_format")
    return data
  end
end
