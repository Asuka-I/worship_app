class UsersController < ApplicationController
  def show
    @worships = Worship.where(user_id: current_user.id)
  end
end
