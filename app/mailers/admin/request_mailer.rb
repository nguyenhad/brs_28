class Admin::RequestMailer < ApplicationMailer
  def accept_request request
    @book_request = request
    mail to: request.user.email, subject: t("views.admin.mailer.accepted")
  end
end
