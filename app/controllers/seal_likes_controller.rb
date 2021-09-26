class SealLikesController < ApplicationController
  def create
    current_user.seal_likes.create!(seal_id: params[:seal_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.seal_likes.find_by(seal_id: params[:seal_id]).destroy!
    redirect_back(fallback_location: root_path)
  end
end
