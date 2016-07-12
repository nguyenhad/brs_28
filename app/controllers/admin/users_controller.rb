class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    users = User.order(updated_at: :desc)
    @users = Kaminari.paginate_array(users).page(params[:page]).
      per Settings.per_page
  end

  def show
  end

  def destroy
    if @user.destroy
      flash[:success] = t "views.admin.user.delete_success"
    else
      flash[:danger] = t "views.admin.user.delete_fail"
    end
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :avatar, :user_role
  end
end
