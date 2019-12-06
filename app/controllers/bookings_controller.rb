class BookingsController < ApplicationController
  
  before_action :authenticate_user!, only: [:show, :new, :create]

  def show
  	@booking = Booking.find(params[:id])
  	@option = nil_option(@booking.option_id)
  	@hostel = nil_hostel(@booking.hostel_id)
  end

  def new
  	@booking = Booking.new
  	if params[:hostels_id] != nil
  		@hostel = Hostel.find(params[:hostels_id])
  	end
  end

  def create
  	price_lesson = 140.0

  	checkbox_fullboard = state_checkbox(params[:full_board])
  	checkbox_location_item = state_checkbox(params[:location_item])

  	if params[:start_date_option] != "" and params[:end_date_option] != ""
  		option = Option.create(start_date: params[:start_date_option], end_date: params[:end_date_option], price: price_lesson)
  		booking = Booking.create(start_date: params[:start_date], end_date: params[:end_date],user_id: current_user.id, hostel_id: params[:hostel], option_id: option.id, full_board: checkbox_fullboard, location_item: checkbox_location_item, bed_booked: params[:bed_booked])
  		redirect_to booking_path(booking.id)
  	elsif params[:start_date_option] == "" and params[:end_date_option] == "" and params[:hostel] != ""
  		booking = Booking.create(start_date: params[:start_date], end_date: params[:end_date],user_id: current_user.id, hostel_id: params[:hostel], full_board: checkbox_fullboard, location_item: checkbox_location_item, bed_booked: params[:bed_booked])
  		redirect_to booking_path(booking.id)
  	else
  		booking = Booking.create(start_date: params[:start_date], end_date: params[:end_date],user_id: current_user.id, location_item: checkbox_location_item)
  		redirect_to booking_path(booking.id)
  	end
  end

  private

  def nil_option(option)
  	if option != nil
  		return Option.find(option)
  	end
  end

  def nil_hostel(hostel)
  	if hostel != nil
  		return Hostel.find(hostel)
  	end
  end

  def state_checkbox(params)
  	if params == "1"
  		return true
  	else
  		return false
  	end
  end
end
