class WorshipsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_worship, only: %i[edit update destroy]
  def index
    @worships = Worship.all.includes(:user).order(:created_at)
  end

  def show
    @worship = Worship.find(params[:id])
  end

  def new
    @worship = Worship.new
  end

  def create
    current_user.worships.create!(worship_params)
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
    params.require(:worship).permit(:category, :title, :place, :date, :content, { images: [] })
  end

  def set_worship
    @worship = current_user.worships.find(params[:id])
  end
end
