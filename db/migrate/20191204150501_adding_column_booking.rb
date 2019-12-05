class AddingColumnBooking < ActiveRecord::Migration[5.2]
  def change
  	add_column :bookings, :location_item, :boolean
  end
end
