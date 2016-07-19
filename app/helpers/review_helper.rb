module ReviewHelper
  def json_data review
    data = Hash.new
    data[:container] = "review_list_" + review.id.to_s
    data[:id] = review.id
    data[:ava] = review.user.avatar.url.to_s
    data[:user_name] = review.user.name
    data[:user_url] = "users/" + review.user.id.to_s
    data[:rate] = review.rate
    data[:content] = review.content
    data[:time] = review.created_at.strftime("%d-%m-%Y %I:%M %p")
    return data
  end
end
