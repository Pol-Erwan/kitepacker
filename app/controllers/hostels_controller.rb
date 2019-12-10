class HostelsController < ApplicationController
  def index
    @hostels = Hostel.all

    @q = Hostel.search(params[:q])
    @hostels = @q.result

  end

  def show
    @hostel = Hostel.find(params[:id])
  end
end
