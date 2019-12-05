class Admin::BookingsController < Admin::BasesController
  def index
    @bookings = Booking.all
  end

  def edit
      @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
      @booking.avatar.attach(params[:avatar])
      if @booking.update(full_board: params[:full_board], start_date: params[:start_date], end_date: params[:end_date], bed_booked: params[:bed_booked], user_id: params[:user_id], hostel_id: params[:hostel_id], option_id: params[:option_id])
        flash[:success] = "La reservation a bien etait modifier !"
        redirect_to admin_bookings_path
      else
        render :edit
      end
  end

  def destroy
      @booking = Booking.find(params[:id])
      @order = Order.find_by(booking_id: @booking.id)
      @order.delete
      @booking.delete
      flash[:sucess] = "L'hotel a bien etait supprimer !"
      redirect_to admin_bookings_path
    end
end
