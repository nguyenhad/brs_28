class SendEmailWorkerReview
  include Sidekiq::Worker

  def perform new_review_id
    new_review = Review.find new_review_id
    ReviewMailer.send_email_review(new_review).deliver_now
  end
end
