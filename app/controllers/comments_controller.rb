class CommentsController < ApplicationController
  def create
    @worship = Worship.find(params[:worship_id])
    @comment = current_user.comments.create!(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "コメントに失敗しました"
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, worship_id: params[:worship_id])
  end
end
