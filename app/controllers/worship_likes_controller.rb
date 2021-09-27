class WorshipLikesController < ApplicationController
  def create
    @worship = Worship.find(params[:worship_id])
    current_user.worship_likes.create!(worship_id: @worship.id)
  end

  def destroy
    @worship = Worship.find(params[:worship_id])
    current_user.worship_likes.find_by(worship_id: @worship.id).destroy!
  end
end