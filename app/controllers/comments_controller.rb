class CommentsController < ApplicationController
  include CommentHelper
  load_and_authorize_resource

  def create
    @comment = Comment.new comment_params
    respond_to do |format|
      if @comment.save
        data = json_data @comment
        format.html{redirect_to book_path(@comment.review.book_id)}
        format.json{render json: data}
      else
        redirect_to book_path @comment.review.book_id
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit :user_id, :review_id, :content
  end
end
