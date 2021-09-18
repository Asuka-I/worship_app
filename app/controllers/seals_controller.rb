class SealsController < ApplicationController
  def index
    @seals = Worship.all.includes(:user).order(:created_at)
  end

  def show; end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
