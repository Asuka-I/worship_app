class WorshipLikesController < ApplicationController
  def create
    current_user.worship_likes.create!(worship_id: params[:worship_id])
    @worship = Worship.find(params[:worship_id])
  end

  def destroy
    current_user.worship_likes.find_by(worship_id: params[:worship_id]).destroy!
    @worship = Worship.find(params[:worship_id])
  end
end