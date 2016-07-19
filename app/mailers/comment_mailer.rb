class CommentMailer < ActionMailer::Base
  def send_email_comment comment
    @comment = comment
    mail to: comment.review.user.email, subject: t("views.mailer.create_comment")
  end
end
