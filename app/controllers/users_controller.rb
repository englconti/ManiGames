class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @rents = Rent.where("user_id = ?", @user.id)
    @ongoing_rents = []
    @future_rents = []
    @rents.each do |rent|
      if rent.start_date <= Time.now && rent.end_date > Time.now
        @ongoing_rents << rent
      elsif rent.start_date > Time.now
        @future_rents << rent
      end
    end
  end
end
