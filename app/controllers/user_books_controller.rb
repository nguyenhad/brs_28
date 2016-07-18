class UserBooksController < ApplicationController

  def new
    @user_book = UserBook.new
  end

  def create
    @user_book = UserBook.new user_book_params
    respond_to do |format|
      if @user_book.save
        format.html{redirect_to book_path(@user_book.book_id)}
        format.json{render json: @user_book}
      else
        redirect_to book_path @user_book.book_id
        format.html{redirect_to book_path(@user_book.book_id)}
        format.json{}
      end
    end
  end

  def update
    @user_book = UserBook.find_by user_id: current_user.id,
      book_id: params[:user_book][:book_id]
    respond_to do |format|
      if @user_book.update_attributes user_book_params
        format.html{redirect_to book_path(@user_book.book_id)}
        format.json{render json: @user_book}
        format.js{}
      else
        format.html{redirect_to book_path(@user_book.book_id)}
        format.json{}
        format.js{}
      end
    end
  end

  def destroy
  end

  private
  def user_book_params
    params.require(:user_book).permit :user_id, :book_id,
      :status, :is_favorite
  end
end
