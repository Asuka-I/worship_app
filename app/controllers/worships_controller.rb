class WorshipsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_worship, only: %i[edit update destroy]

  PER_PAGE = 16

  def index
    @worships = Worship.all.includes(:user, :worship_likes).order(created_at: :desc).page(params[:page]).per(PER_PAGE)
  end

  def show
    @worship = Worship.find(params[:id])
    @comments = @worship.comments.includes(:user)
    @comment = Comment.new
  end

  def new
    @worship = Worship.new
  end

  def create
    worship = current_user.worships.create!(worship_params)
    redirect_to worship
  end

  def edit; end

  def update
    @worship.update!(worship_params)
    redirect_to @worship
  end

  def destroy
    @worship.destroy!
    redirect_to @worship
  end

  private

  def worship_params
    params.require(:worship).permit(:category, :prefecture_id, :place, :date, :content, { images: [] }, :images_cache, :remove_images)
  end

  def set_worship
    @worship = current_user.worships.find(params[:id])
  end
end
