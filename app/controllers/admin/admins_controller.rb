class Admin::AdminsController < Admin::BasesController
  def index

    @bookings = Booking.all
  
    
  end
end
