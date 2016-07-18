class ReviewsController < ApplicationController
  before_action :load_review, only: :destroy
  load_and_authorize_resource

  def new
    @review = Review.new
  end

  def create
    @new_review = current_user.reviews.build review_params
    if @new_review.save
      book = Book.find_by id: @new_review.book_id
      if book.present?
        average = Review.average_rate(@new_review.book_id).average :rate
        book.update_attributes average_rate: average
      else
        flash[:danger] = t "views.review.upadate_rate_fail"
        redirect_to books_path
      end
      flash[:success] = t "views.review.added"
      redirect_to book_path(@new_review.book_id)
    else
      flash[:danger] = t "views.review.add_fail"
      redirect_to books_path
    end
  end


  def destroy
    book = @review.book
    if @review.destroy
      flash.now[:success] = t "vews.message.delete_success"
      redirect_to book_path(book)
      if book.present?
        average = Review.average_rate(book.id).average :rate
        book.update_attributes average_rate: average
      else
        flash[:danger] = t "views.review.upadate_rate_fail"
        redirect_to books_path
      end
    else
      flash.now[:danger] = t "vews.message.delete_fail"
      redirect_to book_path(book)
    end
  end

  private
  def review_params
    params.require(:review).permit :id, :user_id, :book_id, :content, :rate
  end

  def load_review
    @review = Review.find_by id: params[:id]
    unless @review.present?
      flash.now[:danger] = t "views.message.not_found_review"
      redirect_to root_path
    end
  end
end
