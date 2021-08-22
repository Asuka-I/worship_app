class WorshipsController < ApplicationController
  def index
    @worships = Worship.all
  end

  def show; end

  def new
    @worship = Worship.new
  end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
