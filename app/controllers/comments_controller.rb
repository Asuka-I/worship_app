class CommentsController < ApplicationController
  def create
    current_user.comments.create(comment_params)
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, worship_id: params[:worship_id])
  end
end
