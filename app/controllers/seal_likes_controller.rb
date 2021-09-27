class SealLikesController < ApplicationController
  def create
    @seal = Seal.find(params[:seal_id])
    current_user.seal_likes.create!(seal_id: @seal.id)
  end

  def destroy
    @seal = Seal.find(params[:seal_id])
    current_user.seal_likes.find_by(seal_id: @seal.id).destroy!
  end
end
