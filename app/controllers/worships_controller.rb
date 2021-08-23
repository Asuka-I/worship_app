class WorshipsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @worships = Worship.all
  end

  def show; end

  def new
    @worship = Worship.new
  end

  def create
    Worship.create!(category: worship_params[:category], title: worship_params[:title], place: worship_params[:place], date: worship_params[:date],
                    content: worship_params[:content], user_id: current_user.id)
  end

  def edit; end

  def update; end

  def destroy; end
end

private

def worship_params
  params.require(:worship).permit(:category, :title, :place, :date, :content)
end
