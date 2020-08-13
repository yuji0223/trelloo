class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, detail_id: params[:detail_id])
  end
end
