class SealsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_seal, only: %i[edit update destroy]

  PER_PAGE = 12

  def index
    @seals = Seal.all.includes(:user, :seal_likes).order(created_at: :desc).page(params[:page]).per(PER_PAGE)
  end

  def show
    @seal = Seal.find(params[:id])
  end

  def new
    @seal = Seal.new
  end

  def create
    @seal = current_user.seals.create(seal_params)
    if @seal.save
      redirect_to @seal, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit; end

  def update
    if @seal.update(seal_params)
      redirect_to @seal, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :new
    end
  end

  def destroy
    @seal.destroy!
    redirect_to @seal, alert: "削除しました"
  end

  private

  def seal_params
    params.require(:seal).permit(:category, :prefecture_id, :place, :date, { images: [] })
  end

  def set_seal
    @seal = current_user.seals.find(params[:id])
  end
end
