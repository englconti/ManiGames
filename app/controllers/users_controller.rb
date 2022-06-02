class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @rents = Rent.where("user_id = ?", @user.id)
  end
end
