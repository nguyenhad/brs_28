class LikesController < ApplicationController
  load_and_authorize_resource
  def create
    @like = current_user.likes.create activity_id: params[:activity_id]
    @activity = PublicActivity::Activity.find_by id: params[:activity_id]
    respond_to do |format|
      format.html {redirect_to user_path(@like.user_id)}
      format.json{render json: @like}
      format.js
    end
  end

  def destroy
    @like.destroy
    @activity = PublicActivity::Activity.find_by id: params[:activity_id]
    respond_to do |format|
      format.html {redirect_to user_path(@like.user_id)}
      format.json{render json: @like}
      format.js
    end
  end
end
