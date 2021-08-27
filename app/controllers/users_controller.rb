class UsersController < ApplicationController
  def show
    @worships = current_user.worships
  end
end
