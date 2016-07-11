class BooksController < ApplicationController
  def index
    @books = Kaminari.paginate_array(Book.order(title: :asc)).
      page(params[:page]).per Settings.books.per_page
  end

  def show
    @book = Book.find_by id: params[:id]
  end
end
