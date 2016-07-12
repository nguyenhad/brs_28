class Admin::BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @books = Kaminari.paginate_array(Book.order(created_at: :desc)).
      page(params[:page]).per Settings.books.per_page
  end

  def show
  end
end
