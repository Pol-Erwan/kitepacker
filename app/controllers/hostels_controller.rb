class HostelsController < ApplicationController
  def index
    @hostels = Hostel.all

  end

  def show
    @hostel = Hostel.find(params[:id])
  end
end
