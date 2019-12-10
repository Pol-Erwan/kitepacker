class Admin::HostelsController < Admin::BasesController
  def index
    @hostels = Hostel.all
  end

  def show
    @hostel = Hostel.find(params[:id])
    @bookings = Booking.where(hostel_id: @hostel.id)
  end

  def new
    @hostel = Hostel.new
  end

  def create
      @hostel = Hostel.new(name: params[:name], city: params[:city], address: params[:address], zip_code: params[:zip_code], bed_number: params[:bed_number], price: params[:price])
      if @hostel.save
        flash[:success] = "L'hotel a bien etait ajouter !"
        redirect_to admin_hostels_path
      else
        render :new
      end
  end

  def edit
      @hostel = Hostel.find(params[:id])
  end

  def update
    @hostel = Hostel.find(params[:id])
      @hostel.avatar.attach(params[:avatar])
      if @hostel.update(name: params[:name], city: params[:city], address: params[:address], zip_code: params[:zip_code], bed_number: params[:bed_number], price: params[:price])
        flash[:success] = "L'hotel a bien etait modifier !"
        redirect_to admin_hostels_path
      else
        render :edit
      end
  end

  def destroy
      @hostel = Hostel.find(params[:id])
      @hostel.delete
      flash[:sucess] = "L'hotel a bien etait supprimer !"
      redirect_to admin_hostels_path
    end
end
