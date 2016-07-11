class UsersController < ApplicationController
  before_action :load_user, only: :show
  def index
    @users = Kaminari.paginate_array(User.order(name: :asc)).
      page(params[:page]).per Settings.per_page
  end

  def show
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
