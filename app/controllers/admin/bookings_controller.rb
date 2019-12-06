class Admin::BookingsController < Admin::BasesController
  def index
    @bookings = Booking.all
  end

  def edit
      @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
      if @booking.update(location_item: verif_checkbox(params[:location_item]), full_board: verif_checkbox(params[:full_board]), start_date: params[:start_date], end_date: params[:end_date], bed_booked: params[:bed_booked])
        flash[:success] = "La reservation a bien etait modifier !"
        redirect_to admin_bookings_path
      else
        render :edit
      end
  end

  def destroy
      @booking = Booking.find(params[:id])
    if Order.find_by(booking_id: @booking.id) != nil
      @order = Order.find_by(booking_id: @booking.id)
      @order.delete
      @booking.delete
    else
      @booking.delete
    end
      flash[:sucess] = "L'hotel a bien etait supprimer !"
      redirect_to admin_bookings_path
    end

private

def verif_checkbox(params)

  if params == nil
    return false
  else
    return true
  end

end
end
