class SealsController < ApplicationController
  def index
    @seals = Seal.all.includes(:user).order(:created_at)
  end

  def show; end

  def new
    @seal = Seal.new
  end

  def create
    seal = current_user.seals.create!(seal_params)
    redirect_to seal
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def seal_params
    params.require(:seal).permit(:category, :title, :place, :date)
  end

end
