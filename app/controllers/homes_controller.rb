class HomesController < ApplicationController
  def index
    @worships = Worship.all.includes(:user).order(created_at: :desc).limit(8)
    @seals = Seal.all.includes(:user, :seal_likes).order(created_at: :desc).limit(8)
  end
end
