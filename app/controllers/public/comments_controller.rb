class Public::CommentsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    comment = current_user.comments.new(comment_params)
    comment.review_id = @review.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @review = Review.find(params[:review_id])
    Comment.find_by(id: params[:id], review_id: params[:review_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:review_id, :uer_id, :comment)
  end

end
