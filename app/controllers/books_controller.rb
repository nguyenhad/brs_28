class BooksController < ApplicationController
  before_action :load_book, except: :index
  def index
    @search = Book.ransack params[:q]
    @books = @search.result.order(updated_at: :desc).page(params[:page])
      .per Settings.per_page
  end

  def show
    if current_user.present?
      @new_review = current_user.reviews.build
    end
      @reviews = @book.reviews.order(updated_at: :desc)
        .page(params[:page]).per Settings.per_page
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
