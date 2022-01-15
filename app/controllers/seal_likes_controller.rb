class SealLikesController < ApplicationController
  def create
    current_user.seal_likes.create!(seal_id: params[:seal_id])
    @seal = Seal.find(params[:seal_id])
  end

  def destroy
    current_user.seal_likes.find_by(seal_id: params[:seal_id]).destroy!
    @seal = Seal.find(params[:seal_id])
  end
end
