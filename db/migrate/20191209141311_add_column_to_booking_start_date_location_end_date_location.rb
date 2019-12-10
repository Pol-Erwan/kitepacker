class AddColumnToBookingStartDateLocationEndDateLocation < ActiveRecord::Migration[5.2]
  def change
  	add_column :bookings, :start_date_location_item, :date
  	add_column :bookings, :end_date_location_item, :date
  end
end
