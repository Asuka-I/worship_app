class WorshipLikesController < ApplicationController
  def create
    current_user.worship_likes.create!(worship_id: params[:worship_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.worship_likes.find_by(worship_id: params[:worship_id]).destroy!
    redirect_back(fallback_location: root_path)
  end
end