class UsersController < ApplicationController
  before_action :load_user, only: :show
  def index
    @search = User.search(params[:q])
    @users = @search.result.order(updated_at: :desc).page(params[:page])
      .per Settings.per_page
  end

  def show
    @user ||= current_user
    @favorite_books = Book.favorite_list(@user).page(params[:page])
      .per Settings.per_page
    @reading_books = Book.read_list(@user).page(params[:page]).per Settings.per_page
    @activities = PublicActivity::Activity.order(created_at: :desc)
      .where owner: @user
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :avatar, :user_role
  end

  def load_user
    @user = User.find_by id: params[:id]
  end
end
