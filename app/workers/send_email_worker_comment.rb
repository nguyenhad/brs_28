class SendEmailWorkerComment
  include Sidekiq::Worker

  def perform comment_id
    comment = Comment.find comment_id
    CommentMailer.send_email_comment(comment).deliver_now
  end
end
