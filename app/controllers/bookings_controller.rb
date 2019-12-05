class BookingsController < ApplicationController
  def show
  	@booking = Booking.find(params[:id])
  	if @booking.option_id != nil
  		@option = Option.find(@booking.option_id)
  	end
  	if @booking.hostel_id != nil
  		@hostel = Hostel.find(@booking.hostel_id)
  	end
  end

  def new
  	@booking = Booking.new
  	if params[:hostels_id] != nil
  		@hostel = Hostel.find(params[:hostels_id])
  	end
  end

  def create
  	price = 20.0
  	price_without_lesson = 30.0

  	checkbox_fullboard = state_checkbox(params[:full_board])
  	checkbox_location_item = state_checkbox(params[:location_item])

  	if params[:start_date_option] != "" and params[:end_date_option] != ""
  		option = Option.create(start_date: params[:start_date_option], end_date: params[:end_date_option], price: price)
  		booking = Booking.create(start_date: params[:start_date], end_date: params[:end_date],user_id: current_user.id, hostel_id: params[:hostel], option_id: option.id, full_board: checkbox_fullboard, location_item: checkbox_location_item)
  		redirect_to booking_path(booking.id)
  	elsif params[:start_date_option] == "" and params[:end_date_option] == "" and params[:hostel] != ""
  		booking = Booking.create(start_date: params[:start_date], end_date: params[:end_date],user_id: current_user.id, hostel_id: params[:hostel], full_board: checkbox_fullboard, location_item: checkbox_location_item)
  		redirect_to booking_path(booking.id)
  	else
  		booking = Booking.create(start_date: params[:start_date], end_date: params[:end_date],user_id: current_user.id,full_board: checkbox_fullboard, location_item: checkbox_location_item)
  		redirect_to booking_path(booking.id)
  	end
  end

  private

  def state_checkbox(params)
  	if params == "1"
  		return true
  	else
  		return false
  	end
  end
end
