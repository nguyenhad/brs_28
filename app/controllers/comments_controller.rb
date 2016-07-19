class CommentsController < ApplicationController
  include CommentHelper
  load_and_authorize_resource

  def create
    @comment = Comment.new comment_params
    respond_to do |format|
      if @comment.save
        SendEmailWorkerComment.perform_async @comment.id
        data = json_data @comment
        format.html{redirect_to book_path(@comment.review.book_id)}
        format.json{render json: data}
      else
        redirect_to book_path @comment.review.book_id
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html{redirect_to book_path @comment.review.book_id}
    end
  end

  private
  def comment_params
    params.require(:comment).permit :user_id, :review_id, :content
  end
end
