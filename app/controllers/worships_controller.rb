class WorshipsController < ApplicationController
  before_action :authenticate_user!, except: :index
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
    redirect_to worship
  end

  def edit; end

  def update; end

  def destroy; end
end

private

def worship_params
  params.require(:worship).permit(:category, :title, :place, :date, :content)
end
