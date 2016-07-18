class RelationshipsController < ApplicationController
  def index
    @user = User.find_by id: params[:id]
    path = params[:path]
    @title = t "views.users.#{path}"
    @users = @user.send(path).order(updated_at: :desc).page(params[:page])
      .per Settings.per_page
  end

  def create
    @user = User.find_by id: params[:followed_id]
    if @user.present?
      current_user.follow @user
      respond_to do |format|
        format.html {redirect_to @user}
        format.js
      end
    else
      flash.now[:danger] = t "views.users.invalid_user"
      redirect_to users_path
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    if @user.present?
      current_user.unfollow @user
      respond_to do |format|
        format.html {redirect_to @user}
        format.js
      end
    else
      flash.now[:danger] = t "views.users.invalid_user"
      redirect_to users_path
    end
  end
end
