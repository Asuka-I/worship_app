class UsersController < ApplicationController
  before_action :authenticate_user!

  PER_PAGE = 12

  def show
    @user = User.find(params[:id])
  end

  def worships
    @user = User.find_by(id: params[:id])
    @worships = Worship.where(user_id: @user.id).page(params[:page]).per(PER_PAGE)
  end

  def seals
    @user = User.find_by(id: params[:id])
    @seals = Seal.where(user_id: @user.id).page(params[:page]).per(PER_PAGE)
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
end
