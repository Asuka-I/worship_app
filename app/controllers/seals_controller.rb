class SealsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_seal, only: %i[edit update destroy]

  def index
    @seals = Seal.all.includes(:user).order(:created_at)
  end

  def show
    @seal = Seal.find(params[:id])
  end

  def new
    @seal = Seal.new
  end

  def create
    seal = current_user.seals.create!(seal_params)
    redirect_to seal
  end

  def edit; end

  def update
    @seal.update!(seal_params)
    redirect_to @seal
  end

  def destroy
    @seal.destroy!
    redirect_to @seal
  end

  private

  def seal_params
    params.require(:seal).permit(:category, :title, :place, :date)
  end

  def set_seal
    @seal = current_user.seals.find(params[:id])
  end

end
