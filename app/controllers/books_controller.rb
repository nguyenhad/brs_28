class BooksController < ApplicationController
  load_and_authorize_resource
  def index
    @books = Book.in_category params[:category_id]
    @search = @books.ransack params[:q]
    @books = @search.result.order(updated_at: :desc).page(params[:page])
      .per Settings.per_page
  end

  def show
    if current_user.present?
      @new_review = current_user.reviews.build
      @new_comment = current_user.comments.build
      @user_book = UserBook.find_by user_id: current_user.id, book_id: @book.id
      @user_book = UserBook.new if @user_book == nil
    end
    @reviews = @book.reviews.order(updated_at: :desc)
      .page(params[:page]).per Settings.review_per_page
  end

  private
  def book_params
    params.require(:book).permit :id, :title, :author, :publish_date, :pages,
      :category_id, :isbn, :description, :average_rate
  end

  def load_book
    @book = Book.find_by id: params[:id]
    unless @book.present?
      flash.now[:danger] = t "views.message.not_found_book"
      redirect_to root_path
    end
  end
end
