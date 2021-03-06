class WorshipsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_worship, only: %i[edit update destroy]
  before_action :set_q, only: [:index, :show, :search]

  PER_PAGE = 12

  def index
    @worships = Worship.all.includes(:user, :worship_likes).order(created_at: :desc).page(params[:page]).per(PER_PAGE)
    @q = Worship.all.ransack(params[:q])
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
    @worship = current_user.worships.create(worship_params)
    if @worship.save
      redirect_to @worship, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit; end

  def update
    if @worship.update(worship_params)
      redirect_to @worship, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @worship.destroy!
    redirect_to @worship, alert: "削除しました"
  end

  def search
    @results = @q.result
  end

  private

  def worship_params
    params.require(:worship).permit(:category, :prefecture_id, :place, :date, :content, :address, { images: [] }, :images_cache, :remove_images)
  end

  def set_worship
    @worship = current_user.worships.find(params[:id])
  end

  def set_q
    @q = Worship.ransack(params[:q])
  end
end
