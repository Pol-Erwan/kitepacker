class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @booking = Booking.where(user_id: params[:id])
    @hostel = Hostel.all
    @option = Option.all
  end
end
